//
//  Line.h
//  CoreDataPersistence
//
//  Created by yuMac on 15/9/28.
//  Copyright © 2015年 yuMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CoreDataDao.h"

NS_ASSUME_NONNULL_BEGIN

@interface Line : CoreDataDao

// Insert code here to declare functionality of your managed object subclass

- (NSMutableArray *)getAll;

@end

NS_ASSUME_NONNULL_END

#import "Line+CoreDataProperties.h"
