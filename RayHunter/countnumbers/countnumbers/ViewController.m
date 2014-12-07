//
//  ViewController.m
//  countnumbers
//
//  Created by Ray Hunter on 12/6/14.
//  Copyright (c) 2014 Ray Hunter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender {
  [_output setText:_input.text];
  
  [self processInput];
  
}

- (void) processInput {
  
  // get the input from the user
  NSString *input = _input.text;
  
  if(input.length <= 0) {
    _output.text = @"Please enter a string.";
    return;
  }
  
  // regex patterns
  NSString *numbers = @"[+-]?\\d+";
  NSString *letters = @"[a-zA-Z]";
  
  // setup the range to search over
  NSRange range = NSMakeRange(0, input.length);
  
  // create the regex with the patterns
  NSRegularExpression *lettersRegex = [NSRegularExpression regularExpressionWithPattern:letters options:NSRegularExpressionCaseInsensitive error:nil];
  NSRegularExpression *numbersRegex = [NSRegularExpression regularExpressionWithPattern:numbers options:NSRegularExpressionCaseInsensitive error:nil];
  
  // find the matches
  NSUInteger totalLetters = [lettersRegex numberOfMatchesInString:input options:NSMatchingReportCompletion range:range];
  NSArray *onlyNumbers = [numbersRegex matchesInString:input options:NSMatchingReportCompletion range:range];
  
  // start the math at zero
  float total = 0;
  
  // process the regex
  for ( NSTextCheckingResult *item in onlyNumbers) {
    // get the match
    NSString *number = [input substringWithRange:item.range];
    float val = [number floatValue];
    total += val;
  }

  // do the math
  float output = round(total / totalLetters);

  // print the output to the view
  _output.text = [NSString stringWithFormat:@"output: %i [%i / %i = %i]", (int) output, (int) total, (int) totalLetters, (int) output];
}

@end
