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

func factorial(x: Double) -> Double {
    return factorial_(x, 1)
}

private func factorial_(var x: Double, var reminder: Double) -> Double {
    if (x == 1) {
        return reminder
    }
    
    reminder *= x
    x--
    return factorial_(x, reminder)
}

func sumOfDigits(x: Double) -> Int {
    let count = Int(log10(x))
    
    var result = 0
    
    for i in 0...count {
        let divider = pow(10.0, Double(i))
        let digit = Int(ceil(x / divider)%10)
        result += digit
    }
    
    return result
}



func parseInput(input: String) {
    var lines = input.componentsSeparatedByString("|")
    
    for line in lines {
        
        let numbers = line.componentsSeparatedByString(" ") as NSArray
        let numbersLine = numbers.componentsJoinedByString(", ")
        let varLine = "linkedList.append([\(numbersLine)])"
        println(varLine)
        
    }
    
}
