//
//  Line+CoreDataProperties.h
//  CoreDataPersistence
//
//  Created by yuMac on 15/9/28.
//  Copyright © 2015年 yuMac. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Line.h"

NS_ASSUME_NONNULL_BEGIN

@interface Line (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *lineNumber;
@property (nullable, nonatomic, retain) NSString *lineText;

@end

NS_ASSUME_NONNULL_END
