//
//  CommandTableViewCell.h
//  UnixCommandRef
//
//  Created by 허광호 on 2015. 7. 8..
//  Copyright (c) 2015년 hkh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Command.h"

@interface CommandTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *commandName;
@property (weak, nonatomic) IBOutlet UILabel *commandDescription;

- (void) configureCell:(Command *)command;
- (void) updateFonts;

@end
