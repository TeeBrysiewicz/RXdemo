//
//  Model.swift
//  RACdemo
//
//  Created by Tobias Robert Brysiewicz on 4/11/16.
//  Copyright © 2016 TRBO. All rights reserved.
//

import UIKit
import ReactiveCocoa

class Model: NSObject {

    static let sharedInstance = Model()
    
    var firstName: String? {
        return "Toby"
    }
    
    var lastName: String? {
        return "Brysiewicz"
    }
    
    var fullName: String? {
        if let first = Model.sharedInstance.firstName {
            if let last = Model.sharedInstance.lastName {
                let full = first + " " + last
                return full
            }
        }
        return "No name found"
    }
}


public struct RAC  {
    var target: NSObject
    var keyPath: String
    var nilValue: AnyObject?
    
    public init(_ target: NSObject, _ keyPath: String, nilValue: AnyObject? = nil) {
        self.target = target
        self.keyPath = keyPath
        self.nilValue = nilValue
    }
    
    func assignSignal(signal : RACSignal) -> RACDisposable {
        return signal.setKeyPath(self.keyPath, onObject: self.target, nilValue: self.nilValue)
    }
}

infix operator <~ {
associativity right
precedence 93
}

public func <~ (rac: RAC, signal: RACSignal) -> RACDisposable {
    return signal ~> rac
}

public func ~> (signal: RACSignal, rac: RAC) -> RACDisposable {
    return rac.assignSignal(signal)
}

public func RACObserve(target: NSObject!, _ keyPath: String) -> RACSignal {
    return target.rac_valuesForKeyPath(keyPath, observer: target)
}