//
//  CustomTextField.m
//  CustomKeyboard
//
//  Created by 永倉 啓太 on 2012/11/10.
//  Copyright (c) 2012年 永倉 啓太. All rights reserved.
//

#import "CustomTextField.h"

@implementation CustomTextField
@synthesize str;
FIKey *rowKey[10];

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithStr:(CGRect)frame str:(NSString *)_str
{
	self = [super initWithFrame:frame];
	self.str = _str;
	return self;
}

-(UIView *)inputView {
	if (!customKeyboardView) {
		CGRect accessFrame = CGRectMake(0.0, 0.0, 768.0, 400.0);
		customKeyboardView = [[UIView alloc] initWithFrame:accessFrame];
		customKeyboardView.backgroundColor = [UIColor grayColor];
		UIButton *compButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		compButton.frame = CGRectMake(60.0, 60.0, 60.0, 60.0);
		[compButton setTitle: @"a" forState:UIControlStateNormal];
		[compButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[compButton addTarget:self action:@selector(completeCurrentWord:)
				 forControlEvents:UIControlEventTouchUpInside];
		//[customKeyboardView addSubview:compButton];
		
		
		//FIKey *key = [[FIKey alloc] initWithFrame:CGRectMake(10, 10, 60, 60) keyCode:@"a" index:0];
		//[key addTarget:self action:@selector(keytest:) forControlEvents:UIControlEventTouchUpInside];
		//[customKeyboardView addSubview:key];
		
		path = [[NSBundle mainBundle] pathForResource:@"keyCode" ofType:@"plist"];
        keyPair = [NSArray arrayWithContentsOfFile:path];

        int i;
        for(i=0; i<[keyPair count]; i++){
            switch (i) {
                case 1:
                case 8:
                    frameY[i] = 10;
                    break;
                case 2:
                case 7:
                    frameY[i] = 20;
                    break;
                case 3:
                case 6:
                    frameY[i] = 10;
                    break;
                case 4:
                case 5:
                    frameY[i] = -10;
                    break;
                    
                default:
                    frameY[i] = 0;
            }
            frame = CGRectMake(5+101*i, 150-frameY[i]*5, 90, 90);
            rowKey[i] = [[FIKey alloc] initWithFrame:frame
                                             keyCode:[keyPair objectAtIndex:i] index:0];
			[customKeyboardView addSubview:rowKey[i]];
            [rowKey[i] addTarget:self action:@selector(pushKeys:) forControlEvents:UIControlEventTouchDown];
		}
	}
	return customKeyboardView;
}


-(void)pushKeys:(FIKey*)sender
{
	self.text = [self.text stringByAppendingString:sender.presentKey];
	for (int i=0; i<10; i++) {
		//rowKey[i] = [[FIKey alloc] initWithFrame:frame keyCode:[keyPair objectAtIndex:i] index:1];
		//[customKeyboardView addSubview:rowKey[i]];
		[rowKey[i] changeIndex];
	}
	if(sender.index == 0){
		temp_string = sender.presentKey;
		NSLog(temp_string);
		NSMutableString *_string = [self.text mutableCopy];
		NSLog(_string);
		self.text = [self changeString:_string];
	}
	/*else{
		NSString *temp = [self changeString:[temp_string stringByAppendingString:sender.presentKey]];
		for(int i=0; i<10; i++){
			[rowKey[i] changePresentKey:temp];
		}
	}
	 */
}


-(NSMutableString*)changeString:(NSMutableString *)str
{
	//NSMutableString* string =[[NSMutableString alloc] initWithFormat:@"kyoukaraoreha"];
	NSMutableString *string = [NSMutableString stringWithString:str];
	CFStringTransform((CFMutableStringRef)string, NULL, kCFStringTransformLatinHiragana, false);
	return string;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)inputText{
    // 入力後の文字列を取得することはできないため、入力前の文字列と入力された文字列をつなげる
    NSMutableString *afterInputText = textField.text.mutableCopy;
    [afterInputText replaceCharactersInRange:range withString:inputText];
	CFStringTransform((__bridge CFMutableStringRef)afterInputText, NULL, kCFStringTransformLatinHiragana, NO);
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
