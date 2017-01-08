//
//  FLOG.h
//  Ash Apps Common Code
//
//  Created by Aaron Ash on 5/9/15.
//  Copyright (c) 2016 Ash Apps, Inc. All rights reserved.
//



#ifndef Perks_FLOG_h
#define Perks_FLOG_h


#endif


//turn off debug mode to quit all that logging
 #define DEBUG_MODE

#ifdef DEBUG_MODE
#define FLOG( s, ... ) NSLog( @"<%@:(%d)> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define FLOG( s, ... )
#endif
