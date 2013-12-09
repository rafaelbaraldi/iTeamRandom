//
//  RandomTeamViewController.h
//  iTeamRandom
//
//  Created by RAFAEL BARALDI on 03/12/13.
//  Copyright (c) 2013 RAFAEL BARALDI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RandomTeamViewController : UIViewController <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtJogadores;
@property (weak, nonatomic) IBOutlet UITableView *tbJogadores;
@property (weak, nonatomic) IBOutlet UITextField *txtTimes;
@property (weak, nonatomic) IBOutlet UITextField *txtMaximoJogadores;
- (IBAction)btnEditOnClick:(id)sender;
@property BOOL editingPLayer;
@property NSString* oldName;

@end
