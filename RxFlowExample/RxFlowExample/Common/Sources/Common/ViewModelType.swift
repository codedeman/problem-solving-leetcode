//
//  File.swift
//  
//
//  Created by Kevin on 3/1/23.
//

import Foundation
public protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
}
