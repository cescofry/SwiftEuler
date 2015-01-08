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
        
        func sumOfDividers(x: Int) ->Int {

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
        }
        
        
        var result = 0
        for i in 2...10000 {

            let iSum = sumOfDividers(i)
            if (i == iSum) {
                continue
            }
            
            if (i == sumOfDividers(iSum)) {
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
    
    var exercise3 = Exercise(description: "") { () -> (String) in
        return ""
    }
    
    var exercise4 = Exercise(description: "") { () -> (String) in
        return ""
    }
    
    var exercise5 = Exercise(description: "") { () -> (String) in
        return ""
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