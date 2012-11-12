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
	
	NSString *temp_string;
	
}

-(id)initWithStr:(CGRect)frame str:(NSString *)str;
-(NSMutableString*)changeString:(NSMutableString*)str;
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)inputText;

@property (nonatomic) NSString *str;

@end
