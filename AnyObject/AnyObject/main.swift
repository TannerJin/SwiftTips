//
//  main.swift
//  AnyObject
//
//  Created by jintao on 2020/5/27.
//  Copyright © 2020 jintao. All rights reserved.
//

import Foundation

class A {
    var value: Int = 3
    
    @objc func aaa() -> Int {
        return value
    }
}

class B {
    var value: Int = 4
    
    @objc func bbb() -> Int {
        return value
    }
}

let obj: AnyObject = A()

let result = obj.aaa()     // = objc_msgSend(obj, #selector(aaa))
assert(result == 3)

let result2 = obj.bbb?()   // dosen't crash
assert(result2 == nil)

let result3 = obj.bbb()    // crash

class C {
    @objc func ccc() {}
}
obj.ccc()   // crash
obj.ddd()   // compile error


