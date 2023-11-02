//
//  EnterMobilePhoneNavigator.swift
//  CleanArchitectureRxSwift
//
//  Created Kien Trung Pham on 11/1/23.
//  Copyright © 2023 sergdort. All rights reserved.
//
//


//import Domain
import RxSwift
import RxCocoa
import UIKit

protocol EnterMobilePhoneNaviProtocol: AnyObject {

}

class EnterMobilePhoneNavigator: EnterMobilePhoneNaviProtocol {

    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }



}
