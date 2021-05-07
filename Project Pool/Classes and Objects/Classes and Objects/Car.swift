//
//  Car.swift
//  Classes and Objects
//
//  Created by Mehmet Durmaz on 27.05.2018.
//  Copyright © 2018 Mehmet Durmaz. All rights reserved.
//

import Foundation

enum CarType {  // kendimiz için type oluşturduk
    case Sedan
    case Coupe
    case Hatchback
}

class Car {
    
    // properties (class içinde değillerse defination)
    var colour = "Black" // clasın ön tanımlı rengi
    let numberOfSeats = 5
    var typeOfCar : CarType = .Coupe // kendi typemızı kullandık
    
//    //designated initializor
//    init(customerChosenColour : String, numberOfSeats : Int) {  // kullanıcı girişli renk (şu haliyle girişi zorunlu
//        colour = customerChosenColour
//    }
    
    //convinient initializor
    init() {
        }
    
    convenience init (customerChosenColour : String) {
        self.init()
        colour = customerChosenColour
    }
    
    //metod geliştirme
    func drive() { // normalde fonksiyon ama classın içinde metod
        print("araba hareket ediyor.")
    }
}

