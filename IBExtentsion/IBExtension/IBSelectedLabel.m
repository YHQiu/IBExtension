//
//  IBSelectedLabel.m
//  JJSBanking
//
//  Created by jjs-imac-qhy on 27/5/2016.
//  Copyright © 2016 邱荷凌. All rights reserved.
//

#import "IBSelectedLabel.h"
#import "UIView+IBExtension.h"
@interface IBSelectedLabel()

@property (strong, nonatomic)UITapGestureRecognizer *tap;

@property (assign, nonatomic)CGFloat lastBorderWidth;

@end

IB_DESIGNABLE
@implementation IBSelectedLabel
- (void)setBorderWidth:(CGFloat)borderWidth{
    [super setBorderWidth:borderWidth];
    _lastBorderWidth = borderWidth;
}

- (void)setAllowSelected:(BOOL)allowSelected{
    _allowSelected = allowSelected;
    if (_allowSelected) {
        [self addGestureRecognizer:self.tap];
        [self setIsSelected:_isSelected];
    }
    else{
        [self removeGestureRecognizer:self.tap];
        [self setIsSelected:NO];
    }
}

- (void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    if (_allowSelected) {
        if (isSelected) {
            self.backgroundColor = self.selectedColor;
            self.layer.borderWidth = 0;
        }
        else{
            self.backgroundColor = self.normalColor;
            self.layer.borderWidth = _lastBorderWidth;
        }
    }
}

- (void)didTap{
    [self setIsSelected:!_isSelected];
}

#pragma mark - Getter
- (UITapGestureRecognizer *)tap{
    if (_tap) {
        return _tap;
    }
    _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTap)];
    return _tap;
}

@end
