//
//  ViewController.m
//  WGCButtonSample
//
//  Created by Messi on 01/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import "ViewController.h"
#import "WGCButton.h"
#import <YYKit/UIView+YYAdd.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet WGCButton *wgcTopButton;

@property (strong, nonatomic) WGCButton *wgcLeftButton;
@property (strong, nonatomic) WGCButton *wgcBottomButton;
@property (strong, nonatomic) WGCButton *wgcRightButton;
@property (strong, nonatomic) UILabel *centerLabel;
@property (assign, nonatomic) BOOL isDeleting;//flag to indicate whether it is deleting button.

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //set the top image button
    [self p_setupButton];
}

#pragma mark - private methods

- (void)p_setupButton {
    self.wgcTopButton.wGCButtonType = WGCButtonTypeImageTop;
    [self.wgcTopButton setTitle:@"TouchMe" forState:UIControlStateNormal];
    [self.wgcTopButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.wgcTopButton setImage:[UIImage imageNamed:@"Top.png"] forState:UIControlStateNormal];
    
    [self.wgcTopButton addTarget:self action:@selector(createLeftButton:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - eventResponse

- (void)createLeftButton:(WGCButton *)button {
    if (_wgcLeftButton) {
        return;
    }
    
    [self.view addSubview:self.wgcLeftButton];
}

- (void)createBottomButton:(WGCButton *)button {
    if (_wgcBottomButton) {
        if (self.isDeleting) {
            [_wgcBottomButton removeFromSuperview];
            _wgcBottomButton = nil;
        }
        return;
    }
    
    if (self.isDeleting) {
        [_wgcLeftButton removeFromSuperview];
        _wgcLeftButton = nil;
        self.isDeleting = NO;
        return;
    }
    
    [self.view addSubview:self.wgcBottomButton];
}

- (void)createRightButton:(WGCButton *)button {
    if (_wgcRightButton) {
        if (self.isDeleting) {
            [_wgcRightButton removeFromSuperview];
            _wgcRightButton = nil;
        }
        return;
    }
    
    if (self.isDeleting) {
        [_wgcBottomButton removeFromSuperview];
        _wgcBottomButton = nil;
        return;
    }
    
    [self.view addSubview:self.wgcRightButton];
}

- (void)createCenterLabel:(WGCButton *)button {
    if (_centerLabel) {
        [_centerLabel removeFromSuperview];
        _centerLabel = nil;
        self.isDeleting = YES;
        return;
    }
    
    if (self.isDeleting) {
        [_wgcRightButton removeFromSuperview];
        _wgcRightButton = nil;
        return;
    }
    [self.view addSubview:self.centerLabel];
}


#pragma mark - setters&getters 

- (WGCButton *)wgcLeftButton {
    if (!_wgcLeftButton) {
        _wgcLeftButton = [WGCButton buttonWithType:UIButtonTypeCustom];
        
        _wgcLeftButton.wGCButtonType = WGCButtonTypeImageLeft;
        [_wgcLeftButton setTitle:@"TouchMe" forState:UIControlStateNormal];
        [_wgcLeftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_wgcLeftButton setImage:[UIImage imageNamed:@"Left"] forState:UIControlStateNormal];
        _wgcLeftButton.size = _wgcLeftButton.intrinsicContentSize;
        _wgcLeftButton.origin = CGPointMake(0, self.view.height/2);
        
        [_wgcLeftButton addTarget:self action:@selector(createBottomButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _wgcLeftButton;
}

- (WGCButton *)wgcBottomButton {
    if (!_wgcBottomButton) {
        _wgcBottomButton = [WGCButton buttonWithType:UIButtonTypeCustom];
        
        _wgcBottomButton.wGCButtonType = WGCButtonTypeImageBottom;
        [_wgcBottomButton setTitle:@"TouchMe" forState:UIControlStateNormal];
        [_wgcBottomButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_wgcBottomButton setImage:[UIImage imageNamed:@"Bottom"] forState:UIControlStateNormal];
        _wgcBottomButton.size = _wgcBottomButton.intrinsicContentSize;
        _wgcBottomButton.bottom = self.view.height;
        _wgcBottomButton.centerX = self.wgcTopButton.centerX;
        
        [_wgcBottomButton addTarget:self action:@selector(createRightButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _wgcBottomButton;
}

- (WGCButton *)wgcRightButton {
    if (!_wgcRightButton) {
        _wgcRightButton = [WGCButton buttonWithType:UIButtonTypeCustom];
        
        _wgcRightButton.wGCButtonType = WGCButtonTypeImageRight;
        [_wgcRightButton setTitle:@"TouchMe" forState:UIControlStateNormal];
        [_wgcRightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_wgcRightButton setImage:[UIImage imageNamed:@"Right"] forState:UIControlStateNormal];
        _wgcRightButton.size = _wgcRightButton.intrinsicContentSize;
        _wgcRightButton.right = self.view.width;
        _wgcRightButton.centerY = self.wgcLeftButton.centerY;
        
        [_wgcRightButton addTarget:self action:@selector(createCenterLabel:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _wgcRightButton;
}

- (UILabel *)centerLabel {
    if (!_centerLabel) {
        _centerLabel = [[UILabel alloc] init];
        
        _centerLabel.text = @"Thank you bro!";
        _centerLabel.textColor = [UIColor purpleColor];
        _centerLabel.font = [UIFont systemFontOfSize:20];
        _centerLabel.size = _centerLabel.intrinsicContentSize;
        _centerLabel.centerX = self.wgcTopButton.centerX;
        _centerLabel.top = self.wgcTopButton.bottom + 20;
    }
    return _centerLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
