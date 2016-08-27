//
//  UITextField+IBExtension_TextFiledStyleKey.h
//  JJSMOA
//
//  Created by jjs-imac-qhy on 22/6/2016.
//  Copyright © 2016 JJSHome. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UITextField (IBExtension_TextFiledStyleKey)

@property (copy, nonatomic)IBInspectable NSString *textColorKey;

@property (copy, nonatomic)IBInspectable NSString *fontKey;

@property (copy, nonatomic)IBInspectable NSString *backgroundKey;

- (void)setTextColorKey:(NSString *)titleColorKey;
- (void)setFontKey:(NSString *)fontKey;
@end
