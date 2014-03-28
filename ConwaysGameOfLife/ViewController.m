//
//  ViewController.m
//  ConwaysGameOfLife
//
//  Created by Anton Rivera on 3/27/14.
//  Copyright (c) 2014 Anton Hilario Rivera. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"

#define NUMBER_OF_ITEMS_IN_ROW 14

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *grid;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSInteger liveNeighbors;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    
    NSMutableArray *tempGrid = [NSMutableArray new];
    
    for(int i = 0; i < 140; i++)
    {
        Cell *newCell = [Cell new];
        [tempGrid addObject:newCell];
    }
    
    self.grid = tempGrid;
    [self findRowAndCollum];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.grid.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *newCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    newCell.backgroundColor = [UIColor redColor];
    return newCell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) checkNeighbors
{
    
    
    for (int i = 0; i < self.grid.count; i++)
    {
        Cell *thisCell = [self.grid objectAtIndex:i];
        self.liveNeighbors = 0;
        
        
        if (thisCell.row == 0) {
            if (thisCell.column == 0) {
                if ([[self.grid objectAtIndex:(i+1)] isAlive]) {
                    self.liveNeighbors++;
                }if ([[self.grid objectAtIndex:(i+NUMBER_OF_ITEMS_IN_ROW)] isAlive]) {
                    self.liveNeighbors++;
                }if ([[self.grid objectAtIndex:(i+NUMBER_OF_ITEMS_IN_ROW+1)] isAlive]) {
                    self.liveNeighbors++;
                }
            }
        }
        
        if (thisCell.row == 0) {
            if (thisCell.column == 13) {
                if ([[self.grid objectAtIndex:(i-1)] isAlive]) {
                    self.liveNeighbors++;
                }if ([[self.grid objectAtIndex:(i+1)] isAlive]) {
                    self.liveNeighbors++;
                }if ([[self.grid objectAtIndex:(i+NUMBER_OF_ITEMS_IN_ROW-1)] isAlive]) {
                    self.liveNeighbors++;
                }if ([[self.grid objectAtIndex:(i+NUMBER_OF_ITEMS_IN_ROW)] isAlive]) {
                    self.liveNeighbors++;
                }
            }
        }
        
        if (thisCell.row == 9) {
            if (thisCell.column == 0) {
                if ([[self.grid objectAtIndex:(i-NUMBER_OF_ITEMS_IN_ROW)] isAlive]) {
                    self.liveNeighbors++;
                }if ([[self.grid objectAtIndex:(i-NUMBER_OF_ITEMS_IN_ROW+1)] isAlive]) {
                    self.liveNeighbors++;
                }if ([[self.grid objectAtIndex:(i+1)] isAlive]) {
                    self.liveNeighbors++;
                }if ([[self.grid objectAtIndex:(i+NUMBER_OF_ITEMS_IN_ROW)] isAlive]) {
                    self.liveNeighbors++;
                }if ([[self.grid objectAtIndex:(i+NUMBER_OF_ITEMS_IN_ROW+1)] isAlive]) {
                    self.liveNeighbors++;
                }
            }
        }
        
        if (thisCell.row == 9) {
            if (thisCell.column == 13) {
                if ([[self.grid objectAtIndex:(i-NUMBER_OF_ITEMS_IN_ROW-1)] isAlive]) {
                    self.liveNeighbors++;
                }if ([[self.grid objectAtIndex:(i-NUMBER_OF_ITEMS_IN_ROW)] isAlive]) {
                    self.liveNeighbors++;
                }if ([[self.grid objectAtIndex:(i-1)] isAlive]) {
                    self.liveNeighbors++;
                }if ([[self.grid objectAtIndex:(i+NUMBER_OF_ITEMS_IN_ROW-1)] isAlive]) {
                    self.liveNeighbors++;
                }if ([[self.grid objectAtIndex:(i+NUMBER_OF_ITEMS_IN_ROW)] isAlive]) {
                    self.liveNeighbors++;
                }
            }
        }
        
        
        if ([[self.grid objectAtIndex:(i-NUMBER_OF_ITEMS_IN_ROW-1)] isAlive]) {
            self.liveNeighbors++;
        }if ([[self.grid objectAtIndex:(i-NUMBER_OF_ITEMS_IN_ROW)] isAlive]) {
            self.liveNeighbors++;
        }if ([[self.grid objectAtIndex:(i-NUMBER_OF_ITEMS_IN_ROW+1)] isAlive]) {
            self.liveNeighbors++;
        }if ([[self.grid objectAtIndex:(i-1)] isAlive]) {
            self.liveNeighbors++;
        }if ([[self.grid objectAtIndex:(i+1)] isAlive]) {
            self.liveNeighbors++;
        }if ([[self.grid objectAtIndex:(i+NUMBER_OF_ITEMS_IN_ROW-1)] isAlive]) {
            self.liveNeighbors++;
        }if ([[self.grid objectAtIndex:(i+NUMBER_OF_ITEMS_IN_ROW)] isAlive]) {
            self.liveNeighbors++;
        }if ([[self.grid objectAtIndex:(i+NUMBER_OF_ITEMS_IN_ROW+1)] isAlive]) {
            self.liveNeighbors++;
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        switch (self.liveNeighbors) {
            case 2:
                break;
            case 3:
                thisCell.isAlive = true;
            default:
                thisCell.isAlive = false;
                break;
        }
        [self.grid replaceObjectAtIndex:i withObject:thisCell];
    }
    
    
}

- (void)findRowAndCollum
{
    
    
    for (int i = 0; i < self.grid.count; i++) {
        Cell *newCell = [Cell new];
        newCell.column = (i % 14);
        newCell.row = (i - (i % 14))/14;
        
    }
    
}

@end
