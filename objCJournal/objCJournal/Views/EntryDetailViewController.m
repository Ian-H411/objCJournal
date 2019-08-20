//
//  EntryDetailViewController.m
//  objCJournal
//
//  Created by Ian Hall on 8/19/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import "EntryDetailViewController.h"

@interface EntryDetailViewController ()

@end

@implementation EntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateViews];

}
- (IBAction)clearTextButtonTapped:(id)sender {
    _journalBodyTextField.text = @"";
}
- (void)updateViews
{
    if (_entryLanded != nil)
    {
        IMHEntry *entry = _entryLanded;
        _journalBodyTextField.text = entry.bodyText;
        _journalTitleTextField.text = entry.title;
    }
}

- (IBAction)saveButtonTapped:(id)sender {
    NSString *title = _journalTitleTextField.text;
    NSString *bodyText = _journalBodyTextField.text;
    
    
    IMHEntry *entry = _entryLanded;
    if (_entryLanded != nil) {
        entry.bodyText = _journalBodyTextField.text;
        entry.title = _journalTitleTextField.text;
    } else{
        [IMHEntryController.shared addEntry:title bodyText:bodyText];
    }

    [self.navigationController popViewControllerAnimated:YES];
}


@end
