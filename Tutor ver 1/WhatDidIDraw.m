//
//  WhatDidIDraw.m
//  Tutor ver 1
//
//  Created by Teddy Stephenson on 10/17/13.
//  Copyright (c) 2013 Teddy Stephenson. All rights reserved.
//

#import "WhatDidIDraw.h"

@implementation WhatDidIDraw


- (NSInteger) detectline:(NSArray* ) ptarray {
    
    CGPoint startPoint;
    CGPoint lastPoint;
    CGPoint prevPoint;
    float angle;
    
    if ([ptarray count] >= 2) {
    
        startPoint = [[ptarray objectAtIndex:0] CGPointValue];
    
        lastPoint = [[ptarray lastObject] CGPointValue];
    
        angle =(atan2f(lastPoint.y - startPoint.y, lastPoint.x - startPoint.x)* 180/M_PI);
        NSLog(@"angle: %f", angle);
    
        if ( angle  < 10 && angle > -10 ) {
        
            return 1;
        
        }
    
        else if (angle < 30 && angle > 10) {
            return 2;
        }
        else if (angle < 70 && angle > 60) {
            return 8;
        }
    
        else if (angle  > 170 && angle < -170 ) {
    
            return 9;
        }
    
        else if (angle > 80 && angle < 100) {
            return 10;
        }
        
        else if (angle > 100 && angle < 125) {
            return 11;
        }
 
    
        else {
            return -1;
        }
    }
    return -1;
}

    
    
  





@end
