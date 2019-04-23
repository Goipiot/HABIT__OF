//
//  HabitPointDataSource.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 15/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

final class HabitPointDataSource: NSObject {
    
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

extension HabitPointDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let disabledCell = collectionView.dequeueReusableCell(withReuseIdentifier: "disabledCollectionViewCell",
                                                              for: indexPath) as? DisabledCollectionViewCell
        let pointCell = collectionView.dequeueReusableCell(withReuseIdentifier: "habitPointCollectionViewCell",
                                                           for: indexPath) as? HabitPointCollectionViewCell
        let date = CalendarManager.visibleDates[indexPath.row + 1]
        let dateString = DateFormatter.get(with: .full).string(from: date)
        if pointExists(for: date) {
            guard let cell = pointCell else {
                return disabledCell!
            }
            cell.configure(with: viewModel.first(where: { $0.date == dateString })!)
            return cell
        } else {
            return disabledCell!
        }
    }

}
