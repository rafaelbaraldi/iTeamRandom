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
}

+(PlayerStore*)sharedStore;

-(NSArray*)allPlayersItems;
-(void)addPlayer:(NSString*)nome;

-(NSArray*)allTeamsItems;

-(void)createTeams:(int)times Maximo:(int)maximo;

@end
