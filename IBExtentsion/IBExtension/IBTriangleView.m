//
//  IBTriangleView.m
//  JJSOA
//
//  Created by jjs-imac-qhy on 1/6/2016.
//  Copyright © 2016 JJSHome. All rights reserved.
//

#import "IBTriangleView.h"
#import "IBExtension.h"

IB_DESIGNABLE
@implementation IBTriangleView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    if (!_strokColor) {
        _strokColor = [UIColor darkGrayColor];
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, rect.size.height);
    CGPathAddLineToPoint(path, NULL, rect.size.width/2.f, 0);
    CGPathAddLineToPoint(path, NULL, rect.size.width, rect.size.height);
    [self.strokColor setStroke];
    
    CGContextAddPath(context, path);
    CGContextDrawPath(context, kCGPathStroke);
    
}
- (void)setStrokColor:(UIColor *)strokColor{
    [self drawRect:self.frame];
}

@end
