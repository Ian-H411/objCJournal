//
//  Entry.m
//  objCJournal
//
//  Created by Ian Hall on 8/19/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import "Entry.h"

@implementation Entry

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
@end
