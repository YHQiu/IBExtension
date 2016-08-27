//
//  UIView+IBExtension.m
//  IBComponent
//
//  Created by jjs-imac-qhy on 13/5/2016.
//  Copyright © 2016 YH. All rights reserved.
//

#import "UIView+IBExtension.h"
#import <objc/runtime.h>

@implementation UIView (IBExtension)
@dynamic circular,UIStyleKey,isBaseUIStyle,borderDotted,borderWidth;
unsigned char *circularKey;
unsigned char *styleKeyKey;
unsigned char *isBaseUIStyleKey;
unsigned char *borderDottedKey;
unsigned char *borderWidthKey;
unsigned char *dottedLayerKey;
#pragma mark - Method
#if GenerateUIStylePlist
- (void)drawRect:(CGRect)rect{
    [self generateUIStylePlist];
}
#endif

/**
 *  @author 邱弘宇
 *  生成UI属性配置文件
 */
- (void)generateUIStyleXml{
   //Not implemention
}
/**
 *  @author 邱弘宇
 *  写入或者读取样式
 */
- (void)writeOrReadUIStyle{
    
    if (self.isBaseUIStyle) {
        if (self.UIStyleKey) {
            NSMutableDictionary *UIStyle = [NSMutableDictionary dictionary];
            [UIStyle setValue:self.backgroundColor forKey:@"backgroundColor"];
            [UIStyle setValue:self.borderColor forKey:@"borderColor"];
            [UIStyle setValue:@(self.borderWidth) forKey:@"borderWidth"];
            [UIStyle setValue:@(self.cornerRadius) forKey:@"cornerRadius"];
            [UIStyle setValue:@(self.circular) forKey:@"circular"];
            [[IBDataStore sharedInstance]saveDataForKey:self.UIStyleKey value:UIStyle];
        }
    }
    else{
        NSMutableDictionary *UIStyle = [[IBDataStore sharedInstance]readDataForKey:self.UIStyleKey];
        if (self.UIStyleKey) {
            for (NSString *key in UIStyle.keyEnumerator) {
                if (UIStyle[key]) {
                    [self setValue:UIStyle[key] forKey:key];
                }
            }
        }
    }

}

#pragma mark - Setter
- (void)setCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0?true:false;
}

- (void)setBorderColor:(UIColor *)borderColor{
    if (borderColor == nil) {
        self.layer.masksToBounds = NO;
        return;
    }
    if ([borderColor isEqual:[UIColor clearColor]]) {
        self.layer.masksToBounds = NO;
        return;
    }
    self.layer.masksToBounds = YES;
    self.layer.borderColor = borderColor.CGColor;
    [self drawBoderLine];
}

- (void)setBorderWidth:(CGFloat)borderWidth{
    objc_setAssociatedObject(self, &borderWidthKey, @(borderWidth), OBJC_ASSOCIATION_RETAIN);
    
    if (borderWidth > 0) {
        self.layer.masksToBounds = YES;
    }
    else{
        self.layer.masksToBounds = NO;
    }
    [self drawBoderLine];
}

- (void)setCircular:(BOOL)circular{
    objc_setAssociatedObject(self, &circularKey, @(circular), OBJC_ASSOCIATION_RETAIN);
    if (circular) {
        self.layer.masksToBounds = YES;
        CGFloat length = MIN(self.frame.size.width, self.frame.size.height);
        self.layer.cornerRadius = length/2.;
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, length, length);
    }
    else{
        [self setContentMode:self.layer.cornerRadius];
    }
}

- (void)setUIStyleKey:(NSString *)UIStyleKey{
    objc_setAssociatedObject(self, &styleKeyKey,UIStyleKey , OBJC_ASSOCIATION_COPY);
    
    [self writeOrReadUIStyle];
}
- (void)setIsBaseUIStyle:(BOOL)isBaseUIStyle{
    objc_setAssociatedObject(self, &isBaseUIStyleKey, @(isBaseUIStyle), OBJC_ASSOCIATION_RETAIN);
    
    [self writeOrReadUIStyle];
}
- (void)setBorderDotted:(BOOL)borderDotted{
    objc_setAssociatedObject(self, &borderDottedKey, @(borderDotted), OBJC_ASSOCIATION_RETAIN);
    
    [self drawBoderLine];
}

#pragma mark - Getter
- (CGFloat)cornerRadius{
    return self.layer.cornerRadius;
}
- (CGFloat)borderWidth{
    return [objc_getAssociatedObject(self, &borderWidthKey) floatValue];
}
- (UIColor *)borderColor{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}
- (BOOL)circular{
    NSNumber *circularNumber = objc_getAssociatedObject(self, &circularKey);
    if (circularNumber) {
        return [circularNumber boolValue];
    }
    return false;
}
- (NSString *)UIStyleKey{
    return objc_getAssociatedObject(self, &styleKeyKey);
}
- (BOOL)isBaseUIStyle{
    return [objc_getAssociatedObject(self, &isBaseUIStyleKey) boolValue];
}
- (BOOL)borderDotted{
    return [objc_getAssociatedObject(self, &borderDottedKey) boolValue];
}

#pragma mark - Method
- (void)drawBoderLine{
    //绘制虚线
    if (self.borderDotted) {
        self.layer.borderWidth = 0;
        
        CAShapeLayer *border = [CAShapeLayer layer];
        
        if (objc_getAssociatedObject(self, &dottedLayerKey)) {
            CALayer *borderLayer = objc_getAssociatedObject(self, &dottedLayerKey);
            [borderLayer removeFromSuperlayer];
        }
        
        objc_setAssociatedObject(self, &dottedLayerKey, border, OBJC_ASSOCIATION_RETAIN);
        
        border.strokeColor = self.borderColor.CGColor;
        
        border.fillColor = nil;
        
        border.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)].CGPath;
        
        border.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        
        border.lineWidth = 1.f;
        
        border.lineCap = @"square";
        
        border.lineDashPattern = @[@2, @2];
        
        [self.layer addSublayer:border];
    }
    //绘制实线
    else{
        self.layer.borderWidth = self.borderWidth;
    }
}


@end
