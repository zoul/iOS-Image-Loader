#import "CCImageController.h"

@interface CCImageController ()
@end

@implementation CCImageController

- (void) loadView
{
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    UIView *view = [[UIView alloc] initWithFrame:appFrame];
    [view setBackgroundColor:[UIColor redColor]];
    [self setView:view];
}

@end
