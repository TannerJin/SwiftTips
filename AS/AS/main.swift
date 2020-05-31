//
//  main.swift
//  AS
//
//  Created by jintao on 2020/5/31.
//  Copyright © 2020 jintao. All rights reserved.
//

import Foundation

class Poo {
    var value: Int
    
    init(_ value: Int) {
        self.value = value
    }
}

struct Foo {
    var value: Int
}

extension Foo: _ObjectiveCBridgeable {
    typealias _ObjectiveCType = Poo
    
    func _bridgeToObjectiveC() -> Poo {
        return Poo(value)
    }
    
    static func _forceBridgeFromObjectiveC(_ source: Poo, result: inout Foo?) {
        
    }
    
    static func _conditionallyBridgeFromObjectiveC(_ source: Poo, result: inout Foo?) -> Bool {
        return source.value == result?.value
    }
    
    static func _unconditionallyBridgeFromObjectiveC(_ source: Poo?) -> Foo {
        return Foo(value: source?.value ?? 0)
    }
}


let foo = Foo(value: 100)
// 编译器会根据当前语境生成调用Foo实现的_ObjectiveCBridgeable方法转换生成Poo
let poo = foo as Poo


class AAA {
    /* 1. 该函数编译后会生成两个函数，一个给虚函数表调用，一个给objc调用
       2. 给objc调用的. 在参数使用前，会调用_ObjectiveCBridgeable协议方法, 将Poo生成_ObjectiveCType对象使用. 在函数return前也会调用_ObjectiveCBridgeable协议方法将生成_ObjectiveCType转换成struct Poo返回
     */
    @objc func test(_ foo: Foo) -> Foo {
        return foo
    }
}
