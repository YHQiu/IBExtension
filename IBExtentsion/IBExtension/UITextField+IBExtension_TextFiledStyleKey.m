//
//  UITextField+IBExtension_TextFiledStyleKey.m
//  JJSMOA
//
//  Created by jjs-imac-qhy on 22/6/2016.
//  Copyright © 2016 JJSHome. All rights reserved.
//

#import "UITextField+IBExtension_TextFiledStyleKey.h"

#import <objc/runtime.h>
#import "IBDataStore+ColorAndFont.h"

@implementation UITextField (IBExtension_TextFiledStyleKey)
@dynamic textColorKey,fontKey,backgroundKey;
unsigned char *IBTF_textColorKeyKey;
unsigned char *IBTF_fontKeyKey;

- (void)setTextColorKey:(NSString *)textColorKey{
    if (textColorKey) {
        if (textColorKey.length) {
            objc_setAssociatedObject(self, &IBTF_textColorKeyKey, textColorKey, OBJC_ASSOCIATION_COPY_NONATOMIC);
            self.textColor = [IBDataStore colorWithKey:textColorKey];
        }
    }
}
- (NSString *)textColorKey{
    return objc_getAssociatedObject(self, &IBTF_textColorKeyKey);
}

- (void)setFontKey:(NSString *)fontKey{
    if (fontKey) {
        if (fontKey.length) {
            objc_setAssociatedObject(self, &IBTF_fontKeyKey, fontKey, OBJC_ASSOCIATION_COPY_NONATOMIC);
            self.font = [IBDataStore fontWithKey:fontKey]; 
        }
    }
}

- (NSString *)fontKey{
    return objc_getAssociatedObject(self, &IBTF_fontKeyKey);
}

unsigned char *tf_backgroundKeyKey;
- (void)setBackgroundKey:(NSString *)backgroundKey{
    if (backgroundKey) {
        if (backgroundKey.length) {
            objc_setAssociatedObject(self, &tf_backgroundKeyKey, backgroundKey, OBJC_ASSOCIATION_COPY);
            self.backgroundColor = [IBDataStore colorWithKey:backgroundKey];
        }
    }
}
- (NSString *)backgroundKey{
    return objc_getAssociatedObject(self, &tf_backgroundKeyKey);
}


@end
