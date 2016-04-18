//: Playground - noun: a place where people can play

import UIKit
import RxSwift
import RxCocoa

var str = "Hello, playground"


print("Goodbye")

let a = BehaviorSubject(value: 1)
let b = BehaviorSubject(value: 2)

a.subscribeNext { print ($0) }
b.subscribeNext { print ($0) }

b.filter {( $0 == 4 )}.subscribeNext ({ print("filter -------> \($0)") })

a.onNext(3)
a.onNext(5)
a.onNext(7)

b.onNext(4)
b.onNext(6)
b.onNext(8)

a.filter {( $0 == 3 )}.subscribeNext ({ print("filter ---> \($0)") })
