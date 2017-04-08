//
//  UnitTestsDemoTests.swift
//  UnitTestsDemoTests
//
//  Created by Frank.Chen on 2017/4/8.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import XCTest
@testable import UnitTestsDemo

class UnitTestsDemoTests: XCTestCase {
    
    var viewController: ViewController!
    
    // 該方法在生成該物件的同時即會被觸發，故必須在這裡做初始化的設定，例如生成要被測試的viewController
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("setUp... ")
        self.viewController = ViewController()
    }
    
    // 該方法在所有的測試方法都執行完之後才會被觸發
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        print("tearDown... ")
    }
    
    // 測試加法的演算是否正確
    func testAdd() {
        let result = self.viewController.add(5, operand2Value: 3) // 呼叫要被測試的func
        XCTAssert(result == 8)
    }
    
    // 測試元件的值是否正確顯示
    func testUpdateResultLbl() {
        _ = self.viewController.view // 載入畫面的元件和方法
        
        self.viewController.updateResultLbl(10, operand2Value: nil, result: 10) // 呼叫要被測試的func
        
        XCTAssert(self.viewController.operand1Lbl.text == "10", "operand1Lbl 顯示錯誤的結果")
        XCTAssert(self.viewController.operand2Lbl.text == "0", "operand1Lb2 顯示錯誤的結果")
        XCTAssert(self.viewController.resultLbl.text == "計算結果： 10", "resultLbl 顯示錯誤的結果")
    }
    
}
