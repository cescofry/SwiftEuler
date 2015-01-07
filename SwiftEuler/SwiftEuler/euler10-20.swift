//
//  euler10-20.swift
//  SwiftEuler
//
//  Created by Francesco Frison on 07/01/2015.
//  Copyright (c) 2015 Ziofrtiz. All rights reserved.
//

import Foundation

class Exercise10To20: ExerciseGroupable {
    
    var exercise0 = Exercise(description: "The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17. Find the sum of all the primes below two million.") { () -> (String) in
        
        var primes = Primes()
        
        var result = 0
        for i in 0...2000000 {
            result += primes.next()!
        }
        
        return String(result)
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