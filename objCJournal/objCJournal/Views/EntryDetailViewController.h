//
//  EntryDetailViewController.h
//  objCJournal
//
//  Created by Ian Hall on 8/19/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "EntryController.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *journalTitleTextField;

@property (weak, nonatomic) IBOutlet UITextView *journalBodyTextField;

@property (strong,nonatomic) IMHEntry *entryLanded;

-(void) updateViews;


@end

NS_ASSUME_NONNULL_END
