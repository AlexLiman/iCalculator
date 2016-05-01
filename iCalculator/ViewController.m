//
//  ViewController.m
//  iCalculator
//
//  Created by Alex on 30.04.16.
//  Copyright © 2016 com.alexliman. All rights reserved.
//
//Ученик.
//
//1. Создайте и разместите кнопки цифр и операторов, создайте нужные акшины
//2. Добавьте лейбл и создайте соответствующий проперти
//3. По нажатию на кнопку на индикатор должна выводиться либо цифра, либо оператор (никаких вычислений - выводим просто значения кнопок)
//
//Студент.
//
//4. Наведите более / менее красоту, можете насоздавать линий (вьюхи с малой шириной)б ставить бэкграундыб используйте картинки если надо и тд. - проявите творчество :)
//5. Сделайте так, чтобы когда нажимаешь на цифровую кнопку, то число росло
//6. Сделайте кнопку сброса
//
//Мастер.
//
//7. Сохраняйте вводимое число
//8. Первую операцию тоже надо сохранить, пока не ввели второе число (используйте енумы!)
//9. Когда нажимаешь равно то первое число выболняет операцию над вторым и выводится результат
//10. После того, как результат вывелся на экран, он автоматом становиться первым числом и к нему уже можно прибавлять, вычитать и т.д. - как в калькуляторе
//
//Супермен
//
//11. Добавьте точку, теперь можно вводить и дробное число, точка должна работать также, как и точка на обычном калькуляторе (имею в виду, что двух точек в числе быть не может в случае повторного нажатия)
//12. С дробным вводом будет посложнее - задание для настоящих суперменов :)

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *saveResult;

@end




@implementation ViewController {
    BOOL flagPoint;
    NSString *value;
    BOOL isStart;
    BOOL isStartOperation;
    CGFloat valueOne;
    CGFloat valueTwo;
    NSString *operator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    value = [[NSString alloc] init];
    flagPoint = NO;
    isStart = YES;
    isStartOperation = YES;
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
    //self.saveResult.text = @"0";
    flagPoint = NO;
    isStart = YES;
    isStartOperation = YES;
    valueOne = 0;
    
}
- (IBAction)actionSaveResultButton:(UIButton *)sender {
    
    if (!isStartOperation) {
        
        self.saveResult.text = [NSString stringWithFormat:@"%f", valueOne];
        
    } else {
        
        self.saveResult.text = self.resultLabel.text;
        
    }
    
    value = [[NSString alloc] init];
    self.resultLabel.text = @"0";
    valueOne = 0;
    isStartOperation = YES;
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
- (IBAction)actionOperatorButton:(UIButton *)sender {
    
    
    
    if (isStartOperation) {
        
        valueOne = [self.resultLabel.text floatValue];
        value = [[NSString alloc] init];
        self.resultLabel.text = @"0";
        
    } else if (!isStartOperation) {
        
        if ([operator isEqualToString:@"+"]) {
            
            valueTwo = [self.resultLabel.text floatValue];
            self.resultLabel.text = [NSString stringWithFormat:@"%f + %f = %f", valueOne, valueTwo,  valueOne + valueTwo];
            
            valueOne = valueOne + valueTwo;
            value = [[NSString alloc] init];
            valueTwo = 0;
            
        } else if ([operator isEqualToString:@"-"]) {
            
            valueTwo = [self.resultLabel.text floatValue];
            self.resultLabel.text = [NSString stringWithFormat:@"%f - %f = %f", valueOne, valueTwo,  valueOne - valueTwo];
            valueOne = valueOne - valueTwo;
            value = [[NSString alloc] init];
            valueTwo = 0;
            
        } else if ([operator isEqualToString:@"/"]) {
            
            valueTwo = [self.resultLabel.text floatValue];
            self.resultLabel.text = [NSString stringWithFormat:@"%f / %f = %f", valueOne, valueTwo,  valueOne / valueTwo];
            valueOne = valueOne / valueTwo;
            value = [[NSString alloc] init];
            valueTwo = 0;
            
        } else if ([operator isEqualToString:@"*"]) {
            
            valueTwo = [self.resultLabel.text floatValue];
            self.resultLabel.text = [NSString stringWithFormat:@"%f * %f = %f", valueOne, valueTwo,  valueOne * valueTwo];
            valueOne = valueOne * valueTwo;
            value = [[NSString alloc] init];
            valueTwo = 0;
            
        }
    }
   
    switch (sender.tag) {
        case 1:
            operator = @"+";
            break;
        case 2:
            operator = @"-";
            break;
        case 3:
            operator = @"/";
            break;
        case 4:
            operator = @"*";
            break;
    }
    
    value = [[NSString alloc] init];
    self.resultLabel.text = @"0";
    isStartOperation = NO;
}
- (IBAction)actionResultButton:(UIButton *)sender {
    
    if ([operator isEqualToString:@"+"]) {
        
        valueTwo = [self.resultLabel.text floatValue];
        self.resultLabel.text = [NSString stringWithFormat:@"%f + %f = %f", valueOne, valueTwo,  valueOne + valueTwo];
        valueOne = valueOne + valueTwo;
        operator = @"";
        value = [[NSString alloc] init];
        valueTwo = 0;

    } else if ([operator isEqualToString:@"-"]) {
        
        valueTwo = [self.resultLabel.text floatValue];
        self.resultLabel.text = [NSString stringWithFormat:@"%f - %f = %f", valueOne, valueTwo,  valueOne - valueTwo];
        valueOne = valueOne - valueTwo;
        value = [[NSString alloc] init];
        operator = @"";
        valueTwo = 0;
        
    } else if ([operator isEqualToString:@"/"]) {
        
        valueTwo = [self.resultLabel.text floatValue];
        self.resultLabel.text = [NSString stringWithFormat:@"%f / %f = %f", valueOne, valueTwo,  valueOne / valueTwo];
        valueOne = valueOne / valueTwo;
        operator = @"";
        value = [[NSString alloc] init];
        valueTwo = 0;
        
    } else if ([operator isEqualToString:@"*"]) {
        
        valueTwo = [self.resultLabel.text floatValue];
        self.resultLabel.text = [NSString stringWithFormat:@"%f * %f = %f", valueOne, valueTwo,  valueOne * valueTwo];
        valueOne = valueOne * valueTwo;
        operator = @"";
        value = [[NSString alloc] init];
        valueTwo = 0;
        
    }
    
}

- (IBAction)actionDeleteSaveResultButton:(UIButton *)sender {
    self.saveResult.text = @"0";
}
- (IBAction)actionUnloadResultButton:(UIButton *)sender {
    self.resultLabel.text = self.saveResult.text;
}

@end
