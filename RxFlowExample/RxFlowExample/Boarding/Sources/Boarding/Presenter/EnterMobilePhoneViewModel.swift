//
//  EnterMobilePhoneViewModel.swift
//  CleanArchitectureRxSwift
//
//  Created Kien Trung Pham on 11/1/23.
//  Copyright © 2023 sergdort. All rights reserved.
//
//


//import Domain
import RxFlow
import RxCocoa

class EnterMobilePhoneViewModel: Stepper {
    var steps: PublishRelay<RxFlow.Step>
    
    init(steps: PublishRelay<RxFlow.Step>) {
        self.steps = steps
    }
}

extension EnterMobilePhoneViewModel: ViewModelType {

    func transform(input: Input) -> Output {

        return Output.init()
    }
    struct Input {

    }

    struct Output {

    }
}

