//
//  DemoViewController.h
//  MFSideMenuDemoStoryboard
//
//  Created by Michael Frederick on 4/9/13.
//  Copyright (c) 2013 Michael Frederick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface DemoViewController : UIViewController
{
    MPMoviePlayerController *moviePlayer;
    
}

@property (retain, nonatomic) IBOutlet UIView *videoViewer;
@property (retain, nonatomic) MPMoviePlayerController *moviePlayer;

- (IBAction)showLeftMenuPressed:(id)sender;
- (IBAction)showRightMenuPressed:(id)sender;

- (IBAction)loadVideo:(id)sender;

@end
