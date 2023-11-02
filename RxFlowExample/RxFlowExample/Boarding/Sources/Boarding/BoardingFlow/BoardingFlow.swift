//
//  File.swift
//  
//
//  Created by Kien Trung Pham on 11/1/23.
//

import Foundation
import UIKit
import RxFlow

public final class BoardingFlow: Flow {
    
    private let boardingUseCase: BoardingUseCase
    
    init (boardingUseCase: BoardingUseCase) {
        self.boardingUseCase = boardingUseCase
    }
    
    public var root: Presentable {
        return rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let vc = UINavigationController()
        vc.setNavigationBarHidden(false, animated: false)
        return vc
    }()
    
    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? BoardingStep else { return .none }
        switch step {
        case .start: return startFlow()
        case .showEnterMobile: return startFlow()
        case .complete: return startFlow()
        }
        
    }
    
    private func startFlow() -> FlowContributors {
        
        let viewModel = WellComeViewModel()
        let wellComeVC = WellComeVC(viewModel: viewModel)
        rootViewController.pushViewController(wellComeVC, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: wellComeVC, withNextStepper: wellComeVC.viewModel) )
    }

    private func showEnterMobile() -> FlowContributors {
        let viewModel = WellComeViewModel()
        let wellComeVC = WellComeVC(viewModel: viewModel)
        rootViewController.pushViewController(wellComeVC, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: wellComeVC, withNextStepper: wellComeVC.viewModel) )
    }

    
}
