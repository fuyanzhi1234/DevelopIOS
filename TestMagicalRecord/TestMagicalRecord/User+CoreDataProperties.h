//
//  User+CoreDataProperties.h
//  TestMagicalRecord
//
//  Created by Charlie on 16/8/6.
//  Copyright © 2016年 Charlie. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *uid;
@property (nullable, nonatomic, retain) NSString *showname;
@property (nullable, nonatomic, retain) NSSet<Letter *> *letter;

@end

@interface User (CoreDataGeneratedAccessors)

- (void)addLetterObject:(Letter *)value;
- (void)removeLetterObject:(Letter *)value;
- (void)addLetter:(NSSet<Letter *> *)values;
- (void)removeLetter:(NSSet<Letter *> *)values;

@end

NS_ASSUME_NONNULL_END
