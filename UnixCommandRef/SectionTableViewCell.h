//
//  SectionTableViewCell.h
//  UnixCommandRef
//
//  Created by 허광호 on 2015. 7. 5..
//  Copyright (c) 2015년 hkh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Section.h"

@interface SectionTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *sectionTitle;
@property (weak, nonatomic) IBOutlet UILabel *sectionDescription;


- (void) configureCell:(Section *)section;

@end
