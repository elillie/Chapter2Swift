//
//  main.swift
//  Chapter2Swift
//
//  Created by Ethan Lillie on 8/26/14.
//  Copyright (c) 2014 Algorithms. All rights reserved.
//

import Foundation

println("Hello, World!")

var llama = "llama"


func merge(A: [Int], p: Int, q: Int, r: Int) -> [Int] {
    let sentinel = NSIntegerMax
    
    let n1 = q - p + 1
    let n2 = r - q
    var left = A[p...q]
    var right = A[q+1...r]
    left.append(sentinel)
    right.append(sentinel)
    
    
    
    var i = 0
    var j = 0
    
    var AA = [Int]()
    
    for k in p...r {
        if left[i] <= right[j] {
            AA.append(left[i])
            i++
        } else {
            AA.append(right[j])
            //A[k] = right[j]
            j++
        }
    }
    return AA
}

func mergeSort(A: [Int], p: Int, r: Int) -> [Int]
{
    var array = A
    
    if p < r {
        var q = (p+r)/2
        array = mergeSort(array, p, q)
        array = mergeSort(array, q+1, r)
        var newArray = merge(array, p, q, r)
        for k in p...r {
            array.removeAtIndex(k)
            array.insert(newArray[k-p], atIndex: k)
        }
        
        println(array)
    }
    return array
}

func didWork() -> Bool {
    
    var array = [1, 2, 3, 4, 5, 6, 1, 3, 5, 7, 9, 11, 11, 11]
    
    var newArray = [Int]()
    
    newArray += merge(array, 0, 5, 13)
    
    println(newArray)
    println(array)
    return true
}

class ArrayHolder {
    var array = [Int]()
    init(){
        for i in 0..<256
        {
            array.append(random()%10);
        }
    }
}


func sortDidWork() -> Bool {
    
    var ah = ArrayHolder.init()
    
    println(ah.array)
    
    
    println(mergeSort(ah.array, 0, ah.array.count-1))
    return true
}


//var shit = didWork()
var tit = sortDidWork()
println()
