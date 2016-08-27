//
//  IBTextView.h
//  IBComponent
//
//  Created by jjs-imac-qhy on 17/5/2016.
//  Copyright © 2016 YH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IBTextView : UITextView
//@property (assign, nonatomic)IBInspectable NSInteger limitLentgh;
- (void)textFieldTextLengthLimit:(NSUInteger)limitLength;
@end
