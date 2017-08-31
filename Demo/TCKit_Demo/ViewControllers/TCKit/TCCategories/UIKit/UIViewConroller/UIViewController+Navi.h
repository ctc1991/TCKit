#import "TCKit.h"

@interface UIViewController (Navi)

- (void)setLeftBtn:(NSString *)title image:(NSString *)image action:(SEL)action;
- (void)setRightBtn:(NSString *)title image:(NSString *)image action:(SEL)action;
- (void)setNavigationBarColor:(UIColor *)color;
- (void)setNavigationBarLine:(UIColor *)color;
- (void)removeNavigationBarLine;
- (void)titleLbl:(NSString *)title color:(UIColor *)color;

@end
