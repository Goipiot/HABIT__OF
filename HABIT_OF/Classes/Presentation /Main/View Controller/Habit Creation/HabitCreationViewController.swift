//
//  HabitCreationViewController.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 11/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

class HabitCreationViewController: UIViewController {

    // MARK: - Private Properties
    
    private var contentView = HabitCreationView()
    private lazy var router = HabitRouter(presenter: self)
    
    // MARK: - UIViewController
    
    override func loadView() {
        super.loadView()
        guard let view = Bundle.main.loadNibNamed(
            "HabitCreationView",
            owner: self,
            options: nil)?.first as? HabitCreationView else { return }
        
        self.contentView = view
        self.view = contentView
        contentView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        setup()
    }
    
    // Private Methods

    private func setup() {
        contentView.weekdaysCollectionView.dataSource = self
    }

}

// MARK: - Configure NavigationBar

extension HabitCreationViewController {
    private func configureNavBar() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = contentView.doneBarButton
        title = "New/Edit"
    }
}

// MARK: - HabitCreationViewDelegate

extension HabitCreationViewController: HabitCreationViewDelegate {
    
    func newHabitCreated(habit: Habit) {
        saveHabit(newHabit: habit)
        CalendarManager.selectedDate = CalendarManager.selectedDate
        router.pop()
    }
}

// MARK: - Realm

extension HabitCreationViewController {
    
    private func saveHabit(newHabit: Habit) {
        RealmPersistancy().saveHabits(habits: [newHabit])
    }
}

// MARK: - UICollectionViewDataSource

extension HabitCreationViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return WeekdaysManager.weekDays.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weekdayCollectionViewCell",
                                                      for: indexPath) as? WeekdayCollectionViewCell
        cell!.weekdayLabel.text = WeekdaysManager.weekDays[indexPath.row]
        return cell!
    }

}
