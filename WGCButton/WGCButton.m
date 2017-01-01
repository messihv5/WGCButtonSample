//
//  WGCButton.m
//  CustomViewTopBar
//
//  Created by Messi on 28/12/2016.
//  Copyright © 2016 WangXD. All rights reserved.
//

#import "WGCButton.h"
#import <YYKit/UIView+YYAdd.h>

@interface WGCButton ()

@end

@implementation WGCButton

- (instancetype)initWithButtonType:(WGCButtonType)buttonType {
    self = [super init];
    if (self) {
        _wGCButtonType = buttonType;
    }
    return self;
}

//according to layout to calculate the intrinsicContentSize
- (CGSize)intrinsicContentSize {
    float imageWidth = self.imageView.intrinsicContentSize.width;
    float imageHeight = self.imageView.intrinsicContentSize.height;
    float labelWidth = self.titleLabel.intrinsicContentSize.width;
    float labelHeight = self.titleLabel.intrinsicContentSize.height;
    
    float maxWidth = MAX(imageWidth, labelWidth);
    float maxHeight = MAX(imageHeight, labelHeight);
    
    switch (self.wGCButtonType) {
        case WGCButtonTypeImageTop:
        case WGCButtonTypeImageBottom:{
            return CGSizeMake(maxWidth, imageHeight+self.padding+labelHeight);
            break;
        }
        case WGCButtonTypeImageLeft:
        case WGCButtonTypeImageRight:{
            return CGSizeMake(imageWidth+self.padding+labelWidth, maxHeight);
            break;
        }
    }
}

- (void)layoutSubviews {
    //invoke super to layout the subviews
    [super layoutSubviews];
    
    self.imageView.size = self.imageView.intrinsicContentSize;
    self.titleLabel.size = self.titleLabel.intrinsicContentSize;
    
    //change the position of imageView and label
    float x = self.width-self.imageView.width-self.padding-self.titleLabel.width;
    float y = self.height-self.imageView.height-self.padding-self.titleLabel.height;
    
    x = x/2;
    y = y/2;
    
    switch (self.wGCButtonType) {
        case WGCButtonTypeImageTop:{
            [self positionImageViewTop:y];
            break;
        }
        case WGCButtonTypeImageLeft:{
            [self positionImageViewLeft:x];
            break;
        }
        case WGCButtonTypeImageBottom:{
            [self positionImageViewBottom:y];
            break;
        }
        case WGCButtonTypeImageRight:{
            [self positionImageViewRight:x];
            break;}
    }
}

- (void)positionImageViewTop:(float)topInset {
    self.imageView.center = CGPointMake(self.width/2, topInset+self.imageView.height/2);
    self.titleLabel.center = CGPointMake(self.width/2, self.height-topInset-self.titleLabel.height/2);
}

- (void)positionImageViewLeft:(float)leftInset {
    self.imageView.center = CGPointMake(leftInset+self.imageView.width/2, self.height/2);
    self.titleLabel.center = CGPointMake(self.width-leftInset-self.titleLabel.width/2, self.height/2);
}

- (void)positionImageViewBottom:(float)bottonInset {
    self.imageView.center = CGPointMake(self.width/2, self.height-bottonInset-self.imageView.height/2);
    self.titleLabel.center = CGPointMake(self.width/2, bottonInset+self.titleLabel.height/2);
}

- (void)positionImageViewRight:(float)rightInset {
    self.imageView.center = CGPointMake(self.width-rightInset-self.imageView.width/2, self.height/2);
    self.titleLabel.center = CGPointMake(rightInset+self.titleLabel.width/2, self.height/2);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
