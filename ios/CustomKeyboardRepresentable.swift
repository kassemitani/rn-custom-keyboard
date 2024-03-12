//
//  CustomKeyboardRepresentable.swift
//  keyboard
//
//  Created by Kassem Itani on 11.03.2024.
//

import Foundation
import SwiftUI
import UIKit

struct CustomKeyboardRepresentable: UIViewRepresentable {
  class Coordinator: NSObject {
    let onKeyPress: (String) -> Void
    
    init(onKeyPress: @escaping (String) -> Void) {
      self.onKeyPress = onKeyPress
    }
  
  }
  
  var onKeyPress: (String) -> Void
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(onKeyPress: onKeyPress)
  }
  
  func makeUIView(context: Context) -> UIView {
    let hostingController = UIHostingController(rootView: CustomKeyboardView(onKeyPress: onKeyPress))
    return hostingController.view
  }
  
  func updateUIView(_ uiView: UIView, context: Context) {
    if let hostingView = uiView as? UIHostingController<CustomKeyboardView> {
      hostingView.rootView = CustomKeyboardView(onKeyPress: onKeyPress)
    }
  }
}
