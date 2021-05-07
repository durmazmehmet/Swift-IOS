//
//  MyOperation.swift
//  OperationQueueThreading
//
//  Created by Kaan Aslan on 14.03.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit

class MyOperation: Operation
{

    init(_ name: String)
    {
        super.init()
        self.name = name
    }
    
    override func main()
    {
        for i in 0..<10 {
            print("\(self.name!): \(i)")
          //  sleep(1)
            if isCancelled {
                break
            }
        }
        
    }
    
    override func cancel()
    {
        print("cancellation occurs")
        super.cancel()
    }
}
