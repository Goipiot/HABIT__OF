//
//  CalendarViewController.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 05/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    // MARK: - Private Properties
    
    private var calendarViewModels: [CalendarViewModel]! {
        didSet {
            contentView.calendarCollectionView.reloadData()
        }
    }
    private var contentView = CalendarView()
    
    // MARK: - UIViewController
    
    override func loadView() {
        super.loadView()
        guard let view = Bundle.main.loadNibNamed(
            "CalendarView",
            owner: self,
            options: nil)?.first as? CalendarView else { return }
        
        self.contentView = view
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCalendar()
    }
    
    // MARK: - Public Method
    
    @objc func scrollToday() {
        CalendarManager.selectedDate = CalendarManager.dates.last!
        contentView.selectCurrentDay()
    }

}

// MARK: - CollectionView Delegate

extension CalendarViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CalendarManager.dates.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calendarCollectionViewCell",
                                                            for: indexPath) as? CalendarCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: calendarViewModels[indexPath.row])
        return cell
    }
    
    
}

// MARK: - Realm

extension CalendarViewController {
    
    private func loadCalendar() {
        var models = [CalendarViewModel]()
        for date in CalendarManager.dates {
            models.append(CalendarViewModel(date: date))
        }
        calendarViewModels = models
    }
}
