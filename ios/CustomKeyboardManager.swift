//
//  CustomKeyboardManager.swift
//  keyboard
//
//  Created by Kassem Itani on 11.03.2024.
//

import Foundation
import React
import SwiftUI

@objc(CustomKeyboardManager)
class CustomKeyboardManager: RCTViewManager {
  
  override func view() -> UIView! {
    
    let view = CustomKeyboardRepresentable(onKeyPress: { (keyValue) in
      var key = keyValue
      
      if(keyValue == "X") {
        key = "DELETE"
      }
      
      CustomKeyboardEventEmitter.emitter.sendEvent(withName: "onKeyPress", body: ["key": key])
      
    })
    
    let containerView = UIView()
    let childView = UIHostingController(rootView: view).view!
    childView.translatesAutoresizingMaskIntoConstraints = false
    containerView.addSubview(childView)
    
    // Set constraints for childView to match the containerView
    NSLayoutConstraint.activate([
      childView.topAnchor.constraint(equalTo: containerView.topAnchor),
      childView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
      childView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
      childView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
    ])
    
    return containerView
  }
  
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  // Expose this module to the React Native bridge
  @objc override static func moduleName() -> String! {
      return "CustomKeyboard"
  }
}
