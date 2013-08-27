//
//  DemoViewController.m
//  MFSideMenuDemoStoryboard
//
//  Created by Michael Frederick on 4/9/13.
//  Copyright (c) 2013 Michael Frederick. All rights reserved.
//

#import "DemoViewController.h"
#import "MFSideMenu.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

@synthesize videoViewer;
@synthesize moviePlayer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoRotateFinish:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
}

- (IBAction)showLeftMenuPressed:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

- (IBAction)showRightMenuPressed:(id)sender {
    [self.menuContainerViewController toggleRightSideMenuCompletion:nil];
}

- (void) videoRotateFinish:(NSNotification*)notification {
    
    UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
    
    if (deviceOrientation == UIDeviceOrientationPortrait) {
        [moviePlayer setFullscreen:NO animated:NO];
    }
    else if ((deviceOrientation == UIDeviceOrientationLandscapeLeft || deviceOrientation == UIDeviceOrientationLandscapeRight)
             && moviePlayer.playbackState & MPMoviePlaybackStatePlaying)
    {
        [moviePlayer setFullscreen:YES animated:NO];
    }
    
}

- (IBAction)loadVideo:(id)sender {

    NSLog(@"Here...");
    
    NSURL *videoURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4"]];
    
    moviePlayer = [[MPMoviePlayerController alloc] init];
    [moviePlayer setContentURL:videoURL];
    [moviePlayer prepareToPlay];
    [moviePlayer setShouldAutoplay:YES];
    [moviePlayer setMovieSourceType:MPMovieSourceTypeStreaming];
    [moviePlayer setControlStyle:MPMovieControlStyleEmbedded];
    
    CGRect movieFrame = videoViewer.frame;
    moviePlayer.view.frame = movieFrame;
    [self.videoViewer addSubview:moviePlayer.view];
    
    
}

- (void)dealloc
{
    [videoViewer release];
    [moviePlayer release];
    [super dealloc];
}
@end
