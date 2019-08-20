//
//  Entry.m
//  objCJournal
//
//  Created by Ian Hall on 8/19/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import "Entry.h"

@implementation IMHEntry

- (instancetype)initWithEntryName:(NSString *)name bodyText:(NSString *)bodytext
{
    self = [super init];
    if (self) {
        _title = name;
        _bodyText = bodytext;
        _date = [NSDate date];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self){
        if (dictionary[@"title"] == nil){
            return nil;
        } else if (dictionary[@"date"] == nil){
            return nil;
        } else if (dictionary[@"title"] == nil){
            return nil;
        }
        _title = dictionary[@"title"];
        _date = dictionary[@"date"];
        _title = dictionary[@"title"];
    }
    return self;
}


- (NSDictionary *)dictionaryCopy:(NSString *)title bodyText:(NSString *)bodytext date:(NSDate *)date
{
    NSDictionary *dictionary = @{@"title": title, @"bodyText": bodytext, @"date":date};
    return dictionary;
}
@end
