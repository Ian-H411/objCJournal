//
//  EntryTableViewController.m
//  objCJournal
//
//  Created by Ian Hall on 8/19/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import "EntryTableViewController.h"
#import "EntryController.h"
#import "EntryDetailViewController.h"
@interface EntryTableViewController ()

@end

@implementation EntryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return IMHEntryController.shared.entries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    IMHEntry *entry = [IMHEntryController.shared.entries objectAtIndex:indexPath.row];
    cell.textLabel.text = [entry title];
    NSString *dateAsString = [NSDateFormatter localizedStringFromDate:[entry date] dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterLongStyle];
    cell.detailTextLabel.text = dateAsString;
    return cell;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [IMHEntryController.shared removeEntry:[IMHEntryController.shared.entries objectAtIndex:indexPath.row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqualToString: @"edit"]) {
        NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        IMHEntry *entryToSend = IMHEntryController.shared.entries[index.row];
        EntryDetailViewController *vc = [segue destinationViewController];
        vc.entryLanded = entryToSend;
        
    }
}

@end
