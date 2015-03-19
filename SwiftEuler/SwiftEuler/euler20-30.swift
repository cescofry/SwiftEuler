//
//  euler20-30.swift
//  SwiftEuler
//
//  Created by Francesco Frison on 08/01/2015.
//  Copyright (c) 2015 Ziofrtiz. All rights reserved.
//

import Foundation


class Exercise20To30: ExerciseGroupable {
    
    var exercise0 = Exercise(description: "n! means n × (n − 1) × ... × 3 × 2 × 1 For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800, and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27. Find the sum of the digits in the number 100!") { () -> (String) in
        
        let result = factorial(100)
        
        let sum = sumOfDigits(result)
        return String(sum) // Gives 554 while the real factorial sum apparently is 648
    }
    
    var exercise1 = Exercise(description: "Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n). If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers. For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220. Evaluate the sum of all the amicable numbers under 10000.") { () -> (String) in
        

        var result = 0
        for i in 2...10000 {

            let iSum = sumOfDivisors(i)
            if (i == iSum) {
                continue
            }
            
            if (i == sumOfDivisors(iSum)) {
                result += iSum + i
            }
            
        }
        
        return String(result/2)
    }
    
    var exercise2 = Exercise(description: "Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score. For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714. What is the total of all the name scores in the file?") { () -> (String) in
        
        
        func nameValue(name: String) -> Int {

            let alphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
            let nameArray = Array(name)
            let limit = nameArray.count
            
            var result = 0
            
            for i in 0..<limit {
                let char = nameArray[i]
                let index = find(alphabet, char)
                
                if let score = index {
                    result += (score + 1)
                }
                else {
                    println("\(char) not found")
                }
            }
            
            return result
        }
        
        /* TEST */
        
        if (nameValue("COLIN") != 53) {
            assertionFailure("nameValue() not behaving as expected")
        }
        
        let charset = NSCharacterSet(charactersInString: "\"\n ")
        let alphabet = NSCharacterSet(charactersInString: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        
        var namesQ : [NSString] = Array()
        
        
        if let url = NSURL(fileURLWithPath: "/Users/ffrison/Dev/Ziofritz/tests/SwiftEuler/SwiftEuler/SwiftEuler/_etc/p022_names.txt") {
            if let inputS = NSString(contentsOfURL: url, encoding: NSUTF8StringEncoding, error: nil) {
                
                let test = inputS.componentsSeparatedByString(",")
                
                for name in test {

                }
                
                namesQ = inputS.componentsSeparatedByString(",").map {
                    (name) -> NSString in
                    var nameNS = (name as NSString)
                    let trimmed = nameNS.stringByTrimmingCharactersInSet(charset)
                    
                    return trimmed
                }
                
                namesQ.sort() {$0.compare($1) == NSComparisonResult.OrderedAscending}
            }
        }
        
        var result = 0
        
        for (index, name) in enumerate(namesQ) {
            let value = ((index + 1) * nameValue(name))
            result += value
        }
        
        
        return String(result)
    }
    
    var exercise3 = Exercise(description: "A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number. A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n. As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit. Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.") { () -> (String) in
        
        
        struct Abundants : GeneratorType {
            
            var current = 0
            let limit = 28123
            typealias Element = Int
            
            private mutating func next() -> Element? {
                
                for i in (current + 1)...limit {
                    if sumOfDivisors(i) > i {
                        current = i
                        return i
                    }
                }
                
                return nil
                
            }
            
            mutating func all() -> [Int] {
                current = 0
                var all : [Int] = Array()
                
                while let next = self.next() {
                    all.append(next)
                }
                
                return all
            }
        }
        
        
        var abundants = Abundants()
        let all = abundants.all()
        
        var abundantsSum : [Int : Bool] = Dictionary()
        for i in 0...abundants.limit {
            for j in 0...abundants.limit {
                abundantsSum[i + j] = true
            }
        }
        
        var result = 0
        for i in 1...abundants.limit {
            if abundantsSum[i] == nil {
                result += i
            }
        }
        
        
        return String(result)
    }
    
    var exercise4 = Exercise(description: "A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are: 012   021   102   120   201   210 What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?") { () -> (String) in
        
       return ""
    }
    
    var exercise5 = Exercise(description: "The Fibonacci sequence is defined by the recurrence relation: Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1. The 12th term, F12, is the first term to contain three digits. What is the first term in the Fibonacci sequence to contain 1000 digits?") { () -> (String) in
        
        
        struct Fibonacci : GeneratorType {
            typealias Element = Double
            var all : [Element] = Array()
            var currentIndex = 0
            
            private mutating func next() -> Element? {
                
                var result = 0.0e1000
                
                if (currentIndex > 0){
                    let mi1 = Double(self.all[(currentIndex - 1)])
                    result += mi1
                }

                if (currentIndex > 1) {
                    let mi2 = Double(self.all[(currentIndex - 2)])
                    result += mi2
                }
                
                if (result == 0) {
                    result = 1
                }
                
                self.all.append(result)
                currentIndex++;
                
                return result
            }
        }
        
        var fibonacci = Fibonacci()
        var next = 1.0e1000
        next = Double(fibonacci.next()!)
        while (true) {
            if (next >= 1.0e1000) {
                return "\(next) -> \(fibonacci.all.count)"
            }
            next = Double(fibonacci.next()!)
        }
        
    }
    
    var exercise6 = Exercise(description: "") { () -> (String) in
        return ""
    }
    
    var exercise7 = Exercise(description: "") { () -> (String) in
        return ""
    }
    
    var exercise8 = Exercise(description: "") { () -> (String) in
        return ""
    }
    
    var exercise9 = Exercise(description: "") { () -> (String) in
        return ""
    }
    
    
    
}