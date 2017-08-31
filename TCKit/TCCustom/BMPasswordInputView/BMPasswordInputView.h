//
//  BMPasswordInputView.h
//  EnterpriseManager
//
//  Created by Tech on 2017/3/12.
//  Copyright © 2017年 erfeixia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMPasswordInput: UITextField

@end

@protocol BMPasswordInputViewDelegate <NSObject>

- (void)passwordInputViewDidInput:(NSString *)password;

@end

@interface BMPasswordInputView : UIView

@property (nonatomic, weak) id<BMPasswordInputViewDelegate>delegate;

@end
