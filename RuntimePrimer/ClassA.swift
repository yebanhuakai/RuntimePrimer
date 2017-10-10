//
//  ClassA.swift
//  OC_Swfit_Bridge_Test
//
//  Created by Shenry on 2017/10/9.
//  Copyright © 2017年 Shenry. All rights reserved.
//

import Foundation

class ClassA:NSObject {
    var name:String
    
    func printName() {
        print(name)
    }
    
    init(name:String) {
        self.name = name
    }
}
