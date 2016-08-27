//
//  IBDataStore+ColorAndFont.h
//  JJSMOA
//
//  Created by jjs-imac-qhy on 22/6/2016.
//  Copyright © 2016 JJSHome. All rights reserved.
//

#import "IBDataStore.h"
#import <UIKit/UIKit.h>

@interface IBDataStore (ColorAndFont)

@property (nonatomic, strong)NSDictionary *uiStylePlist;

+ (UIColor *)colorWithKey:(NSString *)key;

+ (UIFont *)fontWithKey:(NSString *)key;

@end
