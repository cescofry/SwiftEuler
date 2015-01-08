//
//  ExerciseManager.swift
//  SwiftEuler
//
//  Created by Francesco Frison on 06/01/2015.
//  Copyright (c) 2015 Ziofrtiz. All rights reserved.
//

import Foundation


class Exercise {
    var description = ""
    var solution = ""
    var runBlock: ()->(String)
    
    init(description: String, runBlock: ()->(String)) {
        self.description = description
        self.runBlock = runBlock
    }
    
    func run() {
        println("Problem:\n\(self.description)")
        let start = CFAbsoluteTimeGetCurrent()
        self.solution = runBlock()
        println("\nSolution:    \(self.solution)")
        println("\nExecution time:    \(CFAbsoluteTimeGetCurrent() - start) sec")
    }
}

protocol ExerciseGroupable {
    var exercise0 : Exercise {get set}
    var exercise1 : Exercise {get set}
    var exercise2 : Exercise {get set}
    var exercise3 : Exercise {get set}
    var exercise4 : Exercise {get set}
    var exercise5 : Exercise {get set}
    var exercise6 : Exercise {get set}
    var exercise7 : Exercise {get set}
    var exercise8 : Exercise {get set}
    var exercise9 : Exercise {get set}
}

class ExerciseGroup {
    
    var exercises : ExerciseGroupable
    
    init(exercises: ExerciseGroupable) {
        self.exercises = exercises
    }
    
    
    func run(number : Int) {
        switch number {
        case 0:
            exercises.exercise0.run()
        case 1:
            exercises.exercise1.run()
        case 2:
            exercises.exercise2.run()
        case 3:
            exercises.exercise3.run()
        case 4:
            exercises.exercise4.run()
        case 5:
            exercises.exercise5.run()
        case 6:
            exercises.exercise6.run()
        case 7:
            exercises.exercise7.run()
        case 8:
            exercises.exercise8.run()
        case 9:
            exercises.exercise9.run()
        default:
            assertionFailure("Cannot run exercise number greater than 9")
        }
    }
}

class ExerciseManager {
    
    class func exerciseNumber() -> Int? {
        let arguments = Process.arguments
        
        if arguments.count > 1 {
            return arguments[1].toInt()
        }
        
        println("no exercise found")
        return nil;
    }
    
    class func run(number: Int) {
        
        let classNumber = number / 10
        let exerciseNumber = number % 10
        var exerciseGroup : ExerciseGroup?
        
        switch classNumber {
        case 0:
            exerciseGroup = ExerciseGroup(exercises: Exercise0To10())
        case 1:
            exerciseGroup = ExerciseGroup(exercises: Exercise10To20())
        case 2:
            exerciseGroup = ExerciseGroup(exercises: Exercise20To30())
        default:
            exerciseGroup = nil
        }
        
        if exerciseGroup != nil {
            exerciseGroup!.run(exerciseNumber)
        }
        
    }
}