//
//  KeyboardViewController.m
//  CustomKeyboard
//
//  Created by Hari Kunwar on 11/25/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import "KeyboardViewController.h"

@interface KeyboardViewController ()
@property (nonatomic, strong) IBOutlet UIButton *nextKeyboardButton;
@end

@implementation KeyboardViewController

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    // Add custom view sizing constraints here
}

- (void)loadView
{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"KeyboardViewController" owner:self options:nil];
    
    self.view = [views objectAtIndex:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.nextKeyboardButton addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

- (IBAction)keyPressed:(id)sender {
    UIButton *key = (UIButton *)sender;
    NSString *string = key.titleLabel.text;
    [self.textDocumentProxy insertText:string];
}

- (IBAction)deletePressed:(id)sender {
    [self.textDocumentProxy deleteBackward];
}

- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
    [self.nextKeyboardButton setTitleColor:textColor forState:UIControlStateNormal];
}

@end
