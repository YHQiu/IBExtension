//
//  IBTextFiled.h
//  IBComponent
//
//  Created by jjs-imac-qhy on 17/5/2016.
//  Copyright © 2016 YH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IBTextFiled : UITextField
@property (assign, nonatomic)IBInspectable NSInteger limitLentgh;
@property (strong, nonatomic)IBInspectable UIColor *placeHoldColor;
@end
