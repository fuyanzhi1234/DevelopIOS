//
//  BIDFourLines.m
//  Persistence
//
//  Created by yuMac on 15/9/22.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "BIDFourLines.h"

#pragma mark - variable
static NSString *const kLinesKey = @"kLinesKey";

@implementation BIDFourLines

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.lines = [aDecoder decodeObjectForKey:kLinesKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.lines forKey:kLinesKey];
}

-(id)copyWithZone:(NSZone *)zone{
    BIDFourLines *copy = [[self.class allocWithZone:zone] init];
    NSMutableArray *linesCopy = [NSMutableArray array];
    for (id line in self.lines) {
        [linesCopy addObject:line];
    }
    copy.lines = linesCopy;
    return copy;
}

@end
