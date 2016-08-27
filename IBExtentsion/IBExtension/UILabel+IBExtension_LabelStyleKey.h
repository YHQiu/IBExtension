//
//  UILabel+IBExtension_LabelStyleKey.h
//  JJSMOA
//
//  Created by jjs-imac-qhy on 22/6/2016.
//  Copyright © 2016 JJSHome. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UILabel (IBExtension_LabelStyleKey)

@property (copy, nonatomic)IBInspectable NSString *textColorKey;

@property (copy, nonatomic)IBInspectable NSString *fontKey;

@property (copy, nonatomic)IBInspectable NSString *backgroundKey;

- (void)setTextColorKey:(NSString *)titleColorKey;
- (void)setFontKey:(NSString *)fontKey;

@end
