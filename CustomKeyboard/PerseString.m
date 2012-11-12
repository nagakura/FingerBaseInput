//
//  PerseString.m
//  CustomKeyboard
//
//  Created by 永倉 啓太 on 2012/11/12.
//  Copyright (c) 2012年 永倉 啓太. All rights reserved.
//

#import "PerseString.h"

@implementation PerseString
//@implementation NSString (Henkan)

- (NSString*) stringTransformWithTransform:(CFStringRef)transform reverse:(Boolean)reverse {
    NSMutableString* retStr = [[NSMutableString alloc] initWithString:self];
    CFStringTransform((CFMutableStringRef)retStr, NULL, transform, reverse);
    return retStr;
}

- (NSString*) stringLatinToHiragana {
    return [self stringTransformWithTransform:kCFStringTransformLatinHiragana
                                      reverse:false];
}


@end
