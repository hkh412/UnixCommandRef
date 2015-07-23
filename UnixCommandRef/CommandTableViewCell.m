//
//  CommandTableViewCell.m
//  UnixCommandRef
//
//  Created by 허광호 on 2015. 7. 8..
//  Copyright (c) 2015년 hkh. All rights reserved.
//

#import "CommandTableViewCell.h"

@implementation CommandTableViewCell

- (void) configureCell:(Command *)command {
    
    self.commandName.text = command.cmd;
    self.commandDescription.text = command.desc;
}

- (void) updateFonts {
    
//    self.commandName.font = [UIFont fontWithName:@"Avenir Next Medium Italic" size:21];
    self.commandDescription.font = [UIFont fontWithName:@"Avenir Next Regular" size:15];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Make sure the contentView does a layout pass here so that its subviews have their frames set, which we
    // need to use to set the preferredMaxLayoutWidth below.
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    // Set the preferredMaxLayoutWidth of the mutli-line bodyLabel based on the evaluated width of the label's frame,
    // as this will allow the text to wrap correctly, and as a result allow the label to take on the correct height.
    self.commandDescription.preferredMaxLayoutWidth = CGRectGetWidth(self.commandDescription.frame);
}
@end
