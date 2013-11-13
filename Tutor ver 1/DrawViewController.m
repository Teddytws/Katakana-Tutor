//
//  DrawViewController.m
//  Tutor ver 1
//
//  Created by Teddy Stephenson on 10/16/13.
//  Copyright (c) 2013 Teddy Stephenson. All rights reserved.
//

#import "DrawViewController.h"
#import "WhatDidIDraw.h"
#import "E.h"

@interface DrawViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cName;
@property (strong, nonatomic) WhatDidIDraw* drawTest;
@property (nonatomic) NSMutableArray * mypointset;
@property (nonatomic) NSMutableArray * myStrokeSet;
@property (nonatomic) NSInteger currentStrokeCount;
@property (weak, nonatomic) IBOutlet UILabel *curStrokeCt;
@property (weak, nonatomic) IBOutlet UILabel *cKanji;
@property (nonatomic) BOOL sGood;
@property (weak, nonatomic) IBOutlet UILabel *strokeGood;
@property (nonatomic) BOOL cGood;
/*this is a test part*/
@property (strong, nonatomic) E * etest;



@end

@implementation DrawViewController

- (NSMutableArray *) mypointset {
    if (!_mypointset) {
        _mypointset = [[NSMutableArray alloc]init];
    }
    return _mypointset;
    
}

-(NSMutableArray *) myStrokeSet {
    if (!_myStrokeSet) {
        _myStrokeSet = [[NSMutableArray alloc]init];
    }
    return _myStrokeSet;
}


- (WhatDidIDraw *) drawTest {
    
    if (!_drawTest) {
        _drawTest = [[WhatDidIDraw alloc]init];
    }
    return _drawTest;
}


-(E *) etest {
    if (!_etest) {
        _etest = [[E alloc]init];
    }
    return _etest;
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    red = 0.0/255.0;
    green = 0.0/255.0;
    blue = 0.0/255.0;
    brush = 5.0;
    opacity = 1.0;
    
    self.cName.text = self.characterName;
    self.currentStrokeCount = 0;
    self.curStrokeCt.text = [NSString stringWithFormat:@"%d", self.currentStrokeCount];
    self.cKanji.text = self.characterKanji;
    NSLog(@"%@",self.strokes);
    self.cGood = NO;

}

- (void) viewDidUnload {
    [self setMainImage:nil];
    [self setTempImage:nil];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    if (self.cGood) {
        self.currentStrokeCount = 0;
        self.cGood = NO;
        self.mainImage.image = nil;
        self.yatta.text = nil;
        [self.myStrokeSet removeAllObjects];
        
        
    }
    mouseSwiped = NO;
    self.sGood = YES;
    self.strokeGood.backgroundColor = nil;

    UITouch *touch = [touches anyObject];
    lastPoint = [touch locationInView:self.view];
    self.strokeGood.text = @"-";
    self.curStrokeCt.text = [NSString stringWithFormat:@"%d", self.currentStrokeCount+1];
    
    [self.mypointset removeAllObjects];

}

- (IBAction)reset:(id)sender {
    
    self.mainImage.image = nil;
    self.currentStrokeCount = 0;
    self.curStrokeCt.text = [NSString stringWithFormat:@"%d", self.currentStrokeCount+1];
    self.yatta.text = nil;
}



- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    NSLog( @"%@", NSStringFromCGPoint(currentPoint));
    [self.mypointset addObject:[NSValue valueWithCGPoint:currentPoint]];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.tempImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush );
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, 1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.tempImage.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.tempImage setAlpha:opacity];
    UIGraphicsEndImageContext();
    
    lastPoint = currentPoint;
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(!mouseSwiped) {
        NSLog(@"single point");
        UIGraphicsBeginImageContext(self.view.frame.size);
        [self.tempImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, opacity);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        self.tempImage.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();

    }
    
    
    NSLog(@"temp to main");
    
    if (self.currentStrokeCount < self.strokecount) {
        
        int lineDrawn = [self.drawTest detectline:self.mypointset];
        if (lineDrawn != [[self.strokes objectAtIndex:self.currentStrokeCount] integerValue]){
            self.sGood = NO;
        }

        else {
            
          //  [self.myStrokeSet addObject:self.mypointset];
            
            
            //if ([self.etest check:self.currentStrokeCount :self.myStrokeSet]) {
            
            self.currentStrokeCount++;
           // }
           // else{
           //     self.sGood = NO;
            //
            }
    
        
    }
    
    if (self.currentStrokeCount == self.strokecount) {
        self.cGood = YES;
        self.yatta.text = @"YATTA!!!";
    }
    
    
    
    if (self.sGood){
    UIGraphicsBeginImageContext(self.mainImage.frame.size);
    [self.mainImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
    [self.tempImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) blendMode:kCGBlendModeNormal alpha:opacity];
    self.mainImage.image = UIGraphicsGetImageFromCurrentImageContext();
    self.tempImage.image = nil;
    UIGraphicsEndImageContext();
    
    self.strokeGood.text = @"good";
    self.strokeGood.backgroundColor = [UIColor greenColor];

    }
    else {
        self.strokeGood.text = @"Wrong";
        self.tempImage.image = nil;
        self.strokeGood.backgroundColor = [UIColor redColor];
    
    }
}


@end
