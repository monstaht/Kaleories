//
//  BarChartViewController.swift
//  iOSChartsDemo
//
//  Created by Joyce Echessa on 6/12/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit
import Charts


class BarChartViewController: UIViewController {

    
    var food: [String]?
    var amount: [Double]?
    var barChartView: BarChartView?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        barChartView = BarChartView(frame: view.frame)
        view.addSubview(barChartView!)
        barChartView!.noDataText = "Add data"
        setChart(food!, values: amount!)
        
    }

    func setChart(dataPoints: [String], values: [Double]){
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Units Sold")
        let chartData = BarChartData(xVals: food, dataSet: chartDataSet)
        barChartView!.data = chartData
    }
    
    


}

