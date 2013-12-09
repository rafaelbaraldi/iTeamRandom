//
//  PlayerStore.m
//  iTeamRandom
//
//  Created by RAFAEL BARALDI on 04/12/13.
//  Copyright (c) 2013 RAFAEL BARALDI. All rights reserved.
//

#import "PlayerStore.h"

@implementation PlayerStore

+(PlayerStore*)sharedStore{
    static PlayerStore* sharedStore = nil;
    if(!sharedStore){
        sharedStore = [[super allocWithZone:nil]init];
    }
    return sharedStore;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedStore];
}

-(id)init{
    self = [super init];
    if(self){
        allPlayers = [[NSMutableArray alloc]init];
        allTeams = [[NSMutableArray alloc]init];
        allSubstitutes = [[NSMutableArray alloc]init];
    }
    return self;
}

-(NSArray*)allPlayersItems{
    return allPlayers;
}

-(void)addPlayer:(NSString*)nome{
    [allPlayers addObject:nome];
}

-(NSArray*)allTeamsItems{
    return allTeams;
}

-(NSArray*)allSubstitutesItems{
    return allSubstitutes;
}
-(void)addSubstitutes:(NSString*)nome{
    [allSubstitutes addObject:nome];
}

-(void)createTeams:(int)times Maximo:(int)maximo{
    
    NSMutableArray* players = [[NSMutableArray alloc]initWithArray:allPlayers copyItems:YES];
    
    [allTeams removeAllObjects];
    
    int countPlayres = [players count];
    if(times == 0 && [allPlayers count] > 0 && maximo != 0){
        times = floor(countPlayres / maximo);
    }
    
    for(int i = 0; i < times; i++){
        [allTeams addObject:[[NSMutableArray alloc]init]];
        
        for(int j = 0; j < maximo; j++){
            if([players count] > 0){
                int randi = arc4random() % [players count];
                [[allTeams objectAtIndex:i]addObject:[players objectAtIndex:randi]];
                [players removeObjectAtIndex:randi];
            }
        }
    }
    if([players count] > 0){
        allSubstitutes = [NSMutableArray arrayWithArray:players];
    }
}

-(void)removePlayer:(NSString *)nome{
    [allPlayers removeObjectIdenticalTo:nome];
}

-(void)movePlayerAtIndex:(int)from toIndex:(int)to{
    if(from == to)
        return;
    
    NSString* p = [allPlayers objectAtIndex:from];
    [allPlayers removeObjectAtIndex:from];
    [allPlayers insertObject:p atIndex:to];
}

@end
