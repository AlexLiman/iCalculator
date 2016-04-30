//
//  ViewController.m
//  iCalculator
//
//  Created by Alex on 30.04.16.
//  Copyright © 2016 com.alexliman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *saveResult;

@end




@implementation ViewController {
    BOOL flagPoint;
    NSString *value;
    BOOL isStart;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    value = [[NSString alloc] init];
    flagPoint = NO;
    isStart = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Buttons

- (IBAction)actionNumberButton:(UIButton *)sender {
    
    switch (sender.tag) {
            
        case 0:
            value = [NSString stringWithFormat:@"%@0", value];
            break;
        case 1:
            value = [NSString stringWithFormat:@"%@1", value];
            break;
        case 2:
            value = [NSString stringWithFormat:@"%@2", value];
            break;
        case 3:
            value = [NSString stringWithFormat:@"%@3", value];
            break;
        case 4:
            value = [NSString stringWithFormat:@"%@4", value];
            break;
        case 5:
            value = [NSString stringWithFormat:@"%@5", value];
            break;
        case 6:
            value = [NSString stringWithFormat:@"%@6", value];
            break;
        case 7:
            value = [NSString stringWithFormat:@"%@7", value];
            break;
        case 8:
            value = [NSString stringWithFormat:@"%@8", value];
            break;
        case 9:
            value = [NSString stringWithFormat:@"%@9", value];
            break;
    }
    isStart = NO;
    self.resultLabel.text = value;
    
}
- (IBAction)actionClearButton:(UIButton *)sender {
    
    value = [[NSString alloc] init];
    self.resultLabel.text = @"0";
    self.saveResult.text = @"0";
    flagPoint = NO;
    isStart = YES;
    
}
- (IBAction)actionSaveResultButton:(UIButton *)sender {
    
    self.saveResult.text = self.resultLabel.text;
    value = [[NSString alloc] init];
    self.resultLabel.text = @"0";
    flagPoint = NO;
    isStart = YES;
    
}
- (IBAction)actionAddFractionButton:(UIButton *)sender {
    
    if (!isStart && !flagPoint) {
        
        value = [NSString stringWithFormat:@"%@.", value];
        flagPoint = YES;
        
    } else if (isStart) {
        
        value = @"0.";
        isStart = NO;
        flagPoint = YES;
        
    }
   self.resultLabel.text = value;
}
- (IBAction)actionAdditionOperationButton:(UIButton *)sender {
    
    
    
}

@end
