//
//  FileSystemUtility.swift
//  BRUtils
//
//  Created by Ben Roaman on 4/5/25.
//

import Foundation

// MARK: Private API - Subdirectory Generators
struct FileSystemUtility {
    private static func log(_ items: Any...) {
        #if DEBUG
        print(items)
        #endif
    }
    
    static var baseCacheURL: URL? { return getBaseURL(for: .cachesDirectory) }
    static var baseDocumentsURL: URL? { return getBaseURL(for: .documentDirectory) }
    static var baseAppSupportURL: URL? { return getBaseURL(for: .applicationSupportDirectory) }
    
    static func getBaseURL(for domain: FileManager.SearchPathDirectory) -> URL? {
        return FileManager.default.urls(for: domain, in: .userDomainMask).first
    }
    
    static func getSubdirectory(of directory: URL?, with components: [String]) -> URL? {
        var result = directory
        for component in components {
            result = getSubdirectory(of: result, named: component)
        }
        
        return result
    }
    
    static func getSubdirectory(of directory: URL?, named name: String) -> URL? {
        guard let url = directory?.appendingPathComponent(name, isDirectory: true) else {
            log("FileSystemUtility :: Failed to create subdirectory of \(directory?.absoluteString ?? "nil") named \(name)")
            return nil
        }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch {
                log("FileSystemUtility :: Unable to create cache subdirectory named \(name)", "\(error)")
                return nil
            }
        }
        return url
    }
}

// MARK: Private API - Read/Write/Remove
extension FileSystemUtility {
    static func writeObject<T: Encodable>(_ object: T, to url: URL) {
        do {
            let data = try JSONEncoder().encode(object)
            FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
        } catch {
            log("FileSystemUtility :: Failed to encode object", "\(error.localizedDescription)")
        }
    }
    
    static func readObject<T: Decodable>(from fileUrl: URL, as type: T.Type) -> T? {
        if let data = FileManager.default.contents(atPath: fileUrl.path) {
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let object = try decoder.decode(type, from: data)
                return object
            } catch {
                log("FileSystemUtility :: Failed to decode data from file", "Path: \(fileUrl.path)", "\(error.localizedDescription)")
                return nil
            }
        }
        log("FileSystemUtility :: Failed to retreive data from file", "Path: \(fileUrl.path)", "File may not exist.")
        return nil
    }
    
    static func readFile(from fileURL: URL) -> Data? {
        return FileManager.default.contents(atPath: fileURL.path)
    }
    
    static func clearContents(of directory: URL) {
        guard let contentsEnumerator = FileManager.default.enumerator(at: directory, includingPropertiesForKeys: nil) else {
            return
        }
        
        while let file = contentsEnumerator.nextObject() as? URL {
            removeItem(at: file)
        }
    }
    
    @discardableResult
    static func removeItem(at url: URL) -> Bool {
        do {
            try FileManager.default.removeItem(at: url)
            return true
        } catch {
            log("FileSystemUtility :: Failed to remove file or directory", "Path: \(url.path)", "\(error.localizedDescription)")
            return false
        }
    }
}

// MARK: Debug Functions - Use to analyze a directory or json returned from a file
extension FileSystemUtility {
    static func logFileStructure() {
        func logDirectory(at url: URL, nesting: Int) {
            func nestingArrows(_ count: Int) -> String {
                var result = ""
                for _ in 0...count {
                    result += "> "
                }
                return result
            }
            
            do {
                let contents = try FileManager.default.contentsOfDirectory(atPath: url.path)
                
                for item in contents {
                    log("\(nestingArrows(nesting)) \(item)")
                    let itemURL = url.appendingPathComponent(item)
                    
                    var isDirectory: ObjCBool = false
                    FileManager.default.fileExists(atPath: itemURL.path, isDirectory: &isDirectory)
                    
                    if isDirectory.boolValue {
                        logDirectory(at: itemURL, nesting: nesting + 1)
                    }
                }
            } catch {
                log("ERROR LOGGING CONTENTS OF DOCUMENT DIRECTORY :: \(error)")
            }
        }
        
        if let cacheURL = baseCacheURL {
            log("FileSystemUtility :: Logging Cache Directory")
            logDirectory(at: cacheURL, nesting: 0)
        }
        
        if let documentsURL = baseDocumentsURL {
            log("FileSystemUtility :: Logging Documents Directory")
            logDirectory(at: documentsURL, nesting: 0)
        }
        
        if let appSupportURL = baseAppSupportURL {
            log("FileSystemUtility :: Logging Application Support Directory")
            logDirectory(at: appSupportURL, nesting: 0)
        }
    }

//        private static func analyzeJSON<T: Codable>(object: Data, type: T.Type) {
//            do {
//                let dict = try JSONSerialization.jsonObject(with: object, options: .allowFragments) as! T
//                let formattedData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
//                let jsonString = String(data: object, encoding: .utf8)
//                log(jsonString)
//                log("conversion success")
//            } catch {
//                log("conversion failure")
//            }
//        }
}

