//
//  SettingTableData.m
//  TestSettingTable
//
//  Created by Chaos on 15/11/13.
//  Copyright © 2015年 Chaos. All rights reserved.
//

#import "SettingTableData.h"

@implementation SettingTableData

+ (SettingTableData *)dataWithPlist:(NSString *)fileName {
    NSString *file = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    NSArray *data = [NSArray arrayWithContentsOfFile:file];
    NSMutableArray *sections = [[NSMutableArray alloc] initWithCapacity:data.count];
    for (NSArray *section in data) {
        NSMutableArray *sectionModel = [[NSMutableArray alloc] initWithCapacity:section.count];
        for (NSDictionary *cell in section) {
            SettingTableRowData *rowData = [[SettingTableRowData alloc] initWithDictionary:cell];
            [sectionModel addObject:rowData];
        }
        [sections addObject:[[NSArray alloc] initWithArray:sectionModel]];
    }
    
    SettingTableData *tableData = [[SettingTableData alloc] init];
    tableData.sections = [[NSArray alloc] initWithArray:sections];
    return tableData;
}

+ (SettingTableData *)dataWithArray:(NSArray *)array {
    SettingTableData *tableData = [[SettingTableData alloc] init];
    tableData.sections = [[NSArray alloc] initWithArray:array];
    return tableData;
}

- (SettingTableRowData *)dataForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.sections[indexPath.section][indexPath.row];
}

- (SettingTableRowData *)rowDataWithTitle:(NSString *)title {
    for (NSArray *section in self.sections) {
        for (SettingTableRowData *rowData in section) {
            if ([rowData.title isEqualToString:title]) {
                return rowData;
            }
        }
    }
    return nil;
}

- (NSInteger)sectionCount {
    return self.sections.count;
}

- (NSInteger)rowCountInSection:(NSInteger)section {
    return [self.sections[section] count];
}

- (NSString *)footerTitleForSection:(NSInteger)section {
    NSArray *rows = self.sections[section];
    SettingTableRowData *rowData = [rows lastObject];
    return rowData.footer;
}

@end
