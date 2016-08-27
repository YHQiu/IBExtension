//
//  IBDataStore+ColorAndFont.m
//  JJSMOA
//
//  Created by jjs-imac-qhy on 22/6/2016.
//  Copyright © 2016 JJSHome. All rights reserved.
//

#import "IBDataStore+ColorAndFont.h"
#import <objc/runtime.h>
#ifndef IBPlistName
#define IBPlistName @"IBExtensionStyle"
#endif
#define kHexColor(c) [self colorForHexString:c]
@implementation IBDataStore (ColorAndFont)
@dynamic uiStylePlist;
unsigned char *uiStylePlistKey;
+ (UIColor *)colorForHexString:(NSString *)colorCode{
    NSMutableString *string = [NSMutableString stringWithString:colorCode];
    [string replaceOccurrencesOfString:@"#" withString:@"" options:0 range:NSMakeRange(0, [string length])];
    
    // Check if named color exists
    NSString *colorName = [NSString stringWithFormat:@"%@Color", [string lowercaseString]];
    SEL selector = NSSelectorFromString(colorName);
    if ([[UIColor class] respondsToSelector:selector]) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[[UIColor class] methodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIColor class]];
        [invocation invoke];
        UIColor *result;
        [invocation getReturnValue:&result];
        
        return result;
    }
    
    // Check if size is enough
    NSUInteger length = [string length];
    switch (length) {
        case 1:
        // The pattern is easy to form
        [string appendFormat:@"%@%@%@%@%@", string, string, string, string, string];
        break;
        case 2:
        // Once again, repeat the pattern
        [string appendFormat:@"%@%@", string, string];
        break;
        case 3:
        // And again, repeat the pattern
        [string appendFormat:@"%@", string];
        break;
        case 4:
        // Now it's a bit more difficult, repeat, but then cut the end off
        [string appendString:[string substringToIndex: 2]];
        break;
        case 5:
        // Same as with four, but add one less
        [string appendString:[string substringToIndex: 1]];
        break;
        default:
        break;
    }
    
    // Storage for all the values
    unsigned color;
    
    // Now we can proceed to calculate the values, start by creating a range of the string to look at
    [[NSScanner scannerWithString:string] scanHexInt:&color]; // Grabs color value
    
    return [UIColor colorWithRed:(CGFloat)(((color >> 16) & 0xFF) / 255.f)
                           green:(CGFloat)(((color >> 8) & 0xFF) / 255.f)
                            blue:(CGFloat)((color & 0xFF) / 255.f)
                           alpha:1.f];
}
+ (UIColor *)colorWithKey:(NSString *)key{
    NSString *hexStr = [IBDataStore sharedInstance].uiStylePlist[@"Colors"][key];
    if (hexStr == nil) {
        return nil;
    }
    return kHexColor(hexStr);
}

+ (UIFont *)fontWithKey:(NSString *)key{
    NSDictionary *dic = [IBDataStore sharedInstance].uiStylePlist[@"Fonts"][key];
    if (dic == nil) {
        return nil;
    }
    UIFont *font;
    if ([dic[@"fontfamily"] isEqualToString:@"system"]) {
        if ([dic[@"isBold"]boolValue]) {
            font = [UIFont boldSystemFontOfSize:[dic[@"fontsize"]floatValue]];
        }
        else
        font = [UIFont systemFontOfSize:[dic[@"fontsize"]floatValue]];
    }
    else
    font = [UIFont fontWithName:dic[@"fontfamily"] size:[dic[@"fontsize"]floatValue]];
    return font;
}

- (NSDictionary *)uiStylePlist{
    if (objc_getAssociatedObject(self, &uiStylePlistKey)) {
        return objc_getAssociatedObject(self, &uiStylePlistKey);
    }
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:[self path]];
    objc_setAssociatedObject(self, &uiStylePlistKey, dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return  objc_getAssociatedObject(self, &uiStylePlistKey);
}

- (NSString *)path{
    if (self.plistFileName) {
       return [[NSBundle bundleForClass:[self class]]pathForResource:self.plistFileName ofType:@"plist"];
    }
    else
    return [[NSBundle bundleForClass:[self class]]pathForResource:IBPlistName ofType:@"plist"];
}
@end
