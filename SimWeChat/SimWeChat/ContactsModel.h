//
//  ContactsData.h
//  SimWeChat
//
//  Created by Charlie on 15/11/5.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ContactData.h"

@interface ContactsModel : NSObject

+(id)sharedContactsModel;

- (void)addContact:(NSString *)name section:(NSString *)section headImage:(UIImage *)imageHead;

- (NSMutableDictionary *)getContacts;

- (NSMutableArray *)getSections;

- (ContactData *)getContactDataBySection:section andIndex:(NSInteger)index;

- (NSInteger)getContactsCountBySection:(NSString *)section;

@end
