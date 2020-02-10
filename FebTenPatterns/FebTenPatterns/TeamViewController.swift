//
//  TeamViewController.swift
//  FebTenPatterns
//
//  Created by thusitha on 2/10/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

protocol SelectTeamDelegate {
    func didSelectTeam(image: UIImage, name: String, color: UIColor)
}

class TeamViewController: UIViewController {
    
    var selectTeamDelegate: SelectTeamDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionPolice(_ sender: UIButton) {
        selectTeamDelegate.didSelectTeam(image: UIImage(imageLiteralResourceName: "Car"), name: "Police", color: .orange)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func actionDevil(_ sender: Any) {
        selectTeamDelegate.didSelectTeam(image: #imageLiteral(resourceName: "Devil"), name: "Devil Team", color: #colorLiteral(red: 1, green: 0.4078431373, blue: 0.05098039216, alpha: 1))
        dismiss(animated: true, completion: nil)
    }
    
}


