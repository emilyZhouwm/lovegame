//
//  ViewController.m
//  lovegame
//
//  Created by zwm on 2018/7/17.
//  Copyright © 2018年 enhance. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *noTopLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *noLeftLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *okTopLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *okLeftLayout;
@property (weak, nonatomic) IBOutlet UILabel *qLbl;
@property (weak, nonatomic) IBOutlet UIButton *noBtn;
@property (weak, nonatomic) IBOutlet UIButton *okBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view layoutIfNeeded];
    _noLeftLayout.constant = (self.view.frame.size.width / 2 - 80) / 2;
    _noTopLayout.constant = self.view.frame.size.height / 2 - 44;
    _okLeftLayout.constant = _noLeftLayout.constant + self.view.frame.size.width / 2 ;
    _okTopLayout.constant = self.view.frame.size.height / 2 - 44;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)okButtonClick:(UIButton *)sender
{
    _qLbl.text = @"师父么么哒";
    [_noBtn setTitle:@"比心" forState:UIControlStateNormal];
    [_okBtn setTitle:@"比心心" forState:UIControlStateNormal];
}

- (IBAction)noButtonDown:(UIButton *)sender
{
    _okLeftLayout.constant = _noLeftLayout.constant;
    _okTopLayout.constant = _noTopLayout.constant;
    NSInteger top = 0;
    do {
        top = arc4random() % (NSInteger)(self.view.frame.size.height - 100);
    } while (top <= (NSInteger)(_okTopLayout.constant + 44) && top >= (NSInteger)(_okTopLayout.constant - 44) && top <= 50);
    NSInteger left = 0;
    do {
        left = arc4random() % (NSInteger)(self.view.frame.size.width - 100);
    } while (left <= (NSInteger)(_okLeftLayout.constant + 100) && left >= (NSInteger)(_okLeftLayout.constant - 100) && left <= 50);
    _noLeftLayout.constant = left;
    _noTopLayout.constant = top;
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
}

@end
