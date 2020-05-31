//
//  main.swift
//  Lazy
//
//  Created by jintao on 2020/5/27.
//  Copyright © 2020 jintao. All rights reserved.
//

import Foundation

class A {
    lazy var aa: String = {
        var str = "AAA"
        str += "--"
        return str
    }()
}

/* After Compiled (SIL)
 
 Class A {
    var $__lazy_storage_$_aa: String?
 
    var aa: String {
        get {   // Not Thread Safe
            if $__lazy_storage_$_aa != nil {
                return $__lazy_storage_$_aa!
            } else {
                var str = "AAA"
                str += "--"
                $__lazy_storage_$_aa = str
                return str
            }
        }
        set {
            $__lazy_storage_$_aa = newValue
        }
    }
 }
 */
