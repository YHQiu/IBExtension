//
//  IBImageView.m
//  IBComponent
//
//  Created by jjs-imac-qhy on 12/5/2016.
//  Copyright © 2016 YH. All rights reserved.
//

#import "IBImageView.h"
#import "UIView+IBExtension.h"

IB_DESIGNABLE
@implementation IBImageView
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
@end
