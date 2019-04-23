//
//  HabitTableViewCell.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 10/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

protocol HabitTableViewCellDelegate: class {
    func cellSelectionChanged(cell: HabitTableViewCell, to selected: Bool)
    func cellPointStatusChanged(to status: String)
}

class HabitTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var habitTitleLabel: UILabel!
    @IBOutlet weak var habitPointsCollectionView: UICollectionView!
    @IBOutlet weak var habitLinesCollectionView: UICollectionView!
    @IBOutlet weak var notificationTimeLabel: UILabel!
    @IBOutlet weak var menuButtonsStackView: UIStackView!
    
    // MARK: - Public Properties
    
    weak var delegate: HabitTableViewCellDelegate?
    
    // MARK: - UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    // MARK: - Public Methods
    
    public func configure(with vm: HabitViewModel) {
        habitTitleLabel.text = vm.title
        notificationTimeLabel.text = vm.alertTime
    }
    
    public func deselectAllPoints() {
        for point in habitPointsCollectionView.visibleCells {
            guard let pointCell = point as? HabitPointCollectionViewCell else {
                return
            }
            let indexPath = habitPointsCollectionView.indexPath(for: pointCell)!
            habitPointsCollectionView.deselectItem(at: indexPath, animated: true)
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func menuButtonPressed(_ sender: PointMenuButton) {
        var status: String
        switch sender.tag {
        case 0:
            status = HabitPointStatus.clean.rawValue
        case 1:
            status = HabitPointStatus.skip.rawValue
        case 2:
            status = HabitPointStatus.failed.rawValue
        case 3:
            status = HabitPointStatus.done.rawValue
        default:
            status = HabitPointStatus.clean.rawValue
        }
        delegate?.cellPointStatusChanged(to: status)
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize.width = 23
        layout.minimumLineSpacing = 27
        layout.scrollDirection = .horizontal
        habitPointsCollectionView.backgroundColor = .clear
        habitPointsCollectionView.collectionViewLayout = layout
        habitPointsCollectionView.delegate = self
        
        let linesLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        linesLayout.minimumLineSpacing = 7
        linesLayout.itemSize.width = 43
        linesLayout.scrollDirection = .horizontal
        habitLinesCollectionView.backgroundColor = .clear
        habitLinesCollectionView.collectionViewLayout = linesLayout
        
        habitPointsCollectionView.register(UINib(nibName: "HabitPointCollectionViewCell", bundle: nil),
                                        forCellWithReuseIdentifier: "habitPointCollectionViewCell")
        habitPointsCollectionView.register(UINib(nibName: "DisabledCollectionViewCell", bundle: nil),
                                           forCellWithReuseIdentifier: "disabledCollectionViewCell")
        habitLinesCollectionView.register(UINib(nibName: "HabitLineCollectionViewCell", bundle: nil),
                                          forCellWithReuseIdentifier: "habitLineCollectionViewCell")
    }
}

// MARK: - UICollectionViewDelegate

extension HabitTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard let cell = collectionView.cellForItem(at: indexPath) as? HabitPointCollectionViewCell else {
            return false
        }
        if cell.isSelected {
            collectionView.deselectItem(at: indexPath, animated: true)
            HabitPointManager.selectedPointIndex = nil
        } else {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
            HabitPointManager.selectedPointIndex = indexPath.row
        }
        delegate?.cellSelectionChanged(cell: self, to: cell.isSelected)
        return false
    }
}
