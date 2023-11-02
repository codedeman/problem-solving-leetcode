//
//  EnterMobilePhoneViewController.swift
//  CleanArchitectureRxSwift
//
//  Created Kien Trung Pham on 11/1/23.
//  Copyright © 2023 sergdort. All rights reserved.
//
//

import UIKit
import SnapKit

class EnterMobilePhoneViewController: BaseBoardingViewController<EnterMobilePhoneViewModel>  {
    

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        initViewModel()
    }
    
    private func initViewModel () {

    }
    // MARK: Fetch EnterMobilePhone
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        
    }
    
    // MARK: IBAction
}



