//
//  CommandsTableViewController.m
//  UnixCommandRef
//
//  Created by 허광호 on 2015. 7. 5..
//  Copyright (c) 2015년 hkh. All rights reserved.
//

#import "SectionTableViewController.h"
#import "SectionTableViewCell.h"
#import "CommandTableViewController.h"
#import "Section.h"
#import "MJExtension.h"
#import "Util.h"

@interface SectionTableViewController ()

@property (nonatomic, strong) UIView *customSelectionBackground;

@end

@implementation SectionTableViewController

static NSString *Identifier = @"sectionCell";

-(NSArray *)mainData {
    if (_mainData ==nil) {
        NSArray * dictArray = [NSArray arrayWithContentsOfFile:
                               [[NSBundle mainBundle]pathForResource:@"CmdUrl.plist" ofType:nil]];
        
        NSArray * sections = [Section objectArrayWithKeyValuesArray:dictArray];
        _mainData = sections;
    }
    return _mainData;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.customSelectionBackground = [Util customSelectedBackground];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0) {
        return self.mainData.count;
        
    } else if (section == 1) {
        return 1;
    }
    return 0;
}

- (UITableViewCell *) tableView:(UITableView *)tableView
          cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        SectionTableViewCell *sectionCell = [tableView dequeueReusableCellWithIdentifier:@"sectionCell"
                                                                            forIndexPath:indexPath];
        Section *section = self.mainData[indexPath.row];
        [sectionCell configureCell:section];
        cell = sectionCell;
        
    } else if (indexPath.section == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"actionCell"
                                               forIndexPath:indexPath];
    }
    cell.selectedBackgroundView = self.customSelectionBackground;
    
    return cell;
}

- (void) tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // process action cell
    if (indexPath.section == 1) {
        NSString *shareText = @"Check this app on AppStore: Unix Commands: Reference Book\nhttps://appsto.re/kr/a_EV8.i";
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
        NSIndexPath *selectedIndex = [self.tableView indexPathForSelectedRow];
        [self.tableView deselectRowAtIndexPath:selectedIndex animated:YES];
    }
}

/**
 *  Solution to iPad background problem
 *
 *  @param tableView <#tableView description#>
 *  @param cell      <#cell description#>
 *  @param indexPath <#indexPath description#>
 */
- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *selectedIndex = [self.tableView indexPathForSelectedRow];
    Section *section = self.mainData[selectedIndex.row];
    [(CommandTableViewController *)[segue destinationViewController] setSectionData:section];
    [self.tableView deselectRowAtIndexPath:selectedIndex animated:YES];
}

@end
