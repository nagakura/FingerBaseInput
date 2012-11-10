//
//  AppDelegate.h
//  CustomKeyboard
//
//  Created by 永倉 啓太 on 2012/11/10.
//  Copyright (c) 2012年 永倉 啓太. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FIKey.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

 +(NSDictionary *)sharedDictionary;

@end
