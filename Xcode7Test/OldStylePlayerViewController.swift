//
//  VPlayerViewController.swift
//  Xcode7Test
//
//  Created by toshi0383 on 2015/06/13.
//  Copyright © 2015年 toshi0383. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
let url1 = NSURL(string: "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8")!
let url2 = NSBundle.mainBundle().URLForResource("503_sd_mastering_modern_media_playback", withExtension: "mov")!

class OldStylePlayerViewController: UIViewController {
  var playerView:VPlayerView!
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBarHidden = true
    playInOldStyle()
  }
  private func playInOldStyle() {
    playerView = VPlayerView(frame: view.frame)
    playerView.player = AVPlayer(URL: url2)
    view.addSubview(playerView)
    playerView.player.play()
    if #available(iOS 9.0, *) {
      let c = AVPictureInPictureController(playerLayer: playerView.layer as! AVPlayerLayer)
      c?.startPictureInPicture()
    }
  }
}
class VPlayerView :UIView {
  override class func layerClass() -> AnyClass {
    return AVPlayerLayer.self
  }
  var player:AVPlayer {
    get {
      let layer: AVPlayerLayer = self.layer as! AVPlayerLayer
      return layer.player!
    }
    set {
      let layer: AVPlayerLayer = self.layer as! AVPlayerLayer
      layer.player = newValue
    }
  }
}
