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
        var next = 0
        while next < 2000000 {
            result += next
            next = primes.next()!
        }
        
        return String(result)
    }
    
    var exercise1 = Exercise(description: "In the 20×20 grid below, four numbers along a diagonal line have been marked in red. The product of these numbers is 26 × 63 × 78 × 14 = 1788696. What is the greatest product of four adjacent numbers in the same direction (up, down, left, right, or diagonally) in the 20×20 grid?") { () -> (String) in
        
        
/*
        parseInput("08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08|49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00|81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65|52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91|22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80|24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50|32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70|67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21|24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72|21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95|78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92|16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57|86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58|19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40|04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66|88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69|04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36|20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16|20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54|01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48")
*/
        
        
        struct Point {
            var x : Int
            var y : Int
        }
        
        typealias Matrix = [[Int]]
        
        enum Direction {
            case Right
            case RightDown
            case Down
            case LeftDown
        }
        
        func sumFromPoint(pointIn: Point, direction: Direction, matrix: Matrix) -> Int {
            
            var result = 1
            var point = pointIn
            
            
            for i in 0..<4 {
                
                if (point.x < 0 || point.x > matrix.count || point.y < 0 || point.y > matrix.count) {
                    return result
                }
                
                result *= matrix[point.x][point.y]
            
                switch direction {
                case .Right:
                    point.x++
                case .RightDown:
                    point.x++
                    point.y++
                case .Down:
                    point.y++
                case .LeftDown:
                    point.x--
                    point.y++
                }
                
            }
            return result
        }
        
        var matrix : Matrix = Array()
        
        matrix.append([08, 02, 22, 97, 38, 15, 00, 40, 00, 75, 04, 05, 07, 78, 52, 12, 50, 77, 91, 08])
        matrix.append([49, 49, 99, 40, 17, 81, 18, 57, 60, 87, 17, 40, 98, 43, 69, 48, 04, 56, 62, 00])
        matrix.append([81, 49, 31, 73, 55, 79, 14, 29, 93, 71, 40, 67, 53, 88, 30, 03, 49, 13, 36, 65])
        matrix.append([52, 70, 95, 23, 04, 60, 11, 42, 69, 24, 68, 56, 01, 32, 56, 71, 37, 02, 36, 91])
        matrix.append([22, 31, 16, 71, 51, 67, 63, 89, 41, 92, 36, 54, 22, 40, 40, 28, 66, 33, 13, 80])
        matrix.append([24, 47, 32, 60, 99, 03, 45, 02, 44, 75, 33, 53, 78, 36, 84, 20, 35, 17, 12, 50])
        matrix.append([32, 98, 81, 28, 64, 23, 67, 10, 26, 38, 40, 67, 59, 54, 70, 66, 18, 38, 64, 70])
        matrix.append([67, 26, 20, 68, 02, 62, 12, 20, 95, 63, 94, 39, 63, 08, 40, 91, 66, 49, 94, 21])
        matrix.append([24, 55, 58, 05, 66, 73, 99, 26, 97, 17, 78, 78, 96, 83, 14, 88, 34, 89, 63, 72])
        matrix.append([21, 36, 23, 09, 75, 00, 76, 44, 20, 45, 35, 14, 00, 61, 33, 97, 34, 31, 33, 95])
        matrix.append([78, 17, 53, 28, 22, 75, 31, 67, 15, 94, 03, 80, 04, 62, 16, 14, 09, 53, 56, 92])
        matrix.append([16, 39, 05, 42, 96, 35, 31, 47, 55, 58, 88, 24, 00, 17, 54, 24, 36, 29, 85, 57])
        matrix.append([86, 56, 00, 48, 35, 71, 89, 07, 05, 44, 44, 37, 44, 60, 21, 58, 51, 54, 17, 58])
        matrix.append([19, 80, 81, 68, 05, 94, 47, 69, 28, 73, 92, 13, 86, 52, 17, 77, 04, 89, 55, 40])
        matrix.append([04, 52, 08, 83, 97, 35, 99, 16, 07, 97, 57, 32, 16, 26, 26, 79, 33, 27, 98, 66])
        matrix.append([88, 36, 68, 87, 57, 62, 20, 72, 03, 46, 33, 67, 46, 55, 12, 32, 63, 93, 53, 69])
        matrix.append([04, 42, 16, 73, 38, 25, 39, 11, 24, 94, 72, 18, 08, 46, 29, 32, 40, 62, 76, 36])
        matrix.append([20, 69, 36, 41, 72, 30, 23, 88, 34, 62, 99, 69, 82, 67, 59, 85, 74, 04, 36, 16])
        matrix.append([20, 73, 35, 29, 78, 31, 90, 01, 74, 31, 49, 71, 48, 86, 81, 16, 23, 57, 05, 54])
        matrix.append([01, 70, 54, 71, 83, 51, 54, 69, 16, 92, 33, 48, 61, 43, 52, 01, 89, 19, 67, 48])
        
        var result = 0;
        
        let limitX : Int = matrix.count - 4
        let limitY : Int = matrix[0].count - 4
        
        
        for x in 0..<limitX {
            for y in 0..<limitY {
                let valueR = sumFromPoint(Point(x: x, y: y), .Right, matrix)
                result  = max(valueR, result)
                
                let valueRD = sumFromPoint(Point(x: x, y: y), .RightDown, matrix)
                result = max(valueRD, result)
                
                let valueD = sumFromPoint(Point(x: x, y: y), .Down, matrix)
                result = max(valueD, result)
                
                let valueLD = sumFromPoint(Point(x: x, y: y), .LeftDown, matrix)
                result = max(valueLD, result)
            }
        }
        
        
        return String(result)
    }
    
    var exercise2 = Exercise(description: "The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be: 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ... We can see that 28 is the first triangle number to have over five divisors. What is the value of the first triangle number to have over five hundred divisors?") { () -> (String) in
        
        
        func numberOfDividersOf(number: Int) -> Int {
            
            let limit = sqrt(number)
            var result = 0;
            
            for i in 1...limit {
                if (number%i == 0) {
                    result += 2
                }
            }
            
            return result
        }
        
        var triangles = Triangles()
        var next = 0
        var max = 0
        
        while true {
            next = triangles.next()!
            
            // Assumption that %2 is no good! In reality we could assume a %10 as well
            if next%2 != 0 {
                continue
            }
            
            let dividers = numberOfDividersOf(next)
            
            if (dividers > max) {
                max = dividers
                println("\(max): \(next)")
            }
            
            if dividers >= 500 {
                return String(next)
            }
            
            
        }
    }
    
    var exercise3 = Exercise(description: "Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.") { () -> (String) in
        
        var lines : [String] = Array()

        lines.append("37107287533902102798797998220837590246510135740250")
        lines.append("46376937677490009712648124896970078050417018260538")
        lines.append("74324986199524741059474233309513058123726617309629")
        lines.append("91942213363574161572522430563301811072406154908250")
        lines.append("23067588207539346171171980310421047513778063246676")
        lines.append("89261670696623633820136378418383684178734361726757")
        lines.append("28112879812849979408065481931592621691275889832738")
        lines.append("44274228917432520321923589422876796487670272189318")
        lines.append("47451445736001306439091167216856844588711603153276")
        lines.append("70386486105843025439939619828917593665686757934951")
        lines.append("62176457141856560629502157223196586755079324193331")
        lines.append("64906352462741904929101432445813822663347944758178")
        lines.append("92575867718337217661963751590579239728245598838407")
        lines.append("58203565325359399008402633568948830189458628227828")
        lines.append("80181199384826282014278194139940567587151170094390")
        lines.append("35398664372827112653829987240784473053190104293586")
        lines.append("86515506006295864861532075273371959191420517255829")
        lines.append("71693888707715466499115593487603532921714970056938")
        lines.append("54370070576826684624621495650076471787294438377604")
        lines.append("53282654108756828443191190634694037855217779295145")
        lines.append("36123272525000296071075082563815656710885258350721")
        lines.append("45876576172410976447339110607218265236877223636045")
        lines.append("17423706905851860660448207621209813287860733969412")
        lines.append("81142660418086830619328460811191061556940512689692")
        lines.append("51934325451728388641918047049293215058642563049483")
        lines.append("62467221648435076201727918039944693004732956340691")
        lines.append("15732444386908125794514089057706229429197107928209")
        lines.append("55037687525678773091862540744969844508330393682126")
        lines.append("18336384825330154686196124348767681297534375946515")
        lines.append("80386287592878490201521685554828717201219257766954")
        lines.append("78182833757993103614740356856449095527097864797581")
        lines.append("16726320100436897842553539920931837441497806860984")
        lines.append("48403098129077791799088218795327364475675590848030")
        lines.append("87086987551392711854517078544161852424320693150332")
        lines.append("59959406895756536782107074926966537676326235447210")
        lines.append("69793950679652694742597709739166693763042633987085")
        lines.append("41052684708299085211399427365734116182760315001271")
        lines.append("65378607361501080857009149939512557028198746004375")
        lines.append("35829035317434717326932123578154982629742552737307")
        lines.append("94953759765105305946966067683156574377167401875275")
        lines.append("88902802571733229619176668713819931811048770190271")
        lines.append("25267680276078003013678680992525463401061632866526")
        lines.append("36270218540497705585629946580636237993140746255962")
        lines.append("24074486908231174977792365466257246923322810917141")
        lines.append("91430288197103288597806669760892938638285025333403")
        lines.append("34413065578016127815921815005561868836468420090470")
        lines.append("23053081172816430487623791969842487255036638784583")
        lines.append("11487696932154902810424020138335124462181441773470")
        lines.append("63783299490636259666498587618221225225512486764533")
        lines.append("67720186971698544312419572409913959008952310058822")
        lines.append("95548255300263520781532296796249481641953868218774")
        lines.append("76085327132285723110424803456124867697064507995236")
        lines.append("37774242535411291684276865538926205024910326572967")
        lines.append("23701913275725675285653248258265463092207058596522")
        lines.append("29798860272258331913126375147341994889534765745501")
        lines.append("18495701454879288984856827726077713721403798879715")
        lines.append("38298203783031473527721580348144513491373226651381")
        lines.append("34829543829199918180278916522431027392251122869539")
        lines.append("40957953066405232632538044100059654939159879593635")
        lines.append("29746152185502371307642255121183693803580388584903")
        lines.append("41698116222072977186158236678424689157993532961922")
        lines.append("62467957194401269043877107275048102390895523597457")
        lines.append("23189706772547915061505504953922979530901129967519")
        lines.append("86188088225875314529584099251203829009407770775672")
        lines.append("11306739708304724483816533873502340845647058077308")
        lines.append("82959174767140363198008187129011875491310547126581")
        lines.append("97623331044818386269515456334926366572897563400500")
        lines.append("42846280183517070527831839425882145521227251250327")
        lines.append("55121603546981200581762165212827652751691296897789")
        lines.append("32238195734329339946437501907836945765883352399886")
        lines.append("75506164965184775180738168837861091527357929701337")
        lines.append("62177842752192623401942399639168044983993173312731")
        lines.append("32924185707147349566916674687634660915035914677504")
        lines.append("99518671430235219628894890102423325116913619626622")
        lines.append("73267460800591547471830798392868535206946944540724")
        lines.append("76841822524674417161514036427982273348055556214818")
        lines.append("97142617910342598647204516893989422179826088076852")
        lines.append("87783646182799346313767754307809363333018982642090")
        lines.append("10848802521674670883215120185883543223812876952786")
        lines.append("71329612474782464538636993009049310363619763878039")
        lines.append("62184073572399794223406235393808339651327408011116")
        lines.append("66627891981488087797941876876144230030984490851411")
        lines.append("60661826293682836764744779239180335110989069790714")
        lines.append("85786944089552990653640447425576083659976645795096")
        lines.append("66024396409905389607120198219976047599490197230297")
        lines.append("64913982680032973156037120041377903785566085089252")
        lines.append("16730939319872750275468906903707539413042652315011")
        lines.append("94809377245048795150954100921645863754710598436791")
        lines.append("78639167021187492431995700641917969777599028300699")
        lines.append("15368713711936614952811305876380278410754449733078")
        lines.append("40789923115535562561142322423255033685442488917353")
        lines.append("44889911501440648020369068063960672322193204149535")
        lines.append("41503128880339536053299340368006977710650566631954")
        lines.append("81234880673210146739058568557934581403627822703280")
        lines.append("82616570773948327592232845941706525094512325230608")
        lines.append("22918802058777319719839450180888072429661980811197")
        lines.append("77158542502016545090413245809786882778948721859617")
        lines.append("72107838435069186155435662884062257473692284509516")
        lines.append("20849603980134001723930671666823555245252804609722")
        lines.append("53503534226472524250874054075591789781264330331690")
        
        
        var result : Double = 0
        
        for line in lines {
            let value = (line as NSString).doubleValue
            
            result += value
        }
        
        let positions = log10(result) - 10
        let divider = pow(10.0, ceil(positions))
        
        result /= divider
        
        let resultDigits = Int64(result)
        
        return String(resultDigits)
    }
    
    var exercise4 = Exercise(description: "The following iterative sequence is defined for the set of positive integers: n → n/2 (n is even) n → 3n + 1 (n is odd) Using the rule above and starting with 13, we generate the following sequence: 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1 It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1. Which starting number, under one million, produces the longest chain? NOTE: Once the chain starts the terms are allowed to go above one million.") { () -> (String) in
        
        
        struct Collatz : GeneratorType {
            var currentElement : Int
            typealias Element = Int
            
            private mutating func next() -> Element? {
                
                if (currentElement == 1) {
                    return nil
                }
                
                if currentElement%2 == 0 {
                    currentElement /= 2
                }
                else {
                    currentElement = (currentElement * 3) + 1
                }
                
                return currentElement
            }
        }
        
        var result = 0
        var max = 0
        
        for i in 1...1000000 {
            var coll = Collatz(currentElement: i)
            
            var count = 0
            
            while let next = coll.next() {
                count++
            }
            
            if (count > max) {
                max = count
                result = i
            }
            
        }
        
        return String(result)
    }
    
    var exercise5 = Exercise(description: "Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner. How many such routes are there through a 20×20 grid?") { () -> (String) in
        
        
        // Combinatorics solution. Not really mine!
        var size = 20
        var paths = 1
        
        for i in 0..<size {
            paths *= (2 * size) - i
            paths /= i + 1
        }
        
        return String(paths)
    }
    
    var exercise6 = Exercise(description: "2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26. What is the sum of the digits of the number 2^1000?") { () -> (String) in
        
        
        let value = pow(2.0, 1000.0)
        let lenght = Int(ceil(log10(value)))

        var result = 0;
        for i in reverse(0..<lenght) {
            let divider = pow(10.0, Double(i))
            let digit = Int((value / divider)%10)
            result += digit
            
        }
        
        return String(result)
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
