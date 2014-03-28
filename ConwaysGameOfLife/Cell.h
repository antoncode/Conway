//
//  Cell.h
//  ConwaysGameOfLife
//
//  Created by Anton Rivera on 3/27/14.
//  Copyright (c) 2014 Anton Hilario Rivera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (nonatomic) BOOL isAlive;
@property (nonatomic) NSInteger row;
@property (nonatomic) NSInteger column;

@end
