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
    NSURL *url;
    NSString *image;

    for (id object in self.activityItems) {
        if ([object isKindOfClass:[NSString class]]) {
          message = object;
        }

        if ([object isKindOfClass:[NSURL class]]) {
          url = object;
        }

        if ([object isKindOfClass:[_NSCFString class]]) {
          counter++;
          image = object;
        }
    }

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UIAlertView" message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert show];
    alert = [[UIAlertView alloc] initWithTitle:@"UIAlertView" message:[url absoluteString] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert show];
    alert = [[UIAlertView alloc] initWithTitle:@"UIAlertView" message:image delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert show];
    alert = [[UIAlertView alloc] initWithTitle:@"UIAlertView" message:[NSString stringWithFormat:@"A string: %d", counter] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert show];
}

@end
