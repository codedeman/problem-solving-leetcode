//
//  File.swift
//  
//
//  Created by Kien Trung Pham on 11/1/23.
//

import Foundation
import RxSwift
public protocol BoadingRepository: AnyObject {
    
    func send<T: Codable>(
        urlRequest: URLRequest
    ) -> Observable<T>
    
}
