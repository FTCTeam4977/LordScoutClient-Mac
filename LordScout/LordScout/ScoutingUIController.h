//
//  ScoutingUIController.h
//  LordScout
//

#import <Foundation/Foundation.h>

@interface ScoutingUIController : NSObject
{
    IBOutlet NSTextField *teamNumber;
    
    // Auto
    IBOutlet NSMatrix *autoBowlingBall;
    IBOutlet NSMatrix *autoParking;
    IBOutlet NSMatrix *autoBlocking;
    
    // Crates
    IBOutlet NSMatrix *teleCrateActions;
    IBOutlet NSTextField *teleMaxCrateLevel;
    IBOutlet NSTextField *teleNumOfCrates;
    IBOutlet NSTextField *teleNumOfStacks;
    IBOutlet NSTextField *teleBallsPerCrate;
    
    // Magnet Balls
    IBOutlet NSTextField *teleMagBallsScored;
    
    // End game
    IBOutlet NSMatrix *teleBowlingBall;
    
    // Extra
    IBOutlet NSTextField *extraNotes;
}

-(IBAction)commit:(id)sender;
-(IBAction)reset:(id)sender;

@end
