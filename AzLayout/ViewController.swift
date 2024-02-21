//
//  ViewController.swift
//  AzLayout
//
//  Created by Lala on 17.02.24.
//

//MVC
import UIKit
import Lottie

class ViewController: BaseViewController {
    
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
    
    @IBAction func addNewButtonTapped(_ sender: Any) {
        let index = self.viewModel.addNewItem(item: AyvaViewModel(image: UIImage(named: "manzara"), onFavButtonTapped: { isSelected in
            
        }))
        let indexPath = IndexPath(row: index, section: 0)
       
        //tableView.reloadData()
        
        tableView.insertRows(at: [indexPath], with: .fade)
        tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
    }
    
    
    deinit {
        // destroy olduktan sonra tetiklenir.
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemViewModel = self.viewModel.getViewModel(for: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (viewModel.itemCount - 1) {
            // apiden yeni 20 data çekmek gerek
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Sil"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.showAlert(title: "Silme Uyarısı",
                           message: "Silmek istediğinizden emin misniz?") { alertController in
               
                alertController.addAction(UIAlertAction(title: "Sil", style: .default, handler: { action in
                    
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
                        self.viewModel.deleteItem(index : indexPath.row)
                        tableView.deleteRows(at: [indexPath], with: .top)
                        //tableView.reloadData()
                    }
                    
                    /*DispatchQueue.global().async {
                        // thread yapıulmasıg gereken işlemler burda yapulır.
                        
                        DispatchQueue.main.async {
                            // Ana thread'e taşınması gereken işlemler burda yapılor.
                            self.tableView.reloadData()
                        }
                    }*/
                  
                }))
                
                alertController.addAction(UIAlertAction(title: "Vazgeç", style: .cancel, handler: { action in
                    
                }))
            }
           
        }
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "KATEGORİ HEADER SECTION \(section)"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "KATEGORİ FOOTER SECTION  \(section)"
    }
}
