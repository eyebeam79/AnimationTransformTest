//
//  ViewController.m
//  AnimationTransformTest
//
//  Created by Jinho Son on 2014. 1. 7..
//  Copyright (c) 2014년 STD1. All rights reserved.
//

#import "ViewController.h"

#define DISABLE_BLOCK_CODE   1

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController


- (IBAction)series:(id)sender
{
    // 연속애니메이션
    
    // 블록을 이용한 코드
    [UIView animateWithDuration:1.0 animations:^{
        self.imageView.backgroundColor = [UIColor whiteColor];
        self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:1.0 animations:^{
            self.imageView.backgroundColor = [UIColor clearColor];
            self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
        }];
    }];

}

// 원상복귀
- (IBAction)setOriginal:(id)sender
{
    
#if DISABLE_BLOCK_CODE
    [UIView beginAnimations:@"original" context:nil];
    [UIView setAnimationDuration:0.7];
    
    self.imageView.transform = CGAffineTransformIdentity;
    
    [UIView commitAnimations];
    
#else
    [UIView animateWithDuration:0.7 animations:^{
        self.imageView.transform = CGAffineTransformIdentity;
    }];
#endif
    
}


// 두개의 트랜스폼 결합 (확대+이동)
- (IBAction)combination:(id)sender
{

    CGAffineTransform t1 = CGAffineTransformMakeScale(1.2, 1.2);
    CGAffineTransform t2 = CGAffineTransformMakeTranslation(30, 30);
    CGAffineTransform comb = CGAffineTransformConcat(t1, t2);
    CGAffineTransform t = CGAffineTransformConcat(self.imageView.transform, comb);
    
#if DISABLE_BLOCK_CODE
    [UIView beginAnimations:@"id_move" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.7];
    
    self.imageView.transform = t;
    
    [UIView commitAnimations];
#else
    
    [UIView animateWithDuration:0.7 animations:^{
        self.imageView.transform = t;
    }];
#endif
    
}

// 회전
- (IBAction)rotate:(id)sender
{
#if DISABLE_BLOCK_CODE
    [UIView beginAnimations:@"id_rotate" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.7];
    
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
    
    [UIView commitAnimations];
#else
    [UIView animateWithDuration:0.7 animations:^{
        self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
    }];
#endif
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
