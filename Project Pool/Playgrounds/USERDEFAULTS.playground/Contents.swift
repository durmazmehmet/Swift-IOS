 b//: Playground - noun: a place where people can play

import UIKit

let defaults = UserDefaults.standard

defaults.set(0.24, forKey: "Volüm")

let volume = defaults.float(forKey: "Volüm")

defaults.set(Date(), forKey: "deneme")

let son = defaults.object(forKey: "deneme")


