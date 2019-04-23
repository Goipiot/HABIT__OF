//
//  HabitListViewController.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 10/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

class HabitListViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var habitsTableView: UITableView!
    
    // MARK: - Private Properties
    
    private let habitPointsDataSource = HabitPointDataSource()
    private let habitLinesDataSource = HabitLineDataSource()
    private var habitViewModels: [HabitViewModel]! {
        didSet {
            habitsTableView.reloadData()
        }
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadHabits()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        habitsTableView.register(UINib(nibName: "HabitTableViewCell", bundle: nil),
                                 forCellReuseIdentifier: "HabitCell")
        habitsTableView.register(UINib(nibName: "CreateHabitTableViewCell", bundle: nil),
                                 forCellReuseIdentifier: "CreateHabitCell")
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(update),
                                               name: .userPickedNewDate,
                                               object: nil)
    }
    
    private func closeMenuForAllCells(butFor cell: HabitTableViewCell? = nil) {
        for newCell in habitsTableView.visibleCells where newCell != cell {
            guard let habitCell = newCell as? HabitTableViewCell else {
                return
            }
            habitCell.menuButtonsStackView.isHidden = true
            habitCell.deselectAllPoints()
        }
    }
    
    @objc private func update() {
        loadHabits()
        closeMenuForAllCells()
    }
    
}

// MARK: - UITableView DataSource

extension HabitListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habitViewModels.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let habitCell = tableView.dequeueReusableCell(withIdentifier: "HabitCell") as? HabitTableViewCell
        let createHabitCell = tableView.dequeueReusableCell(withIdentifier: "CreateHabitCell")
            as? CreateHabitTableViewCell
        
        if indexPath.row == habitViewModels.count {
            createHabitCell?.delegate = self
            return createHabitCell!
        } else {
            habitCell!.configure(with: habitViewModels[indexPath.row])
            habitPointsDataSource.viewModel = habitViewModels[indexPath.row].days
            habitCell!.habitPointsCollectionView.dataSource = habitPointsDataSource
            habitCell!.habitLinesCollectionView.dataSource = habitLinesDataSource
            habitCell!.habitPointsCollectionView.reloadData()
            habitCell!.delegate = self
            return habitCell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cell = tableView.cellForRow(at: indexPath) as? HabitTableViewCell else {
            return 70
        }
        
        for pointCell in cell.habitPointsCollectionView.visibleCells where pointCell.isSelected {
            return 120
        }
        return 70
    }
}

// MARK: - Realm

extension HabitListViewController {
    
    private func loadHabits() {
        let habits = RealmPersistancy().loadAllHabits()
        habitViewModels = habits.map { (habit) -> HabitViewModel in
            let habitVM = HabitViewModel(habit: habit)
            return habitVM
        }
    }
    
    private func updateSelectedHabitPoint(with status: String) {
        guard let date = HabitPointManager.getSelectedPointDate() else {
            return
        }
        RealmPersistancy().updateHabitDay(for: date, with: status)
    }
}

// MARK: - CreateHabitTableViewCellDelegate

extension HabitListViewController: CreateHabitTableViewCellDelegate {
    
    func addNewHabitButtonPressed() {
        guard let parentVC = self.parent as? HabitMainViewController else {
            return
        }
        show(HabitCreationViewController(), sender: parentVC)
    }
}

// MARK: - HabitTableViewCellDelegate

extension HabitListViewController: HabitTableViewCellDelegate {
    
    func cellPointStatusChanged(to status: String) {
        updateSelectedHabitPoint(with: status)
        CalendarManager.selectedDate = CalendarManager.selectedDate
    }
    
    func cellSelectionChanged(cell: HabitTableViewCell, to selected: Bool) {
        UIView.animate(withDuration: 0.2, animations: {
            self.closeMenuForAllCells(butFor: cell)
            self.habitsTableView.beginUpdates()
            self.habitsTableView.endUpdates()
        }, completion: { (_) in
            cell.menuButtonsStackView.isHidden = !selected
        })
    }
}
