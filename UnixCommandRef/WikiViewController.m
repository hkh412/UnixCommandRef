//
//  WikiViewController.m
//  UnixCommandRef
//
//  Created by 허광호 on 2015. 7. 8..
//  Copyright (c) 2015년 hkh. All rights reserved.
//

#import "WikiViewController.h"
#import "MBProgressHUD.h"

@interface WikiViewController () <UIWebViewDelegate>

@end

@implementation WikiViewController

- (void)setCommandData:(id)command {
    self.command = command;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:self.command.cmd];
    self.webView.delegate = self;
    
    NSString *urlString = [NSString
                           stringWithFormat:@"http://en.wikipedia.org%@", self.command.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:urlString]];
    [self.webView loadRequest:request];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (IBAction)sharePage:(id)sender {
    
    NSString *shareText = [NSString stringWithFormat:@"Check this command on wiki page: <%@> %@ From (Unix Commands iOS)",
                           self.command.cmd,
                           self.webView.request.URL.absoluteString];
    self.activityViewController = [[UIActivityViewController alloc]
                                   initWithActivityItems:@[shareText]
                                   applicationActivities:nil];
    //if iPhone
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [self presentViewController:self.activityViewController animated:YES completion:nil];
    }
    //if iPad
    else {
        // Change Rect to position Popover
        UIPopoverController *popup = [[UIPopoverController alloc] initWithContentViewController:self.activityViewController];
        [popup presentPopoverFromRect:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/4, 0, 0)inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}
@end
