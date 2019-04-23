//
//  HabitLineDataSource.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 23/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

final class HabitLineDataSource: NSObject {
    
    // MARK: - Public Properties
    
    public var viewModel: [HabitDayViewModel] = []
    
    // MARK: - Private Methods
    
    private func pointExists(for date: Date) -> Bool {
        let stringDate = DateFormatter.get(with: .full).string(from: date)
        for point in viewModel where point.date == stringDate {
            return true
        }
        return false
    }
    
}

// MARK: - UITableViewDataSource

extension HabitLineDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let lineCell = collectionView.dequeueReusableCell(withReuseIdentifier: "habitLineCollectionViewCell",
                                                              for: indexPath) as? HabitLineCollectionViewCell
        return lineCell!
        
    }
}
