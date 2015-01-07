//
//  Math.swift
//  SwiftEuler
//
//  Created by Francesco Frison on 07/01/2015.
//  Copyright (c) 2015 Ziofrtiz. All rights reserved.
//

import Foundation


struct Primes : GeneratorType {
    
    typealias Element = Int
    
    var primes : [Int] = Array()
    
    mutating func next() -> Element? {
        
        if primes.count == 0 {
            primes.append(2)
            return 2
        }
        
        var next = primes.last!
        
        while true {
            next++
            var isPrime = true
            let limit = Int(sqrt(Float(next)))
            
            for divider in primes {
                if (divider > limit) {
                    break
                }
                isPrime = (next%divider != 0)
                if !isPrime {
                    break
                }
            }
            
            if isPrime {
                primes.append(next)
                return next
            }
        }
    }
}
