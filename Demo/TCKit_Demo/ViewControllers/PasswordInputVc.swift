//
//  PasswordInputVc.swift
//  TCKit_Demo
//
//  Created by Tech on 2017/8/23.
//  Copyright © 2017年 ctc. All rights reserved.
//

import UIKit

class PasswordInputVc: BaseVc {

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl("PasswordInputVc", color: UIColor.white)
        setLeftBtn("返回", image: "navi_arrow_right", action: #selector(popVc))
    }

    @IBAction func beginToInput(_ sender: UIButton) {
        let v = BMPasswordInputView.fromNib()
        v.frame = view.bounds
        view.addSubview(v)
        
    }
}
