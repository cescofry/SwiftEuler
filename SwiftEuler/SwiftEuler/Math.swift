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

class PrimeSubscriptor {
    
    var primes = Primes()
    
    subscript(index: Int) -> Int {
        while primes.primes.count <= index {
            primes.next()
        }
        
        return primes.primes[index]
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
    
    for i in reverse(0...count) {
        let divider = pow(10.0, Double(i))
        let digit = Int(floor(x / divider)%10)
        result += digit
    }
    
    return result
}


func sumOfDivisors(x: Int) -> Int {
    
    return sumOfFactorsPrime(x)
    /*
    var result = 0
    for i in 1...x {
        if (x == i) {
            continue
        }
        if (x%i == 0) {
            result += i
        }
    }
    
    return result
*/
}

func sumOfFactorsPrime(number : Int) -> Int {
    var n = number
    var sum = 1
    var primes = PrimeSubscriptor()
    var p = primes[0]
    var j : Int
    var i = 0;
    let limit = sqrt(number)
    
    while (p * p <= n && n > 1 && i < limit) {
        p = primes[i];
        i++;
        if (n % p == 0) {
            j = p * p;
            n = n / p;
            while (n % p == 0) {
                j = j * p;
                n = n / p;
            }
            sum = sum * (j - 1) / (p - 1);
        }
    }
    
    //A prime factor larger than the square root remains
    if (n > 1) {
        sum *= n + 1;
    }
    return sum - number;
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
