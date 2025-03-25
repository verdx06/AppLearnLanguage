//
//  AppLearnLanguageTests.swift
//  AppLearnLanguageTests
//
//  Created by Виталий Багаутдинов on 25.03.2025.
//

import XCTest
@testable import AppLearnLanguage

final class AppLearnLanguageTests: XCTestCase {
    
    let queue: [QueueModel] = [
        .init(id: "1", image: "illustrations", text: "Confidence in your words", subtext: "With conversation-based learning,\nyou'll be talking from lesson one"),
        .init(id: "2", image: "illustrations-2", text: "Take your time to learn", subtext: "Develop a habit of learning and\nmake it a part of your daily routine"),
        .init(id: "3", image: "illustrations-3", text: "The lessons you need to learn", subtext: "Using a variety of learning styles to learn\nand retain")
    ]

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testImageAndTextQueue() {
        let viewModel = OnboardingView.ViewModel(customqueue: queue, lastKey: "0")
         
         var remainingItems = viewModel.queue.count
         
         while true {
             // Проверяем, не пуста ли очередь
             guard !viewModel.queue.isEmpty else { return }
             
             // Защита от бесконечного цикла
             guard remainingItems > 0 else { XCTFail(); return }
             
             // Получаем первый элемент из очереди
             guard let firstElement = viewModel.queue.first else {
                 XCTFail()
                 return
             }
             
             // Получаем текущий отображаемый элемент
             let currentElement = viewModel.current
             
             // Проверяем, что текущий элемент НЕ равен первому элементу в очереди
             // (так как после next() они должны поменяться местами)
             XCTAssertNotEqual(firstElement.id, currentElement?.id)
             
             // Переходим к следующему элементу
             viewModel.next()
             remainingItems -= 1
             
             // Получаем новый текущий элемент
             let newCurrentElement = viewModel.current
             
             // Проверяем, что новый текущий элемент равен тому, который был первым в очереди до next()
             XCTAssertEqual(newCurrentElement?.id, firstElement.id)
         }
    }
    
    func testNext_RemovesCurrentItemFromQueue() {
        let viewModel = OnboardingView.ViewModel(customqueue: queue, lastKey: "0")
        var i = viewModel.queue.count
        
        while true {
            guard !viewModel.queue.isEmpty else { return }
            
            guard i >= 0 else { XCTFail(); return }
            
            let currentCount = viewModel.queue.count
            
            viewModel.next()
            i -= 1
            
            let newCount = viewModel.queue.count
            
            let difference = currentCount - newCount
            
            XCTAssertEqual(difference, 1)
        }
    }
    
    func testTextButton() {
        let vm = OnboardingView.ViewModel(customqueue: queue, lastKey: "0")
        
        let button = vm.button
        
        vm.next()
        
        let button2 = vm.button
        
        vm.next()
        
        let button3 = vm.button
        
        XCTAssertTrue(button != button2)
        XCTAssertTrue(button2 != button3)
        
        
    }
    
    

}
