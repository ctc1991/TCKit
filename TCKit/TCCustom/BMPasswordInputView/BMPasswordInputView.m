//
//  BMPasswordInputView.m
//  EnterpriseManager
//
//  Created by Tech on 2017/3/12.
//  Copyright © 2017年 erfeixia. All rights reserved.
//

#import "BMPasswordInputView.h"



@implementation BMPasswordInput

- (void)deleteBackward {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"deleteBackward" object:self];
}

@end

@interface BMPasswordInputView ()
@property (strong, nonatomic) IBOutletCollection(BMPasswordInput) NSArray *textFields;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputViewBottomConstraints;


@end

@implementation BMPasswordInputView

- (void)awakeFromNib {
    [super awakeFromNib];
    for (UITextField *tf in _textFields) {
        tf.inputAccessoryView = [UIView new];
    }
    [_textFields[0] becomeFirstResponder];
    [_textFields[0] addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(action)]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteBackward:) name:@"deleteBackward" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(kbShow:) name:UIKeyboardWillShowNotification object:nil];
    
}

- (IBAction)editing:(UITextField *)sender {
    if (sender.tag < 5) {
        if (sender.text.length == 1) {
            [_textFields[sender.tag+1] becomeFirstResponder];
        }
    } else {
        [sender resignFirstResponder];
        //NSLog(@"验证密码");
        

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSString *password = @"";
            for (UITextField *tf in _textFields) {
                password = [password stringByAppendingString:tf.text];
            }
            [_delegate passwordInputViewDidInput:password];
            [UIView animateWithDuration:0.15 animations:^{
                self.alpha = 0;
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        });
    }
}

- (void)deleteBackward:(NSNotification *)notification {
    UITextField *tf = (UITextField *)notification.object;
    
    if (tf.tag == 0) {
        return;
    }
    UITextField *newTf = _textFields[tf.tag - 1];
    [newTf becomeFirstResponder];
    newTf.text = @"";
    
}

- (void)kbShow:(NSNotification *)notification {
    NSDictionary* info = [notification userInfo];
    CGRect rect        = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    _inputViewBottomConstraints.constant = rect.size.height + 20;
}
- (IBAction)close:(UIButton *)sender {
    [self removeFromSuperview];
}

- (void)action {
    //NSLog(@"actionaction");
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
