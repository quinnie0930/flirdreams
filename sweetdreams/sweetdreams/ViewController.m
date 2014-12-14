//
//  ViewController.m
//  sweetdreams
//
//  Created by Waleed Abdulla on 12/13/14.
//  Copyright (c) 2014 Waleed. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
// Main image view
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

// Images
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) UIImage *lastImage;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Connect to FLIR One
    [[FLIROneSDKStreamManager sharedInstance] addDelegate:self];
    [FLIROneSDKStreamManager sharedInstance].imageOptions =FLIROneSDKImageOptionsBlendedMSXRGBA8888Image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)FLIROneSDKDelegateManager:(FLIROneSDKDelegateManager *)delegateManager didReceiveBlendedMSXRGBA8888Image:(NSData *)msxImage imageSize:(CGSize)size {
    
    // Store last image
    self.lastImage = self.image;

    //render the image
    self.image = [FLIROneSDKUIImage imageWithFormat:FLIROneSDKImageOptionsBlendedMSXRGBA8888Image andData:msxImage andSize:size];
    
    //perform ui update on main thread
    dispatch_async(dispatch_get_main_queue(), ^{
        
        // Compare to previous image
        if (self.image != nil && self.lastImage != nil){
            
            UIGraphicsBeginImageContextWithOptions(self.image.size, NO, self.image.scale);
            [self.lastImage drawAtPoint:CGPointZero];
            [self.image drawAtPoint:CGPointZero blendMode:kCGBlendModeDifference alpha:1.0f];
            UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            self.imageView.image = newImage;
            
            
            /*
            CGSize newSize = self.image.size;
            UIGraphicsBeginImageContext(newSize);
            
            [self.lastImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
            [self.image drawInRect:CGRectMake(0,0,newSize.width,newSize.height) blendMode:kCGBlendModeDestinationOut alpha:0.8];
            
            UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
            
            UIGraphicsEndImageContext();
            self.imageView.image = newImage;
             */
        }
        
    });
}


//callbacks for image data delivered from sled
- (void)FLIROneSDKDelegateManager:(FLIROneSDKDelegateManager *)delegateManager didReceiveFrameWithOptions:(FLIROneSDKImageOptions)options metadata:(FLIROneSDKImageMetadata *)metadata {
    
    

}




@end
