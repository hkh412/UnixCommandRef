//
//  CommandsTableViewController.h
//  UnixCommandRef
//
//  Created by 허광호 on 2015. 7. 5..
//  Copyright (c) 2015년 hkh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionTableViewController : UITableViewController

@property (nonatomic, strong) UIActivityViewController *activityViewController;
@property (nonatomic,strong)NSArray *mainData;

@end
