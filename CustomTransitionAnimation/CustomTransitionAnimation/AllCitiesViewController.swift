//
//  ViewController.swift
//  CustomTransitionAnimation
//
//  Created by Ethan Furstoss on 11/18/18.
//  Copyright © 2018 Ethan Furstoss. All rights reserved.
//

import UIKit

class AllCitiesViewController: UIViewController {
    
    let cells = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow, UIColor.gray]
    
    var expander: ExpandedCellViewController!
    var chosenCellFrame: CGRect!
    var selectedIndex: IndexPath!

    @IBOutlet weak var allCitiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension AllCitiesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = cells[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath
        if expander == nil{
            expander = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExpandedCellViewController") as? ExpandedCellViewController
            expander.delegate = self
        }
        self.addChild(expander)
        expander.view.frame = allCitiesTableView.rectForRow(at: indexPath)
        expander.view.center = CGPoint(x: expander.view.center.x, y: expander.view.center.y - allCitiesTableView.contentOffset.y)
        
        chosenCellFrame = expander.view.frame
        expander.view.backgroundColor = cells[indexPath.row]
        self.view.addSubview(expander.view)
        UIView.animate(withDuration: 0.3, animations: {
            self.expander.view.frame = self.allCitiesTableView.frame
            self.expander.collapseButton.alpha = 1
        }) { (done) in
            self.expander.didMove(toParent: self)
        }
    }
    
    func expandedCellWillCollapse(){
        self.expander.willMove(toParent: nil)
        UIView.animate(withDuration: 0.3, animations: {
            self.expander.view.frame = self.chosenCellFrame
            self.expander.collapseButton.alpha = 0
        }) { (done) in
            self.expander.view.removeFromSuperview()
            self.expander.removeFromParent()
            self.allCitiesTableView.reloadRows(at: [self.selectedIndex], with: .none)
        }
    }
    
}
