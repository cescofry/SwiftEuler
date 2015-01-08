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
        return String(sum) // 648
    }
    
    var exercise1 = Exercise(description: "") { () -> (String) in
        return ""
    }
    
    var exercise2 = Exercise(description: "") { () -> (String) in
        return ""
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