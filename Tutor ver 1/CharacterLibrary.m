//
//  CharacterLibrary.m
//  Tutor ver 1
//
//  Created by Teddy Stephenson on 10/16/13.
//  Copyright (c) 2013 Teddy Stephenson. All rights reserved.
//

#import "CharacterLibrary.h"

@implementation CharacterLibrary

- (id) init {
    self = [super init];
    if (self) {
        _path = [[NSBundle mainBundle] pathForResource:@"characters" ofType:@"plist"];
        _characterlist = [NSDictionary dictionaryWithContentsOfFile:_path];
    }
    return self;
}


-(NSUInteger)numberOfCharacters {
    return self.characterlist.count;
}

-(NSString *)nameForCharacters: (NSInteger) rownum {
    NSArray* charlist = [self.characterlist allKeys];
    charlist = [charlist sortedArrayUsingSelector:@selector(compare:)];
    return [charlist objectAtIndex:rownum];
}

-(NSString *) kanjiForCharacters:(NSInteger)rownum  {
    NSString* charName = [self nameForCharacters:rownum];
    NSDictionary* currentCharacter = [self.characterlist objectForKey:charName];
    return [currentCharacter objectForKey:@"kanji"];
}

-(int) strokesForCharacter:(NSInteger)rownum {
    NSString* charName = [self nameForCharacters:rownum];
    NSDictionary* currentCharacter = [self.characterlist objectForKey:charName];
    return [[currentCharacter objectForKey:@"strokecount"] integerValue];
}

-(NSArray *) strokeArray:(NSInteger) rownum {
    NSString* charName = [self nameForCharacters:rownum];
    NSDictionary* currentCharacter = [self.characterlist objectForKey:charName];
    return [currentCharacter objectForKey:@"strokes"];
    
    
}


@end
