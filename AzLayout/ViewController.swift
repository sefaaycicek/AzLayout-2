//
//  ViewController.swift
//  AzLayout
//
//  Created by Lala on 17.02.24.
//

//MVC
import UIKit
import Lottie

class ViewController: UIViewController {
    
    @IBOutlet var tableView : UITableView!
    
    let viewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customCell = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(customCell, forCellReuseIdentifier: "ayva")
        
    
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    deinit {
        // destroy olduktan sonra tetiklenir.
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemViewModel = self.viewModel.getViewModel(for: indexPath.row)
        let cellIdentifier = itemViewModel.getCellIdentifier()
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? TableViewCellProtocol else {
            return UITableViewCell()
        }
        
        cell.fillData(viewModel: itemViewModel)
        return cell as! UITableViewCell
    }
    
    /*func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "portakal") as? PortakaTableViewCell {
                cell.fillCell(txt1: "\(indexPath.section)",
                               txt2: "\(indexPath.row)",
                               txt3: " Section \(indexPath.section) Row \(indexPath.row)")
                return cell
            }
            
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "elma") as? SecondCell {
                cell.fillCell(txt1: "Section \(indexPath.section) Row \(indexPath.row)")
                return cell
            }
        }
       
        return UITableViewCell()
    }*/
}
