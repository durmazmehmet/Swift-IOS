//
//  SelfDrivingCar.swift
//  Classes and Objects
//
//  Created by Mehmet Durmaz on 27.05.2018.
//  Copyright © 2018 Mehmet Durmaz. All rights reserved.
//

import Foundation

class SelfDrivingCar : Car {  // inherits properties from Car (sub class olduk, car superclass oldu
    
    var destination : String? //? nil içerebilir demek; optional string data type declaration
    //? ile optional var oluştururuz. kullanırken ! koyarız yani force unwrapping  yaparız. srçdingerin kedisi stayla
    
    override func drive() {
        super.drive()
        
        //print(destination!) force unwrapping yaptık eğer nil ise çöker
        
        if let userSetDestination = destination { // yukarıdaki göçme işinden kaçmak için aynen bu şekilde kullanırız ! yok bak
           print(userSetDestination) //hem car.drive çalışacak üstüne bu çalışacak
        }        
    }
}
