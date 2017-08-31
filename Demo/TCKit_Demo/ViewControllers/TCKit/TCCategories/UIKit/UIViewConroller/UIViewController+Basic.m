#import "UIViewController+Basic.h"

@implementation UIViewController (Basic)

+ (instancetype)viewControllerWithSb:(NSString *)sb vc:(NSString *)vc {
    return [[UIStoryboard storyboardWithName:sb bundle:nil] instantiateViewControllerWithIdentifier:vc];
}

@end
