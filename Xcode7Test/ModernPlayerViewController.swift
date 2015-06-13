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

@available(iOS 8.0, *)
class ModernPlayerViewController: AVPlayerViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
//    navigationController?.navigationBarHidden = true
    play()
  }
  override func viewWillDisappear(animated: Bool) {
    player?.pause()
  }
  private func play() {
    if #available(iOS 9.0, *) {
        allowsPictureInPicturePlayback = true
    }
    player = AVPlayer(URL: url2)
    player?.play()
  }
}
