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
  //self.activityItems = activityItems;
  int counter = 0;
  NSString *message;
  NSURL *url;
  UIImage *image;

  for (id item in activityItems) {
    counter++;
    if ([item isKindOfClass:[NSString class]]) {
      message = item;
    }

    if ([item isKindOfClass:[NSURL class]]) {
      url = item;
    }
    if ([item isKindOfClass:[UIImage class]]) {
      [[[UIAlertView alloc] initWithTitle:@"UIAlertView" message:@"Image Loaded" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil] show];
      image = item;
    }
  }

  [[[UIAlertView alloc] initWithTitle:@"UIAlertView" message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil] show];
  [[[UIAlertView alloc] initWithTitle:@"UIAlertView" message:[url absoluteString] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil] show];
  [[[UIAlertView alloc] initWithTitle:@"UIAlertView" message:[NSString stringWithFormat:@"A string: %d", counter] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil] show];

  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UIAlertView" message:@"image" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
  UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 200, 200)];

  [imageView setImage:image];
  [alert addSubview: imageView];

  [alert show];
}

- (UIViewController*) activityViewController
{
    return nil;
}

- (void)performActivity
{
}

@end
