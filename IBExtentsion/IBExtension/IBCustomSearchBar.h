//
//  IBCustomSearchBar.h
//  JJSBanking
//
//  Created by jjs-imac-qhy on 27/5/2016.
//  Copyright © 2016 邱荷凌. All rights reserved.
//

#import "IBTextFiled.h"
#import <UIKit/UIKit.h>

@interface IBCustomSearchBar : UIView

@property (strong, nonatomic)UITextField *searchTextFiled;

@property (strong, nonatomic)UIImageView *searchImageView;

@property (strong, nonatomic)UIButton *voiceButton;

@property (strong, nonatomic)IBInspectable UIImage *searchImage;

@property (strong, nonatomic)IBInspectable UIImage *voiceImage;

@property (strong, nonatomic)IBInspectable UIColor *placeholdTextColor;

@property (assign, nonatomic)IBInspectable CGFloat fontSize;

@property (strong, nonatomic)IBInspectable UIColor *textColor;

@property (strong, nonatomic)IBInspectable NSString *placeHold;

@end
