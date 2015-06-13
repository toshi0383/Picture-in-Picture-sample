//
//  ViewController.swift
//  Xcode7Test
//
//  Created by toshi0383 on 2015/06/13.
//  Copyright © 2015年 toshi0383. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    switch indexPath.row {
    case 0:
      break
    case 1:
      let vc:OldStylePlayerViewController
      if #available(iOS 9.0, *) {
        vc = PiPOldStylePlayerViewController()
      } else {
        vc = OldStylePlayerViewController()
      }
      navigationController?.pushViewController(vc, animated: true)
    default:
      break
    }
  }

}

