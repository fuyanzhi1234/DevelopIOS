//
//  ContactsTableViewCell.m
//  SimWeChat
//
//  Created by Charlie on 15/10/27.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "ContactsTableViewCell.h"
@interface ContactsTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;

@end

@implementation ContactsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(NSString *)userName userImage:(UIImage *)image {
    [self.userImage setImage:image];
    [self.userName setText:userName];
}


@end
