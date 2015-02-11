#import "InstagramActivity.h"

@implementation InstagramActivity

- (NSString *)activityType
{
    return @"beep.Instagram.Share";
}

- (NSString *)activityTitle
{
    return @"Instagram Share";
}

- (UIImage *)activityImage
{
    return [UIImage imageNamed:@"icon-40.png"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
  self.activityItems = activityItems;
}

- (UIViewController*) activityViewController
{
    return nil;
}

- (void)performActivity
{
    int counter = 0;
    NSString *message;
    NSString *subject;
    NSString *image;
    NSString *link;

    for (id object in self.activityItems) {
        if ([object isKindOfClass:[NSString class]]) {
          counter++;
          if (counter == 1) message = object;
          if (counter == 2) subject = object;
          if (counter == 3) image = object;
          if (counter == 4) link = object;
        }
    }

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UIAlertView" message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert show];
}

@end
