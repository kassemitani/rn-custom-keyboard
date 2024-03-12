//
//  NativeModules.m
//  keyboard
//
//  Created by Kassem Itani on 11.03.2024.
//

#import <Foundation/Foundation.h>
#import "keyboard-Bridging-Header.h"
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>


@interface RCT_EXTERN_MODULE(CustomKeyboardManager, RCTViewManager)
@end
@interface RCT_EXTERN_MODULE(CustomKeyboardEventEmitter, NSObject)

@end
