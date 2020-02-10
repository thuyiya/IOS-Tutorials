//
//  ChooseViewController.swift
//  FebTenPatterns
//
//  Created by thusitha on 2/10/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

protocol SideSelectionDelegate {
    func didTapChoice(image: UIImage, name: String, color: UIColor)
}

class ChooseViewController: UIViewController {
    
    var selectionDelegate: SideSelectionDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressOrange(_ sender: Any) {
        selectionDelegate.didTapChoice(image: UIImage(imageLiteralResourceName: "Car"), name: "Police", color: .orange)
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    @IBAction func pressBlue(_ sender: Any) {
        selectionDelegate.didTapChoice(image: UIImage(imageLiteralResourceName: "Devil"), name: "Devil", color: #colorLiteral(red: 0.2102418664, green: 0.5155714897, blue: 1, alpha: 1))
        dismiss(animated: true, completion: nil)
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
