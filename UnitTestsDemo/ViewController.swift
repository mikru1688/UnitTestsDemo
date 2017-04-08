//
//  ViewController.swift
//  UnitTestsDemo
//
//  Created by Frank.Chen on 2017/4/8.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var titleLbl: UILabel! // title
    var operand1Sld: UISlider! // 運算元1
    var operand1Lbl: UILabel! // 運算元1的值
    var operand2Sld: UISlider! // 運算元2
    var operand2Lbl: UILabel! // 運算元1的值
    var resultLbl: UILabel! // 計算結果
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 生成title
        self.titleLbl = UILabel()
        self.titleLbl.frame = CGRect(x: 0, y: 20, width: self.view.frame.size.width, height: 50)
        self.titleLbl.text = "加法計算器"
        self.titleLbl.font = UIFont.systemFont(ofSize: (20))
        self.titleLbl.textAlignment = NSTextAlignment.center
        
        // 生成運算元1
        self.operand1Sld = UISlider()
        self.operand1Sld.frame = CGRect(x: (self.view.frame.size.width * 0.3) / 2, y: self.titleLbl.frame.origin.y + self.titleLbl.frame.size.height, width: self.view.frame.size.width * 0.7, height: 50)
        self.operand1Sld.minimumValue = 0 // 最小值
        self.operand1Sld.maximumValue = 100 // 最大值
        self.operand1Sld.value = 0 // 預設值
        self.operand1Sld.addTarget(self, action: #selector(ViewController.onOperand1Change(_:)), for: UIControlEvents.valueChanged)
        
        // 生成運算元1的值
        self.operand1Lbl = UILabel()
        self.operand1Lbl.frame = CGRect(x: (self.view.frame.size.width * 0.3) / 2, y: self.operand1Sld.frame.origin.y + self.operand1Sld.frame.size.height, width: self.view.frame.size.width * 0.7, height: 50)
        self.operand1Lbl.text = "0"
        self.operand1Lbl.font = UIFont.systemFont(ofSize: (20))
        self.operand1Lbl.textAlignment = NSTextAlignment.center
        
        // 生成運算元2
        self.operand2Sld = UISlider()
        self.operand2Sld.frame = CGRect(x: (self.view.frame.size.width * 0.3) / 2, y: self.operand1Lbl.frame.origin.y + self.operand1Lbl.frame.size.height, width: self.view.frame.size.width * 0.7, height: 50)
        self.operand2Sld.minimumValue = 0 // 最小值
        self.operand2Sld.maximumValue = 100 // 最大值
        self.operand2Sld.value = 0 // 預設值
        self.operand2Sld.addTarget(self, action: #selector(ViewController.onOperand2SldChange(_:)), for: UIControlEvents.valueChanged)
        
        // 生成運算元2的值
        self.operand2Lbl = UILabel()
        self.operand2Lbl.frame = CGRect(x: (self.view.frame.size.width * 0.3) / 2, y: self.operand2Sld.frame.origin.y + self.operand2Sld.frame.size.height, width: self.view.frame.size.width * 0.7, height: 50)
        self.operand2Lbl.text = "0"
        self.operand2Lbl.font = UIFont.systemFont(ofSize: (20))
        self.operand2Lbl.textAlignment = NSTextAlignment.center
        
        // 生成計算結果
        self.resultLbl = UILabel()
        self.resultLbl.frame = CGRect(x: (self.view.frame.size.width * 0.3) / 2, y: self.operand2Lbl.frame.origin.y + self.operand2Lbl.frame.size.height, width: self.view.frame.size.width * 0.7, height: 50)
        self.resultLbl.text = "計算結果： 0"
        self.resultLbl.font = UIFont.systemFont(ofSize: (20))
        self.resultLbl.textAlignment = NSTextAlignment.center
        
        self.view.addSubview(self.titleLbl)
        self.view.addSubview(self.operand1Sld)
        self.view.addSubview(self.operand1Lbl)
        self.view.addSubview(self.operand2Sld)
        self.view.addSubview(self.operand2Lbl)
        self.view.addSubview(self.resultLbl)
    }
    
    // 滑動operand1觸發事件
    func onOperand1Change(_ sender: UISlider) {
        let result: Int = self.add(Int(round(self.operand1Sld.value)), operand2Value: Int(round(self.operand2Sld.value))) // 計算結果
        self.updateResultLbl(Int(round(self.operand1Sld.value)), operand2Value: nil, result: result) // 更新所有的元件值
    }

    // 滑動operand2觸發事件
    func onOperand2SldChange(_ sender: UISlider) {
        let result: Int = self.add(Int(round(self.operand1Sld.value)), operand2Value: Int(round(self.operand2Sld.value))) // 計算結果
        self.updateResultLbl(nil, operand2Value: Int(round(self.operand2Sld.value)), result: result) // 更新所有的元件值        
    }
    
    // 計算總合
    func add(_ operand1Value: Int, operand2Value: Int) -> Int {
        return operand1Value + operand2Value
    }
    
    // 更新所有的元件值
    func updateResultLbl(_ operand1Value: Int?, operand2Value: Int?, result: Int) {
        if let price = operand1Value {
            self.operand1Lbl.text = "\(price)"
        }
        
        if let price = operand2Value {
            self.operand2Lbl.text = "\(price)"
        }
        
        self.resultLbl.text = "計算結果： \(result)"
    }
    
}

