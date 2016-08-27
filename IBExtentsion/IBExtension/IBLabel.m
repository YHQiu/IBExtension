//
//  IBLabel.m
//  IBComponent
//
//  Created by jjs-imac-qhy on 12/5/2016.
//  Copyright © 2016 YH. All rights reserved.
//

#import "IBLabel.h"
#import "UIView+IBExtension.h"
#import "UILabel+IBExtension_LabelStyleKey.h"

IB_DESIGNABLE
@implementation IBLabel
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
- (void)setIsBaseUIStyle:(BOOL)isBaseUIStyle{
    [super setIsBaseUIStyle:isBaseUIStyle];
}
- (void)setBackgroundKey:(NSString *)backgroundKey{
    [super setBackgroundKey:backgroundKey];
}
- (void)setFontKey:(NSString *)fontKey{
    [super setFontKey:fontKey];
}
- (void)setTextColorKey:(NSString *)textColorKey{
    [super setTextColorKey:textColorKey];
}

@end
