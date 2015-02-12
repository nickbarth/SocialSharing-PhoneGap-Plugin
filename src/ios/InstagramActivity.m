#import "InstagramActivity.h"
#import <AssetsLibrary/AssetsLibrary.h>

@implementation InstagramActivity

- (NSString *)activityType
{
  return @"beep.Instagram.Share";
}

- (NSString *)activityTitle
{
  return @"Instagram";
}

- (UIImage *)activityImage
{
  return [UIImage imageNamed:@"instagramShare.png"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
  return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
  self.activityItems = activityItems;
  for (id item in self.activityItems) {
    if ([item isKindOfClass:[NSString class]]) {
      self.message = item;
    }

    if ([item isKindOfClass:[NSURL class]]) {
      self.url = item;
    }

    if ([item isKindOfClass:[UIImage class]]) {
      self.image = item;
    }
  }
}

- (UIViewController*) activityViewController
{
  return nil;
}

- (void)performActivity
{
  ALAssetsLibrary *assetLib = [[ALAssetsLibrary alloc] init];
  [assetLib writeImageToSavedPhotosAlbum:self.image.CGImage metadata:nil completionBlock:^(NSURL *assetURL, NSError *error) {
    NSString *escapedString = [assetURL.absoluteString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    NSString *escapedCaption = [[[self.message stringByAppendingString:@" "] stringByAppendingString:[self.url absoluteString]] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    NSURL *instagramURL = [NSURL URLWithString:[NSString stringWithFormat:@"instagram://library?AssetPath=%@&InstagramCaption=%@", escapedString, escapedCaption]];
    [[UIApplication sharedApplication] openURL:instagramURL];
  }];
}

@end
