//
//  Entry.h
//  objCJournal
//
//  Created by Ian Hall on 8/19/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IMHEntry : NSObject

@property (nonatomic) NSString *title;

@property (nonatomic) NSString *bodyText;

@property (nonatomic) NSDate *date;

- (instancetype) initWithEntryName: (NSString *) name bodyText:(NSString *) bodytext;
- (NSDictionary *) dictionaryCopy;


@end

NS_ASSUME_NONNULL_END
