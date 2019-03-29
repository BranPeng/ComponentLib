//
//  EpicAlertView.m
//  SamsNowiOS
//
//  Created by Weijian Ping - Vendor on 2018/9/30.
//  Copyright © 2018 Binfeng Peng - Vendor. All rights reserved.
//

#import "EpicAlertView.h"


@interface EpicAlertView()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIView *titleBackView;

@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *sureButton;
@property (nonatomic, strong) UIButton *okButton;

@property (nonatomic, strong) UIView *line1View;
@property (nonatomic, strong) UIView *line2View;
@end

@implementation EpicAlertView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = [UIScreen pxBy375RatioWithValue:12];
        
        if ([_typeAlert isEqualToString:@"TypeEpicAlertView2"]) {
            _cancelButton.hidden = YES;
            _sureButton.hidden = YES;
            _line2View.hidden = YES;
        }else{
            _okButton.hidden = YES;
        }
    }
    return self;
}

- (void)setupUI
{
    self.backgroundColor = [UIColor whiteColor];
    
    UIView *titleBackView = [[UIView alloc] init];
    [self addSubview:titleBackView];
    _titleBackView = titleBackView;

    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.numberOfLines = 0;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont systemFontOfSize:[UIScreen pxBy375RatioWithValue:17] weight:UIFontWeightMedium];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [_titleBackView addSubview:titleLabel];
    _titleLabel = titleLabel;
    
    UILabel *detailLabel = [[UILabel alloc] init];
    detailLabel.numberOfLines = 0;
    detailLabel.textColor = [UIColor blackColor];
    detailLabel.font = [UIFont systemFontOfSize:[UIScreen pxBy375RatioWithValue:13]];
    detailLabel.textAlignment = NSTextAlignmentCenter;
    [_titleBackView addSubview:detailLabel];
    _detailLabel = detailLabel;

    
    UIView *line1View = [[UIView alloc] init];
    line1View.backgroundColor = UIColorFromRGBA(0,0,0,0.1);
    [self addSubview:line1View];
    _line1View = line1View;

    UIView *line2View = [[UIView alloc] init];
    line2View.backgroundColor = UIColorFromRGBA(0,0,0,0.1);
    [self addSubview:line2View];
    _line2View = line2View;
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:[UIScreen pxBy375RatioWithValue:17]];
    [cancelButton setTitleColor:[UIColor samsClubButtonBlue] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelButton];
    _cancelButton = cancelButton;
    
    
    UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sureButton.translatesAutoresizingMaskIntoConstraints = 0;
    sureButton.titleLabel.font = [UIFont systemFontOfSize:[UIScreen pxBy375RatioWithValue:17] weight:UIFontWeightMedium];
    [sureButton setTitleColor:[UIColor samsClubButtonBlue] forState:UIControlStateNormal];
    [sureButton addTarget:self action:@selector(sureButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:sureButton];
    _sureButton = sureButton;
    
    UIButton *okButton = [UIButton buttonWithType:UIButtonTypeCustom];
    okButton.translatesAutoresizingMaskIntoConstraints = 0;
    okButton.titleLabel.font = [UIFont systemFontOfSize:[UIScreen pxBy375RatioWithValue:17] weight:UIFontWeightMedium];
    [okButton setTitleColor:[UIColor samsClubButtonBlue] forState:UIControlStateNormal];
    [okButton addTarget:self action:@selector(okButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:okButton];
    _okButton = okButton;
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];

    _titleLabel.text = _titleString;
    CGFloat titleLabelHeight  = [self getLabelHeightWithText:_titleLabel.text width:[UIScreen pxBy375RatioWithValue:238] font:[UIScreen pxBy375RatioWithValue:17]];
    _titleLabel.frame = CGRectMake([UIScreen pxBy375RatioWithValue:16],0, [UIScreen pxBy375RatioWithValue:238],titleLabelHeight);
    
    _detailLabel.text = _detailString;
    CGFloat detailLabelHeight  = [self getLabelHeightWithText:_detailLabel.text width:[UIScreen pxBy375RatioWithValue:238] font:[UIScreen pxBy375RatioWithValue:13]];
    _detailLabel.frame = CGRectMake([UIScreen pxBy375RatioWithValue:16] , titleLabelHeight+[UIScreen pxBy375RatioWithValue:8],[UIScreen pxBy375RatioWithValue:238], detailLabelHeight);
    
    CGFloat titleBackViewHeight = 0.0;
    if (![_detailString isEqualToString:@""] &&(_detailString != nil)) {
        titleBackViewHeight  = titleLabelHeight + detailLabelHeight + [UIScreen pxBy375RatioWithValue:8];
    }else{
        titleBackViewHeight  = titleLabelHeight;
    }
    _titleBackView.frame = CGRectMake(0, [UIScreen pxBy375RatioWithValue:20], [UIScreen pxBy375RatioWithValue:272], titleBackViewHeight);

    
    _line1View.frame = CGRectMake(0, titleBackViewHeight+[UIScreen pxBy375RatioWithValue:20+20], [UIScreen pxBy375RatioWithValue:272], [UIScreen pxBy375RatioWithValue:1]);
    _line2View.frame = CGRectMake([UIScreen pxBy375RatioWithValue:136], titleBackViewHeight+ [UIScreen pxBy375RatioWithValue:1+20+20], [UIScreen pxBy375RatioWithValue:1], [UIScreen pxBy375RatioWithValue:44]);

    [_cancelButton setTitle:_cancelButtonString forState:UIControlStateNormal];
    _cancelButton.frame = CGRectMake(0,titleBackViewHeight+ [UIScreen pxBy375RatioWithValue:1+20+20], [UIScreen pxBy375RatioWithValue:136], [UIScreen pxBy375RatioWithValue:44]);
    
    [_sureButton setTitle:_sureButtonString forState:UIControlStateNormal];
    _sureButton.frame = CGRectMake([UIScreen pxBy375RatioWithValue:137], titleBackViewHeight+ [UIScreen pxBy375RatioWithValue:1+20+20], [UIScreen pxBy375RatioWithValue:135], [UIScreen pxBy375RatioWithValue:44]);
    
    [_okButton setTitle:_okButtonString forState:UIControlStateNormal];
    _okButton.frame = CGRectMake(0, titleBackViewHeight+ [UIScreen pxBy375RatioWithValue:1+20+20], [UIScreen pxBy375RatioWithValue:136*2], [UIScreen pxBy375RatioWithValue:44]);

}

- (CGFloat)getLabelHeightWithText:(NSString *)text width:(CGFloat)width font: (CGFloat)font
{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font weight:UIFontWeightMedium]} context:nil];
    return rect.size.height;
}

#pragma action
- (void)cancelButtonPressed:(UIButton *)button
{
    EPIC_BLOCK_EXEC(self.didClickCancel, button);
}

- (void)sureButtonPressed:(UIButton *)button
{
    EPIC_BLOCK_EXEC(self.didClickSure, button);
}

- (void)okButtonPressed:(UIButton *)button
{
    EPIC_BLOCK_EXEC(self.didClickOk, button);
}


@end
