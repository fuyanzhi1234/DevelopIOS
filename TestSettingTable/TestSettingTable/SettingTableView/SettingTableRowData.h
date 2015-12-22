#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  Cell 类型，所有的 Cell 类型都可以拥有主标题(Title)，副标题(Detail)，左侧图片(Image)
 */
typedef NS_ENUM(NSInteger, SettingCellType) {
    /**
     *  纯文字，不可点击
     */
    SettingCellTypeTitle,
    /**
     *  开关，有代理方法
     */
    SettingCellTypeSwitch,
    /**
     *  可点击的 Cell，Accessory 为 Clousure 形状，有代理方法
     */
    SettingCellTypeButton,
    /**
     *  自定义 Accessory 图片的可点击 Cell，额外有针对 Accessory 的点击代理方法
     */
    SettingCellTypeButtonWithAccessory,
};

@interface SettingTableRowData : NSObject


- (instancetype)initWithDictionary:(NSDictionary *)dic;

/**
 *  类型
 */
@property (assign, nonatomic) SettingCellType type;

/**
 *  标题
 */
@property (copy, nonatomic) NSString *title;

/**
 *  副标题，一般显示在右侧
 */
@property (copy, nonatomic) NSString *detail;

/**
 *  左侧的图片
 */
@property (strong, readonly, nonatomic) UIImage *image;

/**
 *  左侧图片的文件名
 */
@property (copy, nonatomic) NSString *imageName;

/**
 *  右侧图片（用以预览内容详情）
 */
@property (strong, readonly, nonatomic) UIImage *detailImage;

/**
 *  是否有未读消息（有的话，在右侧图片右上角出现红点）
 */
@property (assign, nonatomic) BOOL hasUnreadMsg;

/**
 *  右侧图片的文件名
 */
@property (copy, nonatomic) NSString *detailImageName;

/**
 *  开关是否开启
 */
@property (assign, nonatomic) BOOL switchOn;

/**
 *  Accessory  图片
 */
@property (strong, nonatomic) UIImage *accessoryImage;

/**
 *  Accessory 图片名称
 */
@property (copy, nonatomic) NSString *accessoryImageName;

/**
 *  Accessory 点击时的图片
 */
@property (strong, nonatomic) UIImage *highlightedAccessoryImage;

/**
 *  Accessory 点击时的图片名称
 */
@property (copy, nonatomic) NSString *highlightedAccessoryImageName;

/**
 *  底部的说明性文字，注意只有 section 最后一个 model 的这个属性才会生效
 */
@property (copy, nonatomic) NSString *footer;

/**
 *  Meta，某些情况下可以通过这个属性做额外的工作
 */
@property (strong, nonatomic) NSDictionary *meta;

/**
 *  是否为不可用
 */
@property (assign, nonatomic) BOOL disabled;

@end
