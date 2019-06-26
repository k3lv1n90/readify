//
//  Process.swift
//  App
//
//  Created by Kelvin Chong on 26/6/19.
//

import Foundation

class Process {
    
    public static func processFib(arg: String) -> (String) {
        guard let sequenceNum = Int64(arg) else {
            return "{'message':'The request is invalid.'}"
        }
        var a: Int64 = 0
        var b: Int64 = 1
        var c: Int64 = 0
        var i: Int64 = 2
        
        if sequenceNum == 0 {
            return "0"
        } else {
            while i <= sequenceNum {
                c = a + b
                a = b
                b = c
                i += 1
            }
            return "\(b)"
        }
    }
    
    public static func processRev(arg: String) -> (String) {
        //https://stackoverflow.com/questions/49630553/reverse-words-in-a-sentence-swift
        let result = arg.split(separator: " ").map { String($0.reversed())}.joined(separator: " ")
        return result
    }
    
    public static func processTok(arg: String) -> (String) {
        print(arg)
        return arg
    }
    public static func processTri(arg: [String]) -> (String) {
        if arg.count != 3 {
            return "{'message':'The request is invalid.'}"
        }
        let val = arg.sorted()
        if (val[0] == val[1] && val[1] == val[2]) {
            return "Equilateral"
        } else if (val[0] == val[1] || val[1] == val[2]) {
            return "Isosceles"
        } else if (checkIfScalene(strArray: val)) {
            return "Scalene"
        } else {
            return "Error"
        }
        
    }
    
    static func checkIfScalene(strArray : [String]) -> Bool {
        
        var valid = false
        guard let a = Int(strArray[0]) else {
            return false
        }
        guard let b = Int(strArray[1]) else {
            return false
        }
        guard let c = Int(strArray[2]) else {
            return false
        }

        //3,10,5
        
        if ((a + b) > c) && ((a + c) > b) && ((b + c) > a) {
            valid = true
        } 
        return valid
    }
    
}
