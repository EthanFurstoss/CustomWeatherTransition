//
//  ExpandedCellViewController.swift
//  CustomTransitionAnimation
//
//  Created by Ethan Furstoss on 11/18/18.
//  Copyright © 2018 Ethan Furstoss. All rights reserved.
//

import UIKit

class ExpandedCellViewController: UIViewController {
    
    weak var delegate: AllCitiesViewController?

    @IBAction func pressedCloseButton(_ sender: UIButton) {
        delegate?.expandedCellWillCollapse()
    }
    @IBOutlet weak var collapseButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
