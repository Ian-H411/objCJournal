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
- (instancetype)init
{
    self = [super init];
    if (self) {
        //when we add persistence change the 2nd entries to our persistence list
        _entries = [self loadEntires];
    }
    return self;
}



- (void)addEntry:(NSString *)title bodyText:(NSString *)bodyText
{
    IMHEntry *newEntry = [[IMHEntry alloc] initWithEntryName:title bodyText:bodyText];
    [_entries addObject:newEntry];
    //save?
    
}

- (void)removeEntry:(IMHEntry *)entry;
{
    [IMHEntryController.shared.entries removeObject:entry];
}

- (void)updateEntry:(IMHEntry *)entry newText:(NSString *)newText newBody:(NSString *)newBody
{
    entry.title = newText;
    entry.bodyText = newBody;
}

- (NSMutableArray *)loadEntires
{
    NSMutableArray *loadedEntries = [[NSMutableArray alloc] init];
    return loadedEntries;
}

@end
