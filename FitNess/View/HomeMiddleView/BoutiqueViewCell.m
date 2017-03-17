//
//  BoutiqueViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/17.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "BoutiqueViewCell.h"
@interface BoutiqueViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *MoreBtnClick;

@property (weak, nonatomic) IBOutlet UIScrollView *BoutiQueScrollView;


@end
@implementation BoutiqueViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.BoutiQueScrollView.backgroundColor=[UIColor brownColor];
        [self initUI];
    }
    return self;
}
- (void)initUI{

    self.BoutiQueScrollView.contentSize=CGSizeMake(100*10, 0);
    NSArray *ImageArray=[[NSArray alloc]initWithObjects:@"background",@"background",@"background",@"background",@"background",@"background",@"background", nil];
    for (int i=0; i<ImageArray.count; i++) {
        UIImageView *BoutiImage=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
        BoutiImage.image=[UIImage imageNamed:ImageArray[i]];
        [self.BoutiQueScrollView addSubview:BoutiImage];
    }
}
+ (instancetype)BoutiViewCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    UINib *nib=[UINib nibWithNibName:identifier bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:identifier];
    return  [tableView dequeueReusableCellWithIdentifier:identifier];
}

@end
