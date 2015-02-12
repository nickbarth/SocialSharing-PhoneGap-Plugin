#import "InstagramActivity.h"
#import <AssetsLibrary/AssetsLibrary.h>

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
  UIImage *image;
  NSString *base64;
  NSURL *imageURL;

  for (id item in self.activityItems) {
    counter++;
    if ([item isKindOfClass:[NSString class]]) {
      message = item;
    }

    if ([item isKindOfClass:[NSURL class]]) {
      url = item;
    }

    if ([item isKindOfClass:[UIImage class]]) {
      image = item;
      base64 = [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
      imageURL = [NSURL URLWithString:[@"data:image/png;base64," stringByAppendingString:base64]];
    }
  }

  [[[UIAlertView alloc] initWithTitle:@"UIAlertView" message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil] show];
  [[[UIAlertView alloc] initWithTitle:@"UIAlertView" message:[url absoluteString] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil] show];
  [[[UIAlertView alloc] initWithTitle:@"UIAlertView" message:[NSString stringWithFormat:@"A string: %d", counter] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil] show];

  ALAssetsLibrary *assetLib = [[ALAssetsLibrary alloc] init];
  [assetLib writeImageToSavedPhotosAlbum:image.CGImage metadata:nil completionBlock:^(NSURL *assetURL, NSError *error) {
    // NSURL *instagramURL = [NSURL URLWithString:@"instagram://app"];
    // UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    NSString *escapedString = [assetURL.absoluteString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    NSString *escapedCaption = [message stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    NSURL *instagramURL = [NSURL URLWithString:[NSString stringWithFormat:@"instagram://library?AssetPath=%@&InstagramCaption=%@", escapedString, escapedCaption]];

    [[[UIAlertView alloc] initWithTitle:@"UIAlertView" message:assetURL.absoluteString delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil] show];
    // [[UIApplication sharedApplication] openURL:instagramURL];
  }];
}

@end
