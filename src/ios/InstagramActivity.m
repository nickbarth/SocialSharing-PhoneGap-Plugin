#import "InstagramActivity.h"

@implementation InstagramActivity

- (NSString *)activityType
{
    return @"beep.instagram.share";
}

- (NSString *)activityTitle
{
    return @"Instagram";
}

- (UIImage *)activityImage
{
    return [UIImage imageNamed:@"instagram.png"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
}

- (UIViewController *)activityViewController
{
    return nil;
}

- (void)performActivity
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UIAlertView" message:@"My message" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert show];

    if (_delegate && [_delegate respondsToSelector:@selector(ActivityPerform)]) {
        [_delegate ActivityPerform];

        NSURL *instagramURL = [NSURL URLWithString:@"instagram://app"];

        if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
              NSURL *instaURL = [NSURL URLWithString:@"instagram://camera?annotation=youcandoit"];
              [[UIApplication sharedApplication] openURL:instaURL];
        }
    }
}

@end
