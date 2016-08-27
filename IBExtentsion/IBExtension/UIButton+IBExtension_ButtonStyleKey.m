//
//  UIButton+IBExtension_ButtonStyleKey.m
//  JJSMOA
//
//  Created by jjs-imac-qhy on 22/6/2016.
//  Copyright © 2016 JJSHome. All rights reserved.
//

#import "UIButton+IBExtension_ButtonStyleKey.h"

#import <objc/runtime.h>
#import "IBDataStore+ColorAndFont.h"

@implementation UIButton (IBExtension_ButtonStyleKey)

@dynamic titleColorKey,fontKey,backgroundKey;
unsigned char *IBBtn_titleColorKeyKey;
unsigned char *IBBtn_fontKeyKey;

- (void)setTitleColorKey:(NSString *)titleColorKey{
    if (titleColorKey) {
        if (titleColorKey.length) {
            objc_setAssociatedObject(self, &IBBtn_titleColorKeyKey, titleColorKey, OBJC_ASSOCIATION_COPY_NONATOMIC);
            [self setTitleColor:[IBDataStore colorWithKey:titleColorKey] forState:UIControlStateNormal];
        }
    }
}
- (NSString *)titleColorKey{
    return objc_getAssociatedObject(self, &IBBtn_titleColorKeyKey);
}

- (void)setFontKey:(NSString *)fontKey{
    if (fontKey) {
        if (fontKey.length) {
            objc_setAssociatedObject(self, &IBBtn_fontKeyKey, fontKey, OBJC_ASSOCIATION_COPY_NONATOMIC);
            self.titleLabel.font = [IBDataStore fontWithKey:fontKey]; 
        }
    }
}

- (NSString *)fontKey{
    return objc_getAssociatedObject(self, &IBBtn_fontKeyKey);
}

unsigned char *bt_backgroundKeyKey;
- (void)setBackgroundKey:(NSString *)backgroundKey{
    if (backgroundKey) {
        if (backgroundKey.length) {
            objc_setAssociatedObject(self, &bt_backgroundKeyKey, backgroundKey, OBJC_ASSOCIATION_COPY);
            self.backgroundColor = [IBDataStore colorWithKey:backgroundKey];
        }
    }
}
- (NSString *)backgroundKey{
    return objc_getAssociatedObject(self, &bt_backgroundKeyKey);
}

@end
