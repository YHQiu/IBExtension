//
//  IBTextView.m
//  IBComponent
//
//  Created by jjs-imac-qhy on 17/5/2016.
//  Copyright © 2016 YH. All rights reserved.
//

#import "IBTextView.h"
#import "UIView+IBExtension.h"
#import "UITextView+IBExtension_UIStyle.h"

IB_DESIGNABLE
@implementation IBTextView
- (void)setCircular:(BOOL)circular{
    [super setCircular:circular];
}
- (void)setBorderWidth:(CGFloat)borderWidth{
    [super setBorderWidth:borderWidth];
}
- (void)setBorderColor:(UIColor *)borderColor{
    [super setBorderColor:borderColor];
}
- (void)setCornerRadius:(CGFloat)cornerRadius{
    [super setCornerRadius:cornerRadius];
}
- (void)setUIStyleKey:(NSString *)UIStyleKey{
    [super setUIStyleKey:UIStyleKey];
}
- (void)setBackgroundKey:(NSString *)backgroundKey{
    [super setBackgroundKey:backgroundKey];
}
- (void)setFontKey:(NSString *)fontKey{
    [super setFontKey:fontKey];
}
- (void)setTextColorKey:(NSString *)textColorKey{
    [super setTextColorKey:textColorKey];
}
//- (void)setLimitLentgh:(NSInteger)limitLentgh{
//    _limitLentgh = limitLentgh;
//    if (limitLentgh) {
//        
//        [self addTarget:self action:@selector(textFieldTextLengthLimit:) forControlEvents:UIControlEventEditingChanged];
//    }
//}
- (void)textFieldTextLengthLimit:(NSUInteger)limitLength
{
    NSNumber *lengthNumber = @(limitLength);
    int length = [lengthNumber intValue];
    
    //下面是修改部分
    bool isChinese;//判断当前输入法是否是中文
    NSArray *currentar = [UITextInputMode activeInputModes];
    UITextInputMode *current = [currentar firstObject];
    //[[UITextInputMode currentInputMode] primaryLanguage]，废弃的方法
    if ([current.primaryLanguage isEqualToString:@"en-US"]) {
        isChinese = false;
    }
    else
    {
        isChinese = true;
    }
    
        // length是自己设置的位数
        NSString *str = [[self text] stringByReplacingOccurrencesOfString:@"?" withString:@""];
        if (isChinese) { //中文输入法下
            UITextRange *selectedRange = [self markedTextRange];
            //获取高亮部分
            UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
            // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (!position) {
                if ( [str length] >= length) {
                    NSString *strNew = [NSString stringWithString:str];
                    [self setText:[strNew substringToIndex:length]];
                    if ([str length] > length)
                        [self shake];
                }
            }
            else
            {
                // NSLog(@"输入的");
                
            }
        }else{
            if ([str length] >= length) {
                NSString *strNew = [NSString stringWithString:str];
                [self setText:[strNew substringToIndex:length]];
                if ([str length] > length)
                    [self shake];
                
            }
        }
    
}
- (void)shake
{
    CAKeyframeAnimation *keyAn = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [keyAn setDuration:0.5f];
    NSArray *array = [[NSArray alloc] initWithObjects:
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x-5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x+5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x-5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x+5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x-5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x+5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      nil];
    [keyAn setValues:array];
    
    NSArray *times = [[NSArray alloc] initWithObjects:
                      [NSNumber numberWithFloat:0.1f],
                      [NSNumber numberWithFloat:0.2f],
                      [NSNumber numberWithFloat:0.3f],
                      [NSNumber numberWithFloat:0.4f],
                      [NSNumber numberWithFloat:0.5f],
                      [NSNumber numberWithFloat:0.6f],
                      [NSNumber numberWithFloat:0.7f],
                      [NSNumber numberWithFloat:0.8f],
                      [NSNumber numberWithFloat:0.9f],
                      [NSNumber numberWithFloat:1.0f],
                      nil];
    [keyAn setKeyTimes:times];
    
    [self.layer addAnimation:keyAn forKey:@"TextAnim"];
}

@end
