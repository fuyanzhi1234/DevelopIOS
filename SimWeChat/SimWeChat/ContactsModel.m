//
//  ContactsData.m
//  SimWeChat
//
//  Created by Charlie on 15/11/5.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "ContactsModel.h"

@interface ContactsModel()
@property (nonatomic) NSMutableDictionary *contactsDataDictionary;

@end

@implementation ContactsModel

+(id)sharedContactsModel {
    static ContactsModel *sharedContactsModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedContactsModel = [[self alloc] init];
    });
    
    return sharedContactsModel;
}

- (id)init {
    if (self = [super init]	) {
        _contactsDataDictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)addContact:(NSString *)name section:(NSString *)section headImage:(UIImage *)imageHead {
    ContactData *data = [[ContactData alloc] init];
    data.name = name;
    data.section = section;
    data.imageHead = imageHead;
    if ([_contactsDataDictionary objectForKey:section] == nil) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [array addObject:data];
        [_contactsDataDictionary setObject:array forKey:section];
    }
    else {
        NSMutableArray *contactsArray = [_contactsDataDictionary objectForKey:section];
        [contactsArray addObject:data];
    }
}

- (NSMutableDictionary *)getContacts {
    return _contactsDataDictionary;
}

- (NSArray *)getSections {
    return [[_contactsDataDictionary allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

- (ContactData *)getContactDataBySection:section andIndex:(NSInteger)index {
    if ([_contactsDataDictionary objectForKey:section]) {
        NSMutableArray *contactsArray = [_contactsDataDictionary objectForKey:section];
        return contactsArray[index];
    }
    return nil;
}

- (NSInteger)getContactsCountBySection:(NSString *)section {
    if ([_contactsDataDictionary objectForKey:section]) {
        NSMutableArray *contactsArray = [_contactsDataDictionary objectForKey:section];
        return contactsArray.count;
    }
    return 0;
}

@end
