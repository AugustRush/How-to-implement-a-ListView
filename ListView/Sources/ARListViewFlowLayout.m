//
//  ARListViewFlowLayout.m
//  ListView
//
//  Created by AugustRush on 2017/3/7.
//  Copyright © 2017年 August. All rights reserved.
//

#import "ARListViewFlowLayout.h"
#import "ARListViewLayoutItemAttributes.h"
#import "ARListView.h"

@implementation ARListViewFlowLayout {
    id<ARListViewFlowLayoutDelegate> _delegate;
    CGFloat _calculateX;
    CGFloat _calculateY;
}

- (instancetype)initWithDelegate:(id<ARListViewFlowLayoutDelegate>)delegate {
    self = [super init];
    if (self) {
        _delegate = delegate;
        _minimumLineSpacing = 1.0;
        _calculateX = 0.0;
        _calculateY = 0.0;
    }
    return self;
}

- (void)preparedLayout {
    _calculateX = 0.0;
    _calculateY = 0.0;
}

- (ARListViewLayoutItemAttributes *)layoutAttributesAtIndexPath:(NSIndexPath *)indexPath {
    
    ARListViewLayoutItemAttributes *attributes = [[ARListViewLayoutItemAttributes alloc] init];
    CGSize size = [_delegate flowLayout:self sizeForItemAtIndexPath:indexPath];
    attributes.frame = CGRectMake(_calculateX, _calculateY, size.width, size.height);
    _calculateY += size.height + _minimumLineSpacing;
    return attributes;
}

- (void)finishedLayout {

}

@end