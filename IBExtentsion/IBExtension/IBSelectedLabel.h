//
//  IBSelectedLabel.h
//  JJSBanking
//
//  Created by jjs-imac-qhy on 27/5/2016.
//  Copyright © 2016 邱荷凌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IBSelectedLabel : UILabel

/**
 *  @author 邱弘宇
 *  设置是否允许选中
 */
@property (assign, nonatomic)IBInspectable BOOL allowSelected;

/**
 *  @author 邱弘宇
 *  设置选中状态
 */
@property (assign, nonatomic)IBInspectable BOOL isSelected;

/**
 *  @author 邱弘宇
 *  设置选中颜色
 */
@property (strong, nonatomic)IBInspectable UIColor * selectedColor;

/**
 *  @author 邱弘宇
 *  设置正常颜色
 */
@property (strong, nonatomic)IBInspectable UIColor * normalColor;

@end
