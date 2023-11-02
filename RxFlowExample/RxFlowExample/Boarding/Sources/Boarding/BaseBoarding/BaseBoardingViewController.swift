//
//  BaseBoardingViewController.swift
//  
//
//  Created by Kien Trung Pham on 12/1/23.
//

import UIKit

open class BaseBoardingViewController<T: ViewModelType>: UIViewController {

    public let viewModel: T
    
    public init(viewModel: T) {
        self.viewModel = viewModel
        super.init()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()

    }
  

}
