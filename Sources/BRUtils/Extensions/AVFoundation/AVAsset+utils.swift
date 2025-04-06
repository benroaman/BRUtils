//
//  AVAsset+utils.swift
//  BRUtils
//
//  Created by Ben Roaman on 4/5/25.
//

import AVFoundation

extension AVAsset {
    var heightToWidthRatio: CGFloat? {
        if let videoTrack = tracks(withMediaType: AVMediaType.video).first {
            let size = videoTrack.naturalSize.applying(videoTrack.preferredTransform)
            return abs(size.height)/abs(size.width)
        } else {
            return nil
        }
    }
}
