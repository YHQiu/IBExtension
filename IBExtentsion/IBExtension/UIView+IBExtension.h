//
//  UIView+IBExtension.h
//  IBComponent
//
//  Created by jjs-imac-qhy on 13/5/2016.
//  Copyright © 2016 YH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IBDataStore.h"

#ifndef GenerateUIStylePlist
#define GenerateUIStylePlist NO
#endif

@interface UIView (IBExtension)

@property (assign, nonatomic)IBInspectable CGFloat cornerRadius;

@property (assign, nonatomic)IBInspectable CGFloat borderWidth;

@property (assign, nonatomic)IBInspectable UIColor *borderColor;

@property (assign, nonatomic)IBInspectable BOOL circular;

@property (copy, nonatomic)IBInspectable NSString *UIStyleKey;

@property (assign, nonatomic)IBInspectable BOOL isBaseUIStyle;

@property (assign, nonatomic)IBInspectable BOOL borderDotted;

- (void)setCornerRadius:(CGFloat)cornerRadius;
- (void)setBorderColor:(UIColor *)borderColor;
- (void)setBorderWidth:(CGFloat)borderWidth;
- (void)setCircular:(BOOL)circular;
- (void)setUIStyleKey:(NSString *)UIStyleKey;
- (void)setIsBaseUIStyle:(BOOL)isBaseUIStyle;
- (void)setBorderDotted:(BOOL)borderDotted;

- (void)drawBoderLine;
@end
