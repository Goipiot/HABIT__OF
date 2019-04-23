//
//  HabitCreationView.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 11/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

protocol HabitCreationViewDelegate: class {
    func newHabitCreated(habit: Habit)
}

class HabitCreationView: UIView {

    // MARK: - IBOutlet
    
    @IBOutlet weak var regularityViewHeight: NSLayoutConstraint!
    @IBOutlet weak var dropDownImageView: UIImageView!
    @IBOutlet weak var deleteHabitButton: UIButton!
    @IBOutlet weak var commentsTextField: UITextField!
    @IBOutlet weak var timeButton: UIButton!
    @IBOutlet weak var notificationSwitch: UISwitch!
    @IBOutlet weak var autoStatusSegmentedControl: UISegmentedControl!
    @IBOutlet weak var habitTitleTextField: UITextField!
    @IBOutlet weak var weekdaysCollectionView: UICollectionView!
    var doneBarButton: UIBarButtonItem!
    
    // MARK: - Public Properties
    
    weak var delegate: HabitCreationViewDelegate?
    
    // MARK: UIView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    // MARK: - IBOutlets
    
    @IBAction func regularityButtonPressed(_ sender: UIButton) {
        if weekdaysCollectionView.isHidden {
            weekdaysCollectionView.isHidden = false
            UIView.animate(withDuration: 0.1, animations: {
                self.dropDownImageView.transform = self.dropDownImageView.transform.rotated(by: CGFloat(Double.pi / 2))
                self.regularityViewHeight.constant = 110
            })
        } else {
            weekdaysCollectionView.isHidden = true
            UIView.animate(withDuration: 0.1, animations: {
                self.dropDownImageView.transform = CGAffineTransform.identity
            })
            self.regularityViewHeight.constant = 65
        }
    }
    
    
    // MARK: - Private Methods
    
    private func setup() {
        
        doneBarButton = UIBarButtonItem(
            title: "Done",
            style: .plain,
            target: self,
            action: #selector(doneButtonPressed))
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: 45, height: 45)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        weekdaysCollectionView.backgroundColor = .clear
        weekdaysCollectionView.collectionViewLayout = layout
        weekdaysCollectionView.delegate = self
        weekdaysCollectionView.allowsMultipleSelection = true
        weekdaysCollectionView.register(UINib(nibName: "WeekdayCollectionViewCell", bundle: nil),
                                        forCellWithReuseIdentifier: "weekdayCollectionViewCell")
        
    }
    
    @objc private func doneButtonPressed() {
        let title = habitTitleTextField.text ?? ""
        let comment = commentsTextField.text ?? ""
        let doNotify = notificationSwitch.isOn
        let alertTime = timeButton.title(for: .normal) ?? "10:00"
        let creationTime = DateFormatter.get(with: .full).string(from: CalendarManager.selectedDate)
        let activeDays = WeekdaysManager.selectedDates
        let habitDays = HabitPointManager.generateHabitPoints(with: activeDays, creationDate: creationTime)
        var autoStatus = ""
        switch autoStatusSegmentedControl.selectedSegmentIndex {
        case 0:
            autoStatus = AutoStatus.skip.rawValue
        case 1:
            autoStatus = AutoStatus.failed.rawValue
        default:
            break
        }
        
        let newHabit = Habit(title: title,
                             comment: comment,
                             alertTime: alertTime,
                             creationTime: creationTime,
                             doNotify: doNotify,
                             autoStatus: autoStatus,
                             days: habitDays,
                             activeDays: activeDays)
        
        delegate?.newHabitCreated(habit: newHabit)
    }
}

// MARK: - UITextField Delegate

extension HabitCreationView: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        animateViewMoving(up: false, moveValue: 135)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateViewMoving(up: true, moveValue: 135)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func animateViewMoving(up: Bool, moveValue: CGFloat) {
        
        let movementDuration: TimeInterval = 0.3
        let movement: CGFloat = ( up ? -moveValue : moveValue)
        
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        
        self.frame = self.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
}

// MARK: - UICollectionViewDelegate

extension HabitCreationView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        WeekdaysManager.selectedDates.append(WeekdaysManager.weekDays[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        WeekdaysManager.removeWeekayFromSelection(weekday: WeekdaysManager.weekDays[indexPath.row])
    }
}
