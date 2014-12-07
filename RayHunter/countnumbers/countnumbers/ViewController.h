//
//  ViewController.h
//  countnumbers
//
//  Created by Ray Hunter on 12/6/14.
//  Copyright (c) 2014 Ray Hunter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *input;
@property (weak, nonatomic) IBOutlet UILabel *output;
@property (weak, nonatomic) IBOutlet UIButton *enterBtn;

- (IBAction)submit:(id)sender;

@end
