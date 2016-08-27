//
//  UITextView+IBExtension_UIStyle.m
//  JJSMOA
//
//  Created by jjs-imac-qhy on 22/6/2016.
//  Copyright © 2016 JJSHome. All rights reserved.
//

#import "UITextView+IBExtension_UIStyle.h"

#import <objc/runtime.h>
#import "IBDataStore+ColorAndFont.h"

@implementation UITextView (IBExtension_UIStyle)
@dynamic textColorKey,fontKey,backgroundKey;
unsigned char *IBTV_textColorKeyKey;
unsigned char *IBTV_fontKeyKey;

- (void)setTextColorKey:(NSString *)textColorKey{
    if (textColorKey) {
        if (textColorKey.length) {
            objc_setAssociatedObject(self, &IBTV_textColorKeyKey, textColorKey, OBJC_ASSOCIATION_COPY_NONATOMIC);
            self.textColor = [IBDataStore colorWithKey:textColorKey];
        }
    }
}
- (NSString *)textColorKey{
    return objc_getAssociatedObject(self, &IBTV_textColorKeyKey);
}

- (void)setFontKey:(NSString *)fontKey{
    if (fontKey) {
        if (fontKey.length) {
            objc_setAssociatedObject(self, &IBTV_fontKeyKey, fontKey, OBJC_ASSOCIATION_COPY_NONATOMIC);
            self.font = [IBDataStore fontWithKey:fontKey]; 
        }
    }
}

- (NSString *)fontKey{
    return objc_getAssociatedObject(self, &IBTV_fontKeyKey);
}

unsigned char *tv_backgroundKeyKey;
- (void)setBackgroundKey:(NSString *)backgroundKey{
    if (backgroundKey) {
        if (backgroundKey.length) {
            objc_setAssociatedObject(self, &tv_backgroundKeyKey, backgroundKey, OBJC_ASSOCIATION_COPY);
            self.backgroundColor = [IBDataStore colorWithKey:backgroundKey];
        }
    }
}
- (NSString *)backgroundKey{
    return objc_getAssociatedObject(self, &tv_backgroundKeyKey);
}

@end
