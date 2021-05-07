//: Playground - noun: a place where people can play

import Cocoa

let memocan = [6,2,3,9,4,1]

// closure adayı fonksiyon

func birEkle (n1 : Int) -> Int {
    return n1 + 1
}

//içine input olarak fonksiyon alan hazır fonksiyon
// array.map(transform: (Int) throws -> T)

memocan.map(birEkle)

print(memocan.map{$0 + 1})

memocan.map({ (n1) in n1 + 1 })

print(memocan.map({ (n1) in n1 + 1 }))

//hatta hadi sayıları string yapalım topran

let newMemocan = memocan.map{"\($0)"}

print(newMemocan)
