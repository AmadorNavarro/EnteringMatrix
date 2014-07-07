//
//  ANLMatrixViewController.m
//  EnteringMatrix
//
//  Created by Amador Navarro Lucas on 03/04/14.
//  Copyright (c) 2014 Amador Navarro Lucas. All rights reserved.
//

#import "ANLMatrixViewController.h"
#import "ANLPillButton.h"



@interface ANLMatrixViewController ()

@property (nonatomic, strong) UIImageView *background;
@property (nonatomic, strong) ANLPillButton *bluePill;
@property (nonatomic, strong) ANLPillButton *redPill;

@end



@implementation ANLMatrixViewController

-(instancetype)init {
    
    self = [super init];
    if (self){
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setBackground:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blueBackground"]]];
    [[self view] addSubview:[self background]];
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    UIImage *pill = [UIImage imageNamed:@"redPill"];
    CGRect pillFrame = CGRectMake((screen.size.height - pill.size.width) / 2,
                                  screen.size.width / 3 - pill.size.height / 2,
                                  pill.size.width,
                                  pill.size.height);
    
    ANLPillButton *redButton = [[ANLPillButton alloc] initWithFrame:pillFrame andImage:pill];
    [redButton addTarget:self action:@selector(userWantRed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self setRedPill:redButton];
    [[self view] addSubview:[self redPill]];
    
    pill = [UIImage imageNamed:@"bluePill"];
    pillFrame.origin.y = screen.size.width / 3 * 2 - pill.size.height / 2;
    
    ANLPillButton *blueButton = [[ANLPillButton alloc] initWithFrame:pillFrame andImage:pill];
    [blueButton addTarget:self action:@selector(userWantBlue:) forControlEvents:UIControlEventTouchUpInside];
    
    [self setBluePill:blueButton];
    [[self view] addSubview:[self bluePill]];
}

-(void)userWantRed:(id)sender {
    
    [sender areSelect];
    [[self bluePill] disappear];
    
    UIImageView *newBackGround = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"redBackground"]];
    [newBackGround setAlpha:0];
    [[self view] insertSubview:newBackGround atIndex:0];
    
    [UIView animateWithDuration:1 animations:^{
        
        // Change the background image
        [[self background] setAlpha:0];
        [newBackGround setAlpha:1];
        
    } completion:^(BOOL finished) {
        
        [self setBackground:newBackGround];
        
        // Show the label
        [self animateString:@"WELCOME TO THE REAL WORLD"];
    }];
}

-(void)userWantBlue:(id)sender {
    
    [sender areSelect];
    [[self redPill] disappear];
    
    [self animateString:@"Don't move of your sofa"];
}

-(void)animateString:(NSString *)text {
    
    CGRect lblFrame = CGRectMake(0, 0, [[self view] bounds].size.width, 50);
    CGPoint lblCenter = [[self view] center];
    UILabel *textView = [[UILabel alloc] initWithFrame:lblFrame];
    [textView setText:text];
    [textView setFont:[UIFont fontWithName:@"chalkDuster" size:30]];
    [textView setTextColor:[UIColor whiteColor]];
    [textView setTextAlignment:NSTextAlignmentCenter];
    [textView setCenter:CGPointMake(lblCenter.y, lblCenter.x)];
    [textView setTransform:CGAffineTransformMakeScale(0, 0)];
    [[self view] addSubview:textView];
    
    // Show the label
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        // grows text
        [textView setTransform:CGAffineTransformMakeScale(1.2, 1.2)];
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            [textView setTransform:CGAffineTransformMakeScale(0.95, 0.95)];
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                
                [textView setTransform:CGAffineTransformMakeScale(1, 1)];
            } completion:nil];
        }];
    }];
}
@end
