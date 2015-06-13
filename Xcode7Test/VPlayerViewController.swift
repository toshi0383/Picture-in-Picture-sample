//
//  VPlayerViewController.swift
//  Xcode7Test
//
//  Created by tsuzuki on 2015/06/13.
//  Copyright © 2015年 toshi0383. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
let url1 = NSURL(string: "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8")!
let url2 = NSBundle.mainBundle().URLForResource("503_sd_mastering_modern_media_playback", withExtension: "mov")!


class VPlayerViewController: AVPlayerViewController {
  var playerView:VPlayerView!
  var urlAsset:AVURLAsset!
  var playerItem:AVPlayerItem!
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBarHidden = true
    play()
  }
  private func play() {
    if #available(iOS 9.0, *) {
        allowsPictureInPicturePlayback = true
    }
    player = AVPlayer(URL: url2)
    player?.play()
  }
  private func playInOldStyle() {
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