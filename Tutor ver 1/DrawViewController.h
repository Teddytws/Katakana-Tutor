//
//  DrawViewController.h
//  Tutor ver 1
//
//  Created by Teddy Stephenson on 10/16/13.
//  Copyright (c) 2013 Teddy Stephenson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawViewController : UIViewController <UIActionSheetDelegate> {
    
    CGPoint lastPoint;
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat brush;
    CGFloat opacity;
    BOOL mouseSwiped;
    
}

@property (nonatomic) NSString* characterName;
@property (nonatomic) NSString* characterKanji;
@property (nonatomic) int strokecount;
@property (nonatomic) NSArray * strokes;
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UIImageView *tempImage;
//-(IBAction)reset:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *yatta;

@end
