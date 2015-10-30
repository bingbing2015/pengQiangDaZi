//
//  ViewController.m
//  pengQiangDaZi
//
//  Created by 陈奕频 on 15/10/30.
//  Copyright © 2015年 陈奕频. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSString * contentStr;
@property (weak, nonatomic) IBOutlet UILabel *textLable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSThread * thread = [[NSThread alloc] initWithTarget:self selector:@selector(animalLable) object:nil];
    [thread start];
    self.contentStr = @"人生最宝贵的是生命，生命属于人只有一次。一个人的生命应当这样度过：当他回忆往事的时候，他不致因虚度年华而悔恨，也不致因碌碌无为而羞愧；在临死的时候，他能够说：“我的整个生命和全部精力，都已献给世界上最壮丽的事业——为人类的解放而斗争。";
}

- (void)animalLable
{
    for (NSInteger i = 0; i < self.contentStr.length; i ++) {
        [self performSelectorOnMainThread:@selector(refreshWithContentStr:) withObject:[self.contentStr substringWithRange:NSMakeRange(0, i + 1)] waitUntilDone:YES];
        [NSThread sleepForTimeInterval:0.3];
    }
}

- (void)refreshWithContentStr:(NSString *)contentStr
{
    self.textLable.text = contentStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
