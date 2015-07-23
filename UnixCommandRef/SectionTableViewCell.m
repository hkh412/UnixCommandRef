//
//  SectionTableViewCell.m
//  UnixCommandRef
//
//  Created by 허광호 on 2015. 7. 5..
//  Copyright (c) 2015년 hkh. All rights reserved.
//

#import "SectionTableViewCell.h"
#import "Command.h"

@implementation SectionTableViewCell

- (void) configureCell:(Section *)section {
    
    self.sectionTitle.text = section.sectionTitle;
    self.sectionDescription.text = [self formSectionDescription:section];
}

- (NSString* ) formSectionDescription:(Section *)section {
    
    NSString *description = [[NSString alloc] init];
    NSArray *cmds = section.commands;
    
    for (Command *command in cmds) {
        description = [description
                       stringByAppendingString:[NSString
                                                stringWithFormat:@"%@, ", command.cmd]];
    }
    return description;
}

@end
