//
//  CustomTextField.h
//  CustomKeyboard
//
//  Created by 永倉 啓太 on 2012/11/10.
//  Copyright (c) 2012年 永倉 啓太. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FIKey.h"

@interface CustomTextField : UITextField{
	UIView *customKeyboardView;
	NSString *str;
	
	
	CGRect frame;
	int frameY[10];
	NSString *path;
	NSArray *keyPair;
}

-(id)initWithStr:(CGRect)frame str:(NSString *)str;
@property (nonatomic) NSString *str;

@end
