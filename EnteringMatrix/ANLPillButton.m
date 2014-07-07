//
//  ANLPillButton.m
//  EnteringMatrix
//
//  Created by Amador Navarro Lucas on 03/04/14.
//  Copyright (c) 2014 Amador Navarro Lucas. All rights reserved.
//

#import "ANLPillButton.h"


#pragma mark - LifeCycle

@implementation ANLPillButton

-(instancetype)initWithFrame:(CGRect)frame andImage:(UIImage *)image {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundImage:image forState:UIControlStateNormal];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    
        return [self initWithFrame:frame andImage:nil];
}



#pragma mark - CustomMethods

-(void)areSelect {
    
    CGFloat move = ([self frame].origin.y > [[UIScreen mainScreen] bounds].size.width / 2) ? 20. : -20.;
    
    [UIView animateWithDuration:1 animations:^{
        
        [self setCenter:CGPointMake([self center].x, [self center].y + move)];
    }];
}

-(void)disappear {
    
    [UIView animateWithDuration:5 animations:^{
        
        [self setCenter:CGPointMake([self center].x, 1500)];
        [self setAlpha:0];
    }];
}

@end
