//
//  main.swift
//  SwiftEuler
//
//  Created by Francesco Frison on 06/01/2015.
//  Copyright (c) 2015 Ziofrtiz. All rights reserved.
//

import Foundation


let numberOpt = ExerciseManager.exerciseNumber()

if let number = numberOpt {
    ExerciseManager.run(number)
}
else {
    println("No exercise found");
}






