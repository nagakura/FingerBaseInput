//
//  ViewController.m
//  CustomKeyboard
//
//  Created by 永倉 啓太 on 2012/11/10.
//  Copyright (c) 2012年 永倉 啓太. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	//CustomTextField *textField = [[CustomTextField alloc] initWithFrame:CGRectMake(self.view.bounds.origin.x, 50, 250, 80)];
	CustomTextField *textField = [[CustomTextField alloc]initWithStr:CGRectMake(self.view.bounds.size.width/2, 10, 350, 70) str:@"ugoita-"];
	textField.borderStyle = UITextBorderStyleRoundedRect;
	[self.view addSubview:textField];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
