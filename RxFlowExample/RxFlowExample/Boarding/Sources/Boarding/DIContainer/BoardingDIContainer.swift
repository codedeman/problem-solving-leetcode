//
//  BoardingDIContainer.swift
//  
//
//  Created by Kien Trung Pham on 11/1/23.
//

import UIKit
import RxFlow
public final class BoardingDIContainer {
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    private func makeBoardingUseCase() -> BoardingUseCase {
        return DBBoardingUseCase.init(boardingRepository: dependencies.repo)
    }
}

public extension BoardingDIContainer {
    
    struct Dependencies {
        let repo: BoadingRepository
        let managerFlow: (UINavigationController) -> Flow
        
        init(repo: BoadingRepository,
             managerFlow: @escaping (UINavigationController) -> Flow) {
            self.repo = repo
            self.managerFlow = managerFlow
        }
       
    }
}

extension BoardingDIContainer {

    func makeWellComePage() -> WellComeVC {
        let viewModel = WellComeViewModel.init(boardingUserCase: makeBoardingUseCase())
        let vc = WellComeVC.init(viewModel: viewModel)
        return vc
    }
    
}





