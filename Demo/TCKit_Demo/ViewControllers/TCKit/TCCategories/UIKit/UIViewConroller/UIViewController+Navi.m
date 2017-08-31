#import "UIViewController+Navi.h"

@implementation UIViewController (Navi)
- (void)setLeftBtn:(NSString *)title image:(NSString *)image action:(SEL)action {
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    if (image) {
        btn.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    self.navigationItem.leftBarButtonItem = btn;
}
- (void)setRightBtn:(NSString *)title image:(NSString *)image action:(SEL)action {
    
}
- (void)setNavigationBarColor:(UIColor *)color {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:color] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:UIColor.clearColor size:CGSizeMake(0.5, 0.5)]];
}
- (void)setNavigationBarLine:(UIColor *)color {
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:color size:CGSizeMake(0.5, 0.5)]];
}
- (void)removeNavigationBarLine {
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:UIColor.clearColor size:CGSizeMake(0.5, 0.5)]];
}
- (void)titleLbl:(NSString *)title color:(UIColor *)color {
    UILabel *lbl = [UILabel new];
    lbl.text = title;
    lbl.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:18];
    lbl.textColor = color;
    [lbl sizeToFit];
    self.navigationItem.titleView = lbl;
}

@end
