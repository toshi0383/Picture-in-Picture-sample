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

@available(iOS 9.0, *)
class OldStylePlayerViewController: UIViewController,AVPictureInPictureControllerDelegate {
  private var playerView:PlayerView!
  private var pipController:AVPictureInPictureController?
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBarHidden = true
    playInOldStyle()
  }
  private func playInOldStyle() {
    playerView = PlayerView(frame: view.frame)
    playerView.player = AVPlayer(URL: url2)
    view.addSubview(playerView)
    playerView.player.play()

    if AVPictureInPictureController.isPictureInPictureSupported() {
      pipController = AVPictureInPictureController(playerLayer: playerView.layer as! AVPlayerLayer)
      pipController?.delegate = self
    }
  }
  override func viewDidAppear(animated: Bool) {
//    pipController?.startPictureInPicture()
  }
  private class PlayerView :UIView {
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
  func pictureInPictureController(pictureInPictureController: AVPictureInPictureController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: (Bool) -> Void) {
    completionHandler(true)
  }
  func pictureInPictureControllerWillStartPictureInPicture(pictureInPictureController: AVPictureInPictureController) {
    print("PiP start !")
  }
}

