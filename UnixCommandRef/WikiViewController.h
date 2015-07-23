//
//  WikiViewController.h
//  UnixCommandRef
//
//  Created by 허광호 on 2015. 7. 8..
//  Copyright (c) 2015년 hkh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Command.h"

@interface WikiViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, strong) UIActivityViewController *activityViewController;
- (IBAction)sharePage:(id)sender;



@property (nonatomic, strong) Command *command;

- (void)setCommandData:(Command *)command;

@end
