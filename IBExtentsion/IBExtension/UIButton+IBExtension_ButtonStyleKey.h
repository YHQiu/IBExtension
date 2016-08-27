//
//  UIButton+IBExtension_ButtonStyleKey.h
//  JJSMOA
//
//  Created by jjs-imac-qhy on 22/6/2016.
//  Copyright © 2016 JJSHome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (IBExtension_ButtonStyleKey)

@property (copy, nonatomic)IBInspectable NSString *titleColorKey;

@property (copy, nonatomic)IBInspectable NSString *fontKey;

@property (copy, nonatomic)IBInspectable NSString *backgroundKey;

- (void)setTitleColorKey:(NSString *)titleColorKey;
- (void)setFontKey:(NSString *)fontKey;

@end
