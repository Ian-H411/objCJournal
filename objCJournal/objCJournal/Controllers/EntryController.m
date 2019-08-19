//
//  EntryController.m
//  objCJournal
//
//  Created by Ian Hall on 8/19/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import "EntryController.h"
#import "Entry.h"

@implementation IMHEntryController
//singleton
+ (IMHEntryController *)shared;
{
    static IMHEntryController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [IMHEntryController new];
    });
    return shared;
}

- (void)addEntry:(Entry *)entry;
{
    [IMHEntryController.shared.entries addObject:entry];
    //save?
    
}

- (void)removeEntry:(Entry *)entry;
{
    [IMHEntryController.shared.entries removeObject:entry];
}


@end
