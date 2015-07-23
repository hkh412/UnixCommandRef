//
//  Sections.h
//  UnixCommandRef
//
//  Created by 허광호 on 2015. 7. 5..
//  Copyright (c) 2015년 hkh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Section : NSObject

@property (nonatomic,copy)NSString *sectionTitle;
@property (nonatomic,strong)NSArray *commands;

@end
