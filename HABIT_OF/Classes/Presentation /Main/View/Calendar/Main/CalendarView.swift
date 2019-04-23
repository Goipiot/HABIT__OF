//
//  CalendarView.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 05/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

class CalendarView: UIView {

    // MARK: - IBOutlet
    
    @IBOutlet weak var calendarCollectionView: UICollectionView!
    
    // MARK: - UIView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    // MARK: - Public Method
    
    @objc func selectCurrentDay() {
        DispatchQueue.main.async {
            let row = CalendarManager.dates.count - 1
            let indexPath = IndexPath(row: row, section: 0)
            self.calendarCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .right)
        }
    }
    
    // MARK: - Private Method
    
    private func setup() {
        calendarCollectionView.backgroundColor = .white
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize.width = calendarCollectionView.frame.width / 7
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        calendarCollectionView.collectionViewLayout = layout
        calendarCollectionView.register(UINib(nibName: "CalendarCollectionViewCell", bundle: nil),
                                    forCellWithReuseIdentifier: "calendarCollectionViewCell")
        selectCurrentDay()
        
    }
}

// MARK: - CollectionView Delegate

extension CalendarView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        CalendarManager.selectedDate = CalendarManager.dates[indexPath.row]
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .right)
    }

}
