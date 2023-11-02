//
//  WellComeViewModel.swift
//  
//
//  Created by Kien Trung Pham on 11/1/23.
//

import Foundation
import RxFlow
import RxCocoa

class WellComeViewModel: ViewModelType ,Stepper {

    let  boardingUserCase: BoardingUseCase
    init(boardingUserCase: BoardingUseCase) {
        self.boardingUserCase = boardingUserCase
    }

    var steps = PublishRelay<Step>()

    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(input: Input) -> Output {
        return Output.init()
    }

}

