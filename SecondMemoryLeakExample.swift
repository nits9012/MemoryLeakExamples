//
//  SecondMemoryLeakExample.swift
//  MemoryLeakProblems
//
//  Created by Nitin Bhatt on 7/3/22.
//

import Foundation
import UIKit

class SecondMemoryLeakExample:UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        //Memory leak issue
        let user = User(name: "John")
        let account = Account(type: "Business")

        user.account = account
        account.user = user
        
        //Resolved meory leak issue
        
        let userSecond = UserSecond(name: "John")
        let accountSecond = AccountSecond(type: "Business")
        
        userSecond.account = accountSecond
        accountSecond.user = userSecond

    }
}


// Memory Leak Issue
class User{
    var name:String?
    
    init(name:String){
        self.name = name
        print("\(name) is being initialized")
    }
    
    var account:Account?
    
    deinit{
        print("User deinit")
    }
}


class Account{
    var type:String?
    var user:User?
    
    init(type:String){
        self.type = type
        print("\(type) is being initialized")
    }
    
    deinit{
        print("Account deinit")
    }
}


// Solution Memory Leak Issue

class UserSecond{
    var name:String?
    
    init(name:String){
        self.name = name
        print("Second \(name) is being initialized")
    }
    
    var account:AccountSecond?
    
    deinit{
        print("Second User deinit")
    }
}


class AccountSecond{
    var type:String?
    weak var user:UserSecond?
    
    init(type:String){
        self.type = type
        print("Second \(type) is being initialized")
    }
    
    deinit{
        print("Second Account deinit")
    }
}
