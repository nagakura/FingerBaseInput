//
//  FIKey.h
//  CustomKeyboard
//
//  Created by 永倉 啓太 on 2012/11/11.
//  Copyright (c) 2012年 永倉 啓太. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTextField.h"

@interface FIKey : UIButton

@property (strong) NSArray *keyPair;
@property (nonatomic) NSUInteger index;
@property (strong) NSString *presentKey;

- (id)initWithFrame:(CGRect)frame keyCode:(NSString *)keyCode index:(NSUInteger)index;
- (id)changeIndex;

@end
