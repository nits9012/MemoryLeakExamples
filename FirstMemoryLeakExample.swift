//
//  FirstMemoryLeakExample.swift
//  MemoryLeakProblems
//
//  Created by Nitin Bhatt on 7/3/22.
//

import Foundation
import UIKit


class FirstMemoryLeakExample: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let firstExample = MemoryLeakIssue()
        print(firstExample.incrementCounter())
        
        let secondExample = MemoryLeakIssueSolution()
        print(secondExample.incrementCounter())
    }
}


class MemoryLeakIssue{
    
    var counter = 0
    var closure:()->() = {}
    
    init(){
        closure = {
            self.counter += 1
            print(self.counter)
        }
    }
    
    func incrementCounter(){
        closure()
    }
    
    // Deinit will not call because self.counter is storng reference
    deinit{
        print("first deinit called")
    }
}


class MemoryLeakIssueSolution{
    
    var counter = 0
    var closure:()->() = {}
    
    init(){
        closure = {[weak self] in
            self?.counter += 1
            print(self?.counter)
        }
    }
    
    
    func incrementCounter(){
        closure()
    }
    
    // Deinit will  call because self.counter is weak reference
    deinit{
        print("second deinit called")
    }
}
