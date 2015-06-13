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

protocol OldStylePlayerViewControllerProtocol :AVPictureInPictureControllerDelegate {
  func playInOldStyle()
}
class OldStylePlayerViewController: UIViewController, OldStylePlayerViewControllerProtocol {
  private var playerView:PlayerView!
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBarHidden = true
    playInOldStyle()
  }
  func playInOldStyle() {
    playerView = PlayerView(frame: view.frame)
    playerView.player = AVPlayer(URL: url2)
    view.addSubview(playerView)
    playerView.player.play()
  }
  override func viewDidAppear(animated: Bool) {
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
  //
  // alternative customization is expected..
  //
}
@available(iOS 9.0, *)
class PiPOldStylePlayerViewController : OldStylePlayerViewController {
  private var pipController:AVPictureInPictureController?

  override func viewDidLoad() {
    super.viewDidLoad()
    if AVPictureInPictureController.isPictureInPictureSupported() {
      pipController = AVPictureInPictureController(playerLayer: playerView.layer as! AVPlayerLayer)
      pipController?.delegate = self
      //    pipController?.startPictureInPicture()
    }
  }

  func pictureInPictureController(pictureInPictureController: AVPictureInPictureController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: (Bool) -> Void) {
    completionHandler(true)
  }
  func pictureInPictureControllerWillStartPictureInPicture(pictureInPictureController: AVPictureInPictureController) {
    print("PiP start !")
  }


}

