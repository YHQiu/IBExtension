//
//  IBSearchTextFiled.m
//  JJSBanking
//
//  Created by jjs-imac-qhy on 27/5/2016.
//  Copyright © 2016 邱荷凌. All rights reserved.
//

#import "IBSearchTextFiled.h"

@interface IBSearchTextFiled()

@property (strong, nonatomic)UIImageView *searchIcon;

@property (strong, nonatomic)UIButton *voiceBtn;

@end

IB_DESIGNABLE
@implementation IBSearchTextFiled

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
}

#pragma mark - Getter
/**
 searchIcon
 */
- (UIImageView *)searchIcon{
    if(_searchIcon){
        return _searchIcon;
    }
    _searchIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    
    return _searchIcon;
}

@end
