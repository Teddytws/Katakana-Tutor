//
//  CharacterLibrary.h
//  Tutor ver 1
//
//  Created by Teddy Stephenson on 10/16/13.
//  Copyright (c) 2013 Teddy Stephenson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CharacterLibrary : NSObject

@property (nonatomic) NSDictionary* characterlist;
@property (nonatomic) NSString* path;


-(NSUInteger)numberOfCharacters;

-(NSString *)nameForCharacters:(NSInteger) rownum;

-(NSString *)kanjiForCharacters:(NSInteger) rownum;

-(int) strokesForCharacter:(NSInteger) rownum;

-(NSArray *) strokeArray:(NSInteger) rownum;



@end