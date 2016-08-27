//
//  IBButton.m
//  IBComponent
//
//  Created by jjs-imac-qhy on 12/5/2016.
//  Copyright © 2016 YH. All rights reserved.
//

#import "IBButton.h"
#import "UIView+IBExtension.h"
#import "UIButton+IBExtension_ButtonStyleKey.h"

IB_DESIGNABLE
@implementation IBButton
- (void)setCircular:(BOOL)circular{
    [super setCircular:circular];
}
- (void)setBorderWidth:(CGFloat)borderWidth{
    [super setBorderWidth:borderWidth];
}
- (void)setBorderColor:(UIColor *)borderColor{
    [super setBorderColor:borderColor];
}
- (void)setCornerRadius:(CGFloat)cornerRadius{
    [super setCornerRadius:cornerRadius];
}
- (void)setUIStyleKey:(NSString *)UIStyleKey{
    [super setUIStyleKey:UIStyleKey];
}
- (void)setBorderDotted:(BOOL)borderDotted{
    [super setBorderDotted:borderDotted];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self drawBoderLine];
}

- (void)setBackgroundKey:(NSString *)backgroundKey{
    [super setBackgroundKey:backgroundKey];
}
- (void)setFontKey:(NSString *)fontKey{
    [super setFontKey:fontKey];
}
- (void)setTitleColorKey:(NSString *)textColorKey{
    [super setTitleColorKey:textColorKey];
}

@end
