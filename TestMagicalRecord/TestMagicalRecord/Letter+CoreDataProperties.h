//
//  Letter+CoreDataProperties.h
//  
//
//  Created by Charlie on 16/8/7.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Letter.h"

NS_ASSUME_NONNULL_BEGIN

@interface Letter (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *content;
@property (nullable, nonatomic, retain) NSString *sender;
@property (nonatomic) NSTimeInterval time;
@property (nullable, nonatomic, retain) User *user;

@end

NS_ASSUME_NONNULL_END
