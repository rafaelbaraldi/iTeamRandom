//
//  PlayerStore.h
//  iTeamRandom
//
//  Created by RAFAEL BARALDI on 04/12/13.
//  Copyright (c) 2013 RAFAEL BARALDI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerStore : NSObject{
    NSMutableArray* allPlayers;
    NSMutableArray* allTeams;
    NSMutableArray* allSubstitutes;
}

+(PlayerStore*)sharedStore;

-(NSArray*)allPlayersItems;
-(void)addPlayer:(NSString*)nome;

-(NSArray*)allTeamsItems;

-(void)createTeams:(int)times Maximo:(int)maximo;

-(NSArray*)allSubstitutesItems;
-(void)addSubstitutes:(NSString*)nome;

-(void)removePlayer:(NSString*)nome;

-(void)movePlayerAtIndex:(int)from toIndex:(int)to;

-(void)replacePlayer:(NSString*)old for:(NSString*)new;

@end
