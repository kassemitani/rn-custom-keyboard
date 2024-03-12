//
//  CustomKeyboardEventEmitter.swift
//  keyboard
//
//  Created by Kassem Itani on 11.03.2024.
//

import Foundation
import React

@objc(CustomKeyboardEventEmitter)
class CustomKeyboardEventEmitter: RCTEventEmitter {
  
  public static var emitter: RCTEventEmitter!

  override init() {
    super.init()
    CustomKeyboardEventEmitter.emitter = self
  }

  override func supportedEvents() -> [String] {
    return ["onKeyPress"]
  }
  
  @objc override static func requiresMainQueueSetup() -> Bool {
    return true
  }

}
