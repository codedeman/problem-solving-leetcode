//
//  ViewModelType.swift
//  
//
//  Created by Kien Trung Pham on 11/1/23.
//

import UIKit

public protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
}
