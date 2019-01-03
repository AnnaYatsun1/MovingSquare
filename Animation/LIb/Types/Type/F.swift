
//
//  T.swift
//  CarWashUK
//
//  Created by Anna Yatsun on 31/10/2018.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

enum F {
    
    typealias VoidCompletion = () -> ()
    typealias VoidExecute = () -> ()
    typealias Completion<Value> = (Value) -> ()

}

func when<Result>(_ condition: Bool, execute: () -> Result?) -> Result? {
    return condition ? execute() : nil
}

func cast<Value, Result>(_ value: Value) -> Result? {
    return value as? Result
}  
