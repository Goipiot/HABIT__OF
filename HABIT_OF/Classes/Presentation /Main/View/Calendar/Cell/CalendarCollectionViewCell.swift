//
//  CalendarCollectionViewCell.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 09/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import Charts

class CalendarCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var pieChartView: PieChartView!
    
    // MARK: - Public Properties
    
    override public var isSelected: Bool {
        didSet {
            updateAppearance()
        }
    }

    // MARK: - UIView
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public Methods
    
    public func configure(with viewModel: CalendarViewModel) {
        dateLabel.text = viewModel.dateLabel
        updateCalendarInterface(with: viewModel.habitProportion)
    }
    
    // MARK: - Private Methods
    
    private func updateAppearance() {
        if isSelected {
            dateLabel.textColor = UIColor.black
        } else {
            dateLabel.textColor = UIColor.lightGray
        }
    }
    
    private func updateCalendarInterface(with data: [Int]) {
        var dataSet = [PieChartDataEntry]()
        for index in 0..<data.count {
            let entry = PieChartDataEntry(value: Double(data[index]))
            
            dataSet.append(entry)
        }
        let pieChartDataSet = PieChartDataSet(values: dataSet, label: nil)
        pieChartDataSet.colors = [UIColor.customGreen,
                                  UIColor.red,
                                  UIColor.customPink,
                                  UIColor.customGrey] as [NSUIColor]
        pieChartDataSet.selectionShift = 0
        pieChartDataSet.drawValuesEnabled = false
        
        let chartData = PieChartData(dataSet: pieChartDataSet)
        pieChartView.chartDescription?.text = ""
        pieChartView.holeRadiusPercent = 0.5
        pieChartView.transparentCircleRadiusPercent = 0
        pieChartView.legend.enabled = false
        pieChartView.minOffset = 0
        pieChartView.data = chartData
    }
    
}
