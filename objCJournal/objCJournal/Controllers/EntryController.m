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
    [IMHEntryController.shared saveToPersistentStorage];
    
}

- (void)removeEntry:(IMHEntry *)entry;
{
    [IMHEntryController.shared.entries removeObject:entry];
    [IMHEntryController.shared saveToPersistentStorage];
}

- (void)updateEntry:(IMHEntry *)entry newText:(NSString *)newText newBody:(NSString *)newBody
{
    entry.title = newText;
    entry.bodyText = newBody;
    [IMHEntryController.shared saveToPersistentStorage];
}

- (NSMutableArray *)loadEntires
{
    NSMutableArray *loadedEntries = [[NSMutableArray alloc] init];
    return loadedEntries;
}
- (void)saveToPersistentStorage
{
    NSMutableArray *dictionaryList = [[NSMutableArray alloc] init];
    
    for (IMHEntry* entry in _entries) {
        NSString *title = entry.title;
        NSString *body = entry.bodyText;
        NSDate *date = entry.date;
        NSDictionary *dictionaryEntry = @{@"title": title, @"bodyText": body, @"date":date};
        [dictionaryList addObject:dictionaryEntry];
    }
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setObject:dictionaryList forKey:@"tableviewDataText"];
}

- (void)loadFromPersistentStorage
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *arrayOfData = [userDefaults objectForKey:@"tableviewDataText"];
    NSMutableArray *reloadedDataCollection = [NSMutableArray alloc];
    for (NSDictionary* dictionary in arrayOfData) {
        IMHEntry *reloadedEntry = [[IMHEntry alloc] initWithDictionary:dictionary];
        [reloadedDataCollection addObject:reloadedEntry];
    }
    _entries = reloadedDataCollection;
}

@end
