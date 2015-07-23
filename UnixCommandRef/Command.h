//
//  Commands.h
//  UnixCommandRef
//
//  Created by 허광호 on 2015. 7. 5..
//  Copyright (c) 2015년 hkh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Command : NSObject

@property (nonatomic,copy)NSString *cmd;
@property (nonatomic,copy)NSString *url;
@property (nonatomic,copy)NSString *desc;

@end
