//
//  UILabel+IBExtension_LabelStyleKey.m
//  JJSMOA
//
//  Created by jjs-imac-qhy on 22/6/2016.
//  Copyright © 2016 JJSHome. All rights reserved.
//

#import "UILabel+IBExtension_LabelStyleKey.h"

#import <objc/runtime.h>
#import "IBDataStore+ColorAndFont.h"

@implementation UILabel (IBExtension_LabelStyleKey)
@dynamic textColorKey,fontKey,backgroundKey;
unsigned char *IBLB_textColorKeyKey;
unsigned char *IBLB_fontKeyKey;

- (void)setTextColorKey:(NSString *)textColorKey{
    if (textColorKey) {
        if (textColorKey.length) {
            objc_setAssociatedObject(self, &IBLB_textColorKeyKey, textColorKey, OBJC_ASSOCIATION_COPY);
            self.textColor = [IBDataStore colorWithKey:textColorKey]; 
        }
    }
}
- (NSString *)textColorKey{
    return objc_getAssociatedObject(self, &IBLB_textColorKeyKey);
}

- (void)setFontKey:(NSString *)fontKey{
    if (fontKey) {
        if (fontKey.length) {
            objc_setAssociatedObject(self, &IBLB_fontKeyKey, fontKey, OBJC_ASSOCIATION_COPY);
            self.font = [IBDataStore fontWithKey:fontKey];
        }
    }
}

- (NSString *)fontKey{
    return objc_getAssociatedObject(self, &IBLB_fontKeyKey);
}

unsigned char *lb_backgroundKeyKey;
- (void)setBackgroundKey:(NSString *)backgroundKey{
    if (backgroundKey) {
        if (backgroundKey.length) {
            objc_setAssociatedObject(self, &lb_backgroundKeyKey, backgroundKey, OBJC_ASSOCIATION_COPY);
            self.backgroundColor = [IBDataStore colorWithKey:backgroundKey];
        }
    }
}
- (NSString *)backgroundKey{
    return objc_getAssociatedObject(self, &lb_backgroundKeyKey);
}


@end
