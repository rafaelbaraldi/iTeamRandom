//
//  FinalTeamViewController.m
//  iTeamRandom
//
//  Created by RAFAEL BARALDI on 05/12/13.
//  Copyright (c) 2013 RAFAEL BARALDI. All rights reserved.
//

#import "FinalTeamViewController.h"
#import "PlayerStore.h"

@interface FinalTeamViewController ()

@end

@implementation FinalTeamViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem* item = [self tabBarItem];
        [item setTitle:@""];
        [item setImage:[UIImage imageNamed:@"team"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self.tbResult reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [[[PlayerStore sharedStore]allTeamsItems]count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[[PlayerStore sharedStore]allTeamsItems]objectAtIndex:section]count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    // Configure the cell...
    
    NSString* p = [[[[PlayerStore sharedStore]allTeamsItems]objectAtIndex:[indexPath section]]objectAtIndex:[indexPath row]];
    [[cell textLabel]setText:p];
    
    return cell;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"Time %d", section];
}

@end
