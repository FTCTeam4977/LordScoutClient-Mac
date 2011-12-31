//
//  ScoutingUIController.m
//  LordScout
//

#import "ScoutingUIController.h"

@implementation ScoutingUIController

- (id)init
{
    self = [super init];
    return self;
}

-(int) strToInt:(NSString*)str
{
    if ( [str intValue] == 0 && ![str isEqualToString:@"0"] )
        return -1;
    return [str intValue];
}

-(IBAction)commit:(id)sender
{
    NSAlert *status = [NSAlert alertWithMessageText:@"Success!" defaultButton:nil alternateButton:nil otherButton:nil 
                          informativeTextWithFormat:@"Data successfuly committed."];
    
    NSString *uid = [[[NSProcessInfo processInfo] globallyUniqueString] stringByReplacingOccurrencesOfString:@"~" withString:@""];
    
    int team;
    if ( (team = [self strToInt:[teamNumber stringValue]]) == -1 )
    {
        [status setMessageText:@"Error!"];
        [status setInformativeText:@"The team number field did not contain a number!"];
        [status runModal];
        return;
    }
    
    int autoBowlingBallid = (int)[autoBowlingBall selectedColumn];
    int autoParkingid = (int)[autoParking selectedColumn];
    int autoBlockingid = (int)[autoBlocking selectedColumn];
    
    int telePlayStyleid = (int)[telePlayStyle selectedColumn];
    
    int teleCrateActionsid = (int)[teleCrateActions selectedColumn];
    
    int teleMaxCrateLevelnum;
    if ( (teleMaxCrateLevelnum = [self strToInt:[teleMaxCrateLevel stringValue]]) == -1 )
    {
        [status setMessageText:@"Error!"];
        [status setInformativeText:@"The crate level field did not contain a number!"];
        [status runModal];
        return;
    }
    
    int teleNumOfCratesnum;
    if ( (teleNumOfCratesnum = [self strToInt:[teleNumOfCrates stringValue]]) == -1 )
    {
        [status setMessageText:@"Error!"];
        [status setInformativeText:@"The number of crates field did not contain a number!"];
        [status runModal];
        return;
    }
    
    int teleNumOfStacksnum;
    if ( (teleNumOfStacksnum = [self strToInt:[teleNumOfStacks stringValue]]) == -1 )
    {
        [status setMessageText:@"Error!"];
        [status setInformativeText:@"The number of stacks field did not contain a number!"];
        [status runModal];
        return;
    }
    
    int teleBallsPerCratenum;
    if ( (teleBallsPerCratenum = [self strToInt:[teleBallsPerCrate stringValue]]) == -1 )
    {
        [status setMessageText:@"Error!"];
        [status setInformativeText:@"The balls per crate field did not contain a number!"];
        [status runModal];
        return;
    }
    
    int teleMagBallsScorednum;
    if ( (teleMagBallsScorednum = [self strToInt:[teleMagBallsScored stringValue]]) == -1 )
    {
        [status setMessageText:@"Error!"];
        [status setInformativeText:@"The magnet ball field did not contain a number!"];
        [status runModal];
        return;
    }
    
    int teleBowlingBallid = (int)[teleBowlingBall selectedColumn];
    
    NSString* notes = [[extraNotes stringValue] stringByReplacingOccurrencesOfString:@"~" withString:@""];
    
    const char *data = [[NSString stringWithFormat:@"%@~%i~%i~%i~%i~%i~%i~%i~%i~%i~%i~%i~%i~%@\n", uid, team, 
                         autoBowlingBallid, autoParkingid, autoBlockingid,
                         telePlayStyleid, teleCrateActionsid, teleMaxCrateLevelnum,
                         teleNumOfCratesnum, teleNumOfStacksnum, teleBallsPerCratenum,
                         teleMagBallsScorednum, teleBowlingBallid, notes] UTF8String];
    
    FILE *outputFile = fopen("LordScoutOutput.txt", "a");
    if ( outputFile == NULL )
    {
        [status setMessageText:@"Error!"];
        [status setInformativeText:@"The data file could not be opened or created for appending!"];
        [status runModal];
        return;
    }
    
    fputs(data, outputFile);
    fclose(outputFile);
    
    [status runModal]; // Use the message defined when we initalized it
    [self reset:self];
}

-(IBAction)reset:(id)sender
{
    [teamNumber setStringValue:@""];
    
    [autoBowlingBall selectCellAtRow:0 column:0];
    [autoParking selectCellAtRow:0 column:0];
    [autoBlocking selectCellAtRow:0 column:0];
    
    [telePlayStyle selectCellAtRow:0 column:0];
    [teleCrateActions selectCellAtRow:0 column:0];
    
    [teleMaxCrateLevel setStringValue:@""];
    [teleNumOfCrates setStringValue:@""];
    [teleNumOfStacks setStringValue:@""];
    [teleBallsPerCrate setStringValue:@""];
    [teleMagBallsScored setStringValue:@""];
    
    [teleBowlingBall selectCellAtRow:0 column:0];
    
    [extraNotes setStringValue:@""];
}

@end
