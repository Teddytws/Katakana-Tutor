//
//  E.m
//  Tutor ver 1
//
//  Created by Teddy Stephenson on 10/21/13.
//  Copyright (c) 2013 Teddy Stephenson. All rights reserved.
//

#import "E.h"

@implementation E




-(BOOL) check:(NSInteger) strokeCount
             :(NSMutableArray *) strokeSet {
    
    NSMutableArray * prevSet = [[NSMutableArray alloc]init];
    NSMutableArray * currentSet = [[NSMutableArray alloc] init];
    int fudge = 10;
    
    switch (strokeCount) {
        
        case 0:
            return YES;
            break;
        
        case 1:
            prevSet = [strokeSet objectAtIndex:0];
            currentSet = [strokeSet objectAtIndex:1];
            
            CGPoint prevStartPoint = [[prevSet objectAtIndex:0] CGPointValue];
            CGPoint prevEndPoint = [[prevSet lastObject] CGPointValue];
            CGPoint currentStartPoint = [[currentSet objectAtIndex:0] CGPointValue];
            CGPoint currentEndPoint = [[currentSet lastObject] CGPointValue];
            
            int prevMidPoint = prevEndPoint.x = prevStartPoint.x;
            
            int prevMidLength = prevEndPoint.x = prevMidPoint;
            
            int currentLength = currentEndPoint.y - currentStartPoint.y;
            
            
            
            if ((currentStartPoint.x > (prevMidPoint + fudge) || currentStartPoint.x < (prevMidPoint-10)) && currentLength >= prevMidLength)
                
                return YES;
            else
                return NO;
                
            
            
            
            
            
            break;
        case 2:
            
            return YES;
            
            break;
            
        default:
            return YES;
            break;
    }
    
    
    
    return YES;
    
    

}

@end
