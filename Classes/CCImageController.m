#import "CCImageController.h"

@interface CCImageController ()
@end

@implementation CCImageController

- (void) loadView
{
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    UIView *view = [[UIView alloc] initWithFrame:appFrame];
    [view setBackgroundColor:[UIColor blackColor]];
    [self setView:view];

    CGPoint center = CGPointMake(appFrame.size.width/2, appFrame.size.height/2);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(center.x-100, center.y-100, 200, 200)];
    [imageView setImage:[UIImage imageNamed:@"Image"]];
    [view addSubview:imageView];
}

@end
