//
//  ViewController.m
//  LongPressGesture
//
//  Created by Saikiran (Ext) on 18/04/17.
//  Copyright © 2017 Saikiran Komirishetty. All rights reserved.
//

#import "ViewController.h"
#import "LongPressGestureRecognizer.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property (weak, nonatomic) IBOutlet UIButton *longTapButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LongPressGestureRecognizer *longPressForBtnMinus = [[LongPressGestureRecognizer alloc] initWithTarget:self action:@selector(counter:)targetButton:self.longTapButton callBackMethodFrequency:SLOW];
    
    
    [self.longTapButton addGestureRecognizer:longPressForBtnMinus];

    
}

- (IBAction)counter:(id)sender {
    
    long count = [self.counterLabel.text integerValue] ? [self.counterLabel.text integerValue] : 0;
    self.counterLabel.text = [NSString stringWithFormat:@"%ld",++count];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
