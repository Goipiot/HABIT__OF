//
//  HabitMainViewController.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 05/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

class HabitMainViewController: UIViewController {

    // MARK: - Private Properties
    
    private lazy var router = HabitRouter(presenter: self)
    private var contentView = HabitMainView()
    private lazy var calendarViewController = CalendarViewController()
    private lazy var habitListViewController = HabitListViewController()
    
    // MARK: - UIViewController
    
    override func loadView() {
        super.loadView()
        guard let view = Bundle.main.loadNibNamed(
            "HabitMainView",
            owner: self,
            options: nil)?.first as? HabitMainView else { return }
        
        self.contentView = view
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildren()
        configureNavBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        contentView.scrollTodayButton.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        changeTodayButtonStatus()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        CalendarManager.selectedDate = CalendarManager.selectedDate
    }
    
    // MARK: - Public Methods
    
    @objc public func changeTodayButtonStatus() {
        contentView.scrollTodayButton.isHidden = CalendarManager.isTodaySelected()
        updateTitle()
    }

    // MARK: - Private Methods
    
    private func addChildren() {
        addChild(calendarViewController)
        contentView.calendarStackView.addArrangedSubview(calendarViewController.view)
        calendarViewController.didMove(toParent: self)
        addChild(habitListViewController)
        contentView.habitsStackView.addArrangedSubview(habitListViewController.view)
        habitListViewController.didMove(toParent: self)
    }
    
    @objc private func profileButtonPressed() {
        router.show(viewController: ProfileViewController())
    }
    
    private func updateTitle() {
        title = DateFormatter.get(with: .weekNavBar).string(from: CalendarManager.selectedDate)
        if CalendarManager.isTodaySelected() {
            title = "Today"
        }
    }
}

// MARK: - Configure NavigationBar

extension HabitMainViewController {
    
    private func configureNavBar() {
        
        let logoBtn = UIButton(type: .custom)
        logoBtn.setImage(#imageLiteral(resourceName: "appIcon"), for: .normal)
        let logoBarButton = UIBarButtonItem(customView: logoBtn)
        let currWidth = logoBarButton.customView?.widthAnchor.constraint(equalToConstant: 70)
        currWidth?.isActive = true
        
        let backButton = UIBarButtonItem()
        backButton.title = "Cancel"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        contentView.profileBarButton.action = #selector(profileButtonPressed)
        contentView.profileBarButton.target = self
        navigationItem.leftBarButtonItem = logoBarButton
        navigationItem.rightBarButtonItems = [contentView.profileBarButton, contentView.editBarButton]
        title = "September"
    
        navigationController?.navigationBar.addSubview(contentView.scrollTodayButton)
            
        let trailingContraint = NSLayoutConstraint(item: contentView.scrollTodayButton,
                                                   attribute: .trailingMargin,
                                                   relatedBy: .equal,
                                                   toItem: navigationController?.navigationBar,
                                                   attribute: .trailingMargin,
                                                   multiplier: 1.0,
                                                   constant: -20)
        
        let bottomConstraint = NSLayoutConstraint(item: contentView.scrollTodayButton,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: navigationController?.navigationBar,
                                                  attribute: .bottom,
                                                  multiplier: 1.0,
                                                  constant: -6)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeTodayButtonStatus),
                                               name: .selectedCurrentDate,
                                               object: nil)
        
        contentView.scrollTodayButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.scrollTodayButton.addTarget(calendarViewController,
                                                action: #selector(calendarViewController.scrollToday),
                                                for: .touchUpInside)
        NSLayoutConstraint.activate([trailingContraint, bottomConstraint])
        print(CalendarManager.isTodaySelected(), " --- ", CalendarManager.selectedDate)
    }

}
