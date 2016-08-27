//
//  IBCustomSearchBar.m
//  JJSBanking
//
//  Created by jjs-imac-qhy on 27/5/2016.
//  Copyright © 2016 邱荷凌. All rights reserved.
//

#import "UIView+IBExtension.h"
#import "IBCustomSearchBar.h"

IB_DESIGNABLE
@implementation IBCustomSearchBar

- (void)drawRect:(CGRect)rect{
    self.backgroundColor = [UIColor colorWithRed:218/255. green:219/255. blue:233/255. alpha:1];
    [self addSubview:self.searchTextFiled];
    
    //Place Hold Search Image
    [self setSearchImage:[UIImage imageNamed:@"Search"]];
    [self.searchImageView setTintColor:[UIColor colorWithRed:142/255. green:142/255. blue:142/255. alpha:1.]];
    
    //Place Hold Voice Btn
}

#pragma mark - Setter
- (void)setSearchImage:(UIImage *)searchImage{
    if (searchImage) {
        [self addSubview:self.searchImageView];
        self.searchImageView.image = searchImage;
        self.searchImageView.frame = CGRectMake(_searchImageView.frame.origin.x, _searchImageView.frame.origin.y, searchImage.size.width, searchImage.size.height);
        self.searchImageView.center = CGPointMake(_searchImageView.center.x, self.frame.size.height/2.f - 1.f);
        CGFloat searchImgWidth = searchImage.size.width + 3;
        
        self.searchTextFiled.frame = CGRectMake(searchImgWidth + 2, 0, self.frame.size.width - searchImgWidth, self.frame.size.height);
        self.searchTextFiled.center = CGPointMake(_searchTextFiled.center.x, self.frame.size.height/2.f);
    }
    else{
        [self.searchImageView removeFromSuperview];
        self.searchImageView.image = nil;
        self.searchImageView.frame = CGRectMake(_searchImageView.frame.origin.x, _searchImageView.frame.origin.y, 0, 0);
        self.searchTextFiled.frame = CGRectMake(15, 0, self.frame.size.width - 15, self.frame.size.height);
    }
}

- (void)setPlaceHold:(NSString *)placeHold{
    if (placeHold) {
        self.searchTextFiled.placeholder = placeHold;
    }
    else{
        self.searchTextFiled.placeholder = @"搜索";
    }
}

- (void)setFontSize:(CGFloat)fontSize{
    UIFont *font;
    if (fontSize > 0) {
        font = [UIFont systemFontOfSize:fontSize];
    }
    if (font) {
        self.searchTextFiled.font = font;
    }
    else{
        self.searchTextFiled.font = [UIFont systemFontOfSize:15.f];
    }
}

#pragma mark - Jump To Voice
- (void)jumpToVoice{
    
}

#pragma mark - Getter

/**
 SearchTextFiled
 */
- (UITextField *)searchTextFiled{
    if(_searchTextFiled){
        return _searchTextFiled;
    }
    _searchTextFiled = [[IBTextFiled alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width - 15, self.frame.size.height)];
    _searchTextFiled.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"搜索" attributes:@{
                                                                                                  NSFontAttributeName:[UIFont systemFontOfSize:14],
                                                                                                  NSForegroundColorAttributeName:[UIColor colorWithRed:142/255. green:142/255. blue:147/255. alpha:1]
                                                                                                  }];
    _searchTextFiled.font = [UIFont systemFontOfSize:16.f];
    //_searchTextFiled.limitLentgh = 40;
    return _searchTextFiled;
}

/**
 *  @author 邱弘宇
 *  searchImageView
 */
- (UIImageView *)searchImageView{
    if (_searchImageView) {
        return _searchImageView;
    }
    _searchImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 0, 0, 0)];
    return _searchImageView;
}

/**
 Voice btn
 */
- (UIButton *)voiceButton{
    if(_voiceButton){
        return _voiceButton;
    }
    _voiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _voiceButton.frame = CGRectMake(0, 0, 0, 0);
    [_voiceButton addTarget:self action:@selector(jumpToVoice) forControlEvents:UIControlEventTouchUpInside];
    
    return _voiceButton;
}



@end
