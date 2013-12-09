//
//  RandomTeamViewController.m
//  iTeamRandom
//
//  Created by RAFAEL BARALDI on 03/12/13.
//  Copyright (c) 2013 RAFAEL BARALDI. All rights reserved.
//
#define kOFFSET_FOR_KEYBOARD 200.0

#import "RandomTeamViewController.h"
#import "PlayerStore.h"

@interface RandomTeamViewController ()

@end

@implementation RandomTeamViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UITabBarItem* item = [self tabBarItem];
        [item setTitle:@"Sorteio"];
        [item setImage:[UIImage imageNamed:@"ball"]];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];    
    
    // Do any additional setup after loading the view from its nib.
    [[self tbJogadores] setDataSource:self];
    
    UIBarButtonItem* doneItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonDidPressed:)];
    UIToolbar* toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, 44.f)];
    [toolbar setItems:[NSArray arrayWithObjects:doneItem, nil]];
    [[self txtMaximoJogadores]setInputAccessoryView:toolbar];
    [[self txtTimes]setInputAccessoryView:toolbar];
    [[self txtJogadores]setInputAccessoryView:toolbar];
    
    
    CGRect frame = self.txtTimes.frame;
    frame.origin.x += (frame.size.width + 15);
    frame.size.width -= 40;
    frame.size.height = (self.txtMaximoJogadores.frame.origin.y + self.txtMaximoJogadores.frame.size.height) - self.txtTimes.frame.origin.y;
    
    UIButton* btnSortear = [[UIButton alloc]initWithFrame:frame];
    [btnSortear setTitle:@"Sortear" forState:UIControlStateNormal];
    [btnSortear setTitleColor:[UIColor colorWithRed:0.0 green:0.487 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
    [btnSortear addTarget:self action:@selector(randomTeam) forControlEvents:UIControlEventTouchUpInside];
    
    
    [[self view] addSubview:btnSortear];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField.tag == 0){
        if(![self.txtJogadores.text isEqualToString:@""])
            [[PlayerStore sharedStore]addPlayer:[[self txtJogadores]text]];
        
        self.txtJogadores.text = @"";
        
        [[self tbJogadores]reloadData];
    }
    
    
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[PlayerStore sharedStore]allPlayersItems]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    // Configure the cell...
    
    NSString* p = [[[PlayerStore sharedStore]allPlayersItems]objectAtIndex:[indexPath row]];
    [[cell textLabel]setText:p];
    
    return cell;
}

-(void)doneButtonDidPressed:(id)sender{
    
    if(![self.txtJogadores isFirstResponder]){
    
        // unregister for keyboard notifications while not visible.
        [self keyboardWillHide];
    }
    
    [self.view endEditing:YES];
}

-(void)randomTeam{
    [[PlayerStore sharedStore]createTeams:[self.txtTimes.text intValue] Maximo:[self.txtMaximoJogadores.text intValue]];
    [self.tabBarController setSelectedIndex:1];
}











-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if(textField.tag != 0){
        [self keyboardWillShow];
    }
    
    
    return YES;
}


-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    
    CGRect rect = self.view.frame;
    if (movedUp){
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else{
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    
    self.view.frame = rect;
    [UIView commitAnimations];
}

-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0){
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0){
        [self setViewMovedUp:NO];
    }
}


- (IBAction)btnEditOnClick:(id)sender {
    if([[self tbJogadores]isEditing]){
        [sender setTitle:@"Editar" forState:UIControlStateNormal];
        [[self tbJogadores]setEditing:NO animated:YES];
    }
    else{
        [sender setTitle:@"Pronto" forState:UIControlStateNormal];
        [[self tbJogadores]setEditing:YES animated:YES];
    }
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        PlayerStore* ps = [PlayerStore sharedStore];
        NSArray* items = [ps allPlayersItems];
        NSString* p = [items objectAtIndex:[indexPath row]];
        [ps removePlayer:p];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    [[PlayerStore sharedStore]movePlayerAtIndex:[sourceIndexPath row] toIndex:[destinationIndexPath row]];
}

//-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
//    if(indexPath.row == 1)
//        return YES;
//    else
//        return NO;
//}

@end
