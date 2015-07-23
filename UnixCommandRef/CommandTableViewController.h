//
//  CommandTableViewController.h
//  UnixCommandRef
//
//  Created by 허광호 on 2015. 7. 5..
//  Copyright (c) 2015년 hkh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Section.h"

@interface CommandTableViewController : UITableViewController

@property (nonatomic, strong) Section *section;

- (void) setSectionData:(Section *)section;

@end
