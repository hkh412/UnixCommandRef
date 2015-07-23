//
//  CommandTableViewController.m
//  UnixCommandRef
//
//  Created by 허광호 on 2015. 7. 5..
//  Copyright (c) 2015년 hkh. All rights reserved.
//

#import "CommandTableViewController.h"
#import "CommandTableViewCell.h"
#import "Command.h"
#import "WikiViewController.h"
#import "Util.h"

@interface CommandTableViewController ()

@property (nonatomic, strong) NSMutableDictionary *offscreenCells;
@property (nonatomic, strong) UIView *customSelectionBackground;

@end

@implementation CommandTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.customSelectionBackground = [Util customSelectedBackground];
    
    [self setTitle:self.section.sectionTitle];
}

- (void) setSectionData:(Section *)section {
    
    self.section = section;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {

    return self.section.commands.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CommandTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commandCell"
                                                                 forIndexPath:indexPath];
    Command *command = self.section.commands[indexPath.row];
    [cell configureCell:command];
    cell.selectedBackgroundView = self.customSelectionBackground;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Command *command = self.section.commands[indexPath.row];
    CommandTableViewCell *cell = [self.offscreenCells objectForKey:@"commandCell"];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"commandCell"];
        [self.offscreenCells setObject:cell forKey:@"commandCell"];
    }
    [cell updateFonts];
    [cell configureCell:command];
    
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    [cell layoutIfNeeded];
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    return height + 1;  // 1 for seperator height.
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
    Command *command = self.section.commands[selectedIndex.row];
    [(WikiViewController *)[segue destinationViewController]
     setCommandData:command];
    [self.tableView deselectRowAtIndexPath:selectedIndex animated:YES];
}

@end
