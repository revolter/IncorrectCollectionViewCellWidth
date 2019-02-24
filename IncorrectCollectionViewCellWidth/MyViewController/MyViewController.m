//
//  MyViewController.m
//  IncorrectCollectionViewCellWidth
//
//  Created by Iulian Onofrei on 07/02/2019.
//  Copyright © 2019 Iulian Onofrei. All rights reserved.
//

#import "MyViewController.h"

#import "MyCollectionViewCell.h"

@interface MyViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;

@property (nonatomic) BOOL isLayoutLoaded;

@end

@implementation MyViewController

static NSString *CellReuseIdentifier;

- (void)viewDidLoad {

	[super viewDidLoad];

	CellReuseIdentifier = NSStringFromClass([MyCollectionViewCell class]);

	self.collectionView.dataSource = self;
	self.collectionView.delegate = self;

	UINib *nib = [UINib nibWithNibName:CellReuseIdentifier bundle:nil];

	[self.collectionView registerNib:nib forCellWithReuseIdentifier:CellReuseIdentifier];
}

- (void)viewDidLayoutSubviews {

	[super viewDidLayoutSubviews];

	if (self.isLayoutLoaded) {
		return;
	}

	self.isLayoutLoaded = YES;

	CGSize estimatedItemSize = self.collectionView.bounds.size;

	NSLog(@"Estimated size: %@", NSStringFromCGSize(estimatedItemSize));

	self.collectionViewFlowLayout.estimatedItemSize = estimatedItemSize;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

	return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

	return [collectionView dequeueReusableCellWithReuseIdentifier:CellReuseIdentifier forIndexPath:indexPath];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

	CGFloat width = CGRectGetWidth(collectionView.bounds);
	CGFloat height = 1024;

	CGSize size = CGSizeMake(width, height);

	NSLog(@"Size: %@", NSStringFromCGSize(size));

	return size;
}

@end
