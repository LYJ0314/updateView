//
//  SLDUpdateView.m
//  SLDToPay
//
//  Created by g on 3/26/20.
//  Copyright © 2020 ice. All rights reserved.
//

#import "SLDUpdateView.h"
@interface SLDUpdateView()
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIView *containtView;

@property (nonatomic, strong) UIImageView *topImageView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *desLabel;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@end
@implementation SLDUpdateView
+ (void)showTitle:(NSString *)title des:(NSMutableAttributedString *)des leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle superView:(UIView *)view forcedUpdate:(BOOL)forcedUpdate clickBlock:(SLDActionSuccessBlock)clickBlock{
    SLDUpdateView *updateView = [[SLDUpdateView alloc]initWithTitle:title des:des leftTitle:leftTitle rightTitle:rightTitle superView:view forcedUpdate:forcedUpdate];
    
    if (view) {
        [view addSubview:updateView];
    }else{
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        updateView.frame = [UIScreen mainScreen].bounds;
        [keyWindow addSubview:updateView];
    }
    [updateView runShowAnimationWithView];
}

-(void)runShowAnimationWithView{
    self.alpha = 0.0;
    self.transform = CGAffineTransformMakeScale(0.7, 0.7);
    self.maskView.alpha = 0.f;
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 1.0;
        self.transform = CGAffineTransformIdentity;
        self.maskView.alpha = 1.f;
    } completion:^(BOOL finished) {}];
}

- (instancetype)initWithTitle:(NSString *)title des:(NSMutableAttributedString *)des leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle superView:(UIView *)view forcedUpdate:(BOOL)forcedUpdate{
    if (self = [super initWithFrame:CGRectMake(0, 0, kScreenW_SLD, kScreenH_SLD)]){
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.backgroundView];
        [self addSubview:self.containtView];
        
        [self.containtView addSubview:self.topImageView];
        [self.containtView addSubview:self.bottomView];
        [self.bottomView addSubview:self.lineView];
        
        [self.bottomView addSubview:self.titleLabel];
        [self.bottomView addSubview:self.desLabel];
        [self.bottomView addSubview:self.leftButton];
        [self.bottomView addSubview:self.rightButton];
        
        _titleLabel.text = title;
        _desLabel.attributedText = des;
        
        [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(kScreenW_SLD);
            make.height.mas_equalTo(kScreenH_SLD);
            make.centerX.mas_equalTo(self.mas_centerX);
            make.centerY.mas_equalTo(self.mas_centerY);
         }];

        [self.containtView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(15);
            make.right.mas_equalTo(self.mas_right).offset(-15);
            make.centerX.mas_equalTo(self.mas_centerX);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        [self.topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.containtView);
            make.top.mas_equalTo(self.containtView.mas_top).offset(0);
            make.height.mas_equalTo(192);
        }];
        [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.topImageView.mas_bottom);
            make.left.right.mas_equalTo(self.containtView);
            make.height.mas_equalTo(400);
        }];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(self.bottomView);
            make.height.mas_equalTo(1);
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.bottomView.mas_left).offset(15);
            make.right.mas_equalTo(self.bottomView.mas_right).offset(-15);
            make.top.mas_equalTo(self.bottomView.mas_top).offset(10);
        }];
        [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.bottomView.mas_left).offset(15);
            make.right.mas_equalTo(self.bottomView.mas_right).offset(-15);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10);
        }];
        
        
        [self.containtView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.bottomView.mas_bottom);
        }];
        
    }
    return self;
}

#pragma mark - lazying
- (UIView *)backgroundView{
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc]init];
        _backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    }
    return _backgroundView;
}
- (UIView *)containtView{
    if (!_containtView) {
        _containtView = [[UIView alloc]init];
        _containtView.backgroundColor = [UIColor clearColor];
        _containtView.layer.cornerRadius = 6.0f;
        _containtView.layer.masksToBounds = YES;
    }
    return _containtView;
}
- (UIImageView *)topImageView{
    if (!_topImageView) {
        _topImageView = [[UIImageView alloc]init];
        _topImageView.image = [UIImage imageNamed:@"update"];
    }
    return _topImageView;
}
- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor colorWithHex:0xF2F2F2];
    }
    return _lineView;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont SLD_helveticaBoldOfSize:kSLDFitWight(16.0)];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.numberOfLines = 0;
        _titleLabel.textColor = [UIColor colorWithHex:0x000000];
//        _titleLabel.text = @"New PayBy Version Found";
    }
    return _titleLabel;
}
- (UILabel *)desLabel{
    if (!_desLabel) {
        _desLabel = [[UILabel alloc]init];
        _desLabel.font = [UIFont SLD_helveticaRegularOfSize:kSLDFitWight(14.0)];
        _desLabel.textAlignment = NSTextAlignmentLeft;
        _desLabel.numberOfLines = 0;
        _desLabel.textColor = [UIColor colorWithHex:0x888888];
//        _desLabel.text = @"New PayBy Version Found";
    }
    return _desLabel;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
