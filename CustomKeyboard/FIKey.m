//
//  FIKey.m
//  CustomKeyboard
//
//  Created by 永倉 啓太 on 2012/11/11.
//  Copyright (c) 2012年 永倉 啓太. All rights reserved.
//

#import "FIKey.h"
#import "AppDelegate.h"

@implementation FIKey

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		
    }
    return self;
}


-(id)initWithFrame:(CGRect)frame keyCode:(NSString *)keyCode index:(NSUInteger)index
{
    self = [super initWithFrame:frame];
    if(self){
        self.keyPair = [[AppDelegate sharedDictionary] objectForKey:keyCode];
        self.index = index;
        _keyPair = self.keyPair;
        self.presentKey = [_keyPair objectAtIndex:index];
        _presentKey = self.presentKey;
        NSLog(@"%@", _presentKey);
		
		
        [self setTitleColor:[UIColor colorWithRed:85/255 green:85/255 blue:85/255 alpha:1] forState:UIControlStateNormal];
        [self setTitle:_presentKey forState:UIControlStateNormal];
		[self setBackgroundColor:[UIColor whiteColor]];
        //[self setBackgroundImage:[UIImage imageNamed:@"keybgP"] forState:UIControlStateNormal];
        //[self setBackgroundImage:[UIImage imageNamed:@"keybgA"] forState:UIControlStateHighlighted];
    }
    return self;
}

-(id)changeIndex
{
	if (self.index==0) {
		self.index = 1;
	}else{
		self.index = 0;
	}
	self.presentKey = [_keyPair objectAtIndex:self.index];
	[self setTitle:_presentKey forState:UIControlStateNormal];
	return self;
	
}

-(id)changePresentKey:(NSString *)string
{
	self.presentKey = string;
	[self setTitle:string forState:UIControlStateNormal];
	return self;
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
