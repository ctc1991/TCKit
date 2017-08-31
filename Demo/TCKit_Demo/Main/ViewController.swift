//
//  ViewController.swift
//  TCKit_Demo
//
//  Created by Tech on 2017/8/23.
//  Copyright © 2017年 ctc. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarColor(UIColor(hex: 0x4A9EFF))
        titleLbl("TCKit", color: UIColor.white)
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var text = String()
        switch indexPath.row {
        case 0:
            text = "TwoSizes"
        case 1:
            text = "PasswordInputVc"
        default:
            break
        }
        cell.textLabel?.text = text
        return cell
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        var vc: UIViewController?
        switch indexPath.row {
        case 0:
            vc = TwoSizesVc(sb: "ViewControllers", vc: "TwoSizesVc")
        case 1:
            vc = PasswordInputVc(sb: "ViewControllers", vc: "PasswordInputVc")
        default:
            break
        }
        push(vc)
    }
    
}

