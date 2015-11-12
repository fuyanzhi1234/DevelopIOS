//
//  Line.m
//  CoreDataPersistence
//
//  Created by yuMac on 15/9/28.
//  Copyright © 2015年 yuMac. All rights reserved.
//

#import "Line.h"

@implementation Line

// Insert code here to add functionality to your managed object subclass
- (NSArray *)getAll {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Line"];
    NSLog(@"--%@", self.entity.name);
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    return objects;
    if (objects == nil) {
        NSLog(@"Error occour : %@", error);
    }
    else {
        for (Line *oneObject in objects) {
            NSInteger lineNum = [oneObject.lineNumber integerValue];
            NSString *lineText = oneObject.lineText;
        }
    }
}
@end
