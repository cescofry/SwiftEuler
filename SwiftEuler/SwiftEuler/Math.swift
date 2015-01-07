//
//  Math.swift
//  SwiftEuler
//
//  Created by Francesco Frison on 07/01/2015.
//  Copyright (c) 2015 Ziofrtiz. All rights reserved.
//

import Foundation


func sqrt(x: Int) -> Int {
    return Int(sqrt(Float(x)))
}


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

struct Triangles : GeneratorType {
    
    typealias Element = Int
    
    var primes : [Int] = Array()
    
    mutating func next() -> Element? {
        
        if primes.count == 0 {
            primes.append(1)
            return 1
        }
        
        let last = primes.last!
        let next = last + primes.count + 1
        primes.append(next)
        
        return next
    }
}


func parseInput(input: String) {
    var lines = input.componentsSeparatedByString("|")
    
    for (index, line) in enumerate(lines) {
        let lineCommas = line.stringByReplacingOccurrencesOfString(" ", withString: ", ", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        let varLine = "matrix.append([\(lineCommas)])"
        
        println(varLine)
    }
}
