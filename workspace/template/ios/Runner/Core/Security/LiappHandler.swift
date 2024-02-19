//
//  LiappHandler.swift
//  Runner
//
//  Created by HAKHYEON KIM on 1/12/24.
//

import Flutter
import Foundation

class LiappHandler {
  static func setMethodChannel(appDelegate: AppDelegate) {
    let controller: FlutterViewController =
      appDelegate.window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(
      name: "com.sablue.sotwo.liapp",
      binaryMessenger: controller.binaryMessenger)

    channel
      .setMethodCallHandler({ (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        switch call.method {
        case "detect":
          result(detect())
        default:
          result(FlutterMethodNotImplemented)
        }
      })
  }

  static func detect() -> Bool {
    let value = Liapp.la1()
    switch value {
    case -1, 1, 3, 7, 8:
      return true
    default:
      return false
    }
  }
}
