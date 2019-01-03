//
//  SequenceGenerator.swift
//  Animation
//
//  Created by Anna Yatsun on 02/01/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class SequenceGenerator<T> {
    
    private let values: [T]
    private let atomicIndex = Atomic(0)
     
    init(_ values: [T]) {
        self.values = values
    }
    
    convenience init(_ values: T...) {
        self.init(values)
    }
    
    public func next() -> T {
        self.atomicIndex.modify {
            let newIndex = $0 + 1
            if newIndex < values.count {
                $0 = newIndex
            } else {
                $0 = 0
            }
            
        }
        
        
        return self.values[self.atomicIndex.value]
        
//        let index: Int = atomicIndex.modify { index in 
//            defer { index = (index + 1) % self.values.count }
//            
//            return  index
//        }
//        
//        return self.values[index]
    }
}
