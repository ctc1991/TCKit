#import "UIView+Basic.h"

@implementation UIView (Basic)

//+ (instancetype)initFromNib {
//    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil] objectAtIndex:0];
//}

+ (instancetype)viewWithNibName:(NSString *)nibName {
    return [[[NSBundle mainBundle]loadNibNamed:nibName owner:nil options:nil] objectAtIndex:0];
}

@end
