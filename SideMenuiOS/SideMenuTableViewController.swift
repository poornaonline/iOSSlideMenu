//
//  SideMenuTableViewController.swift
//  SideMenuiOS
//
//  Created by Poorna Jayasinghe on 2020-10-27.
//

import UIKit

class SideMenuTableViewController: UITableViewController {
    
    var clickedItem: ((Int) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: { [weak self] in
            self?.clickedItem?(indexPath.row)
        })
    }

    @IBAction func dismissClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
