//
//  WellComeVC.swift
//  
//
//  Created by Kien Trung Pham on 11/1/23.
//

import UIKit
import SnapKit

class WellComeVC: BaseBoardingViewController<WellComeViewModel> {

    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Hello User"
        return lbl
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.top.equalTo(self).offset(20)
        }

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
