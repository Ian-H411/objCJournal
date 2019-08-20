//
//  EntryController.h
//  objCJournal
//
//  Created by Ian Hall on 8/19/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

NS_ASSUME_NONNULL_BEGIN

@interface IMHEntryController : NSObject

@property (nonatomic) NSMutableArray *entries;

+ (IMHEntryController *) shared;

-(void) addEntry:(NSString *)title bodyText:(NSString *)bodyText;

-(void) removeEntry:(IMHEntry *)entry;

-(void) updateEntry:(IMHEntry *)entry newText:(NSString *)newText newBody:(NSString *)newBody;

-(NSMutableArray *) loadEntires;

-(void) saveToPersistentStorage;

-(void) loadFromPersistentStorage;

@end

NS_ASSUME_NONNULL_END
