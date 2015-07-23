//
//  Util.m
//  UnixCommandRef
//
//  Created by 허광호 on 2015. 7. 23..
//  Copyright (c) 2015년 hkh. All rights reserved.
//

#import "Util.h"

@implementation Util

+ (UIView *) customSelectedBackground {
    
    UIView *customColorView = [[UIView alloc] init];
    customColorView.backgroundColor = [Util customTintColor];
    return customColorView;
}

+ (UIColor *) customTintColor {
    return [UIColor colorWithRed:185/255.0
                           green:185/255.0
                            blue:185/255.0
                           alpha:0.5];
}

@end
