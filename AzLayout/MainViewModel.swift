//
//  MainViewModel.swift
//  AzLayout
//
//  Created by Sefa Aycicek on 20.02.2024.
//

import Foundation
import UIKit

// Reactive Programming RxSwift

class BaseViewModel {
    
}

class MainViewModel : BaseViewModel {
    private var viewModels = [CellViewModelProtocol]()
    
    override init() {
        viewModels.append(AyvaViewModel(image: UIImage(named: "manzara2"), onFavButtonTapped: { isSelected in
            // isselected bilgisini viewController'a nasıl gönderirsiniz?
        }))
        
        viewModels.append(PortakalViewModel(name: "Ali", surname: "Veli", age: 20))
     
    }
    
    func addNewItem(item : CellViewModelProtocol) -> Int {
        viewModels.append(item)
        return viewModels.count - 1
    }
    
    func deleteItem(index : Int) {
        viewModels.remove(at: index)
    }
    
    var itemCount : Int {
        return viewModels.count
    }
    
    func getViewModel(for index : Int) -> CellViewModelProtocol { //getViewModelForIndex
        return viewModels[index]
    }
    
}

class PortakalViewModel : BaseViewModel, CellViewModelProtocol {
    let name : String
    let surname : String
    let age : Int
    
    init(name: String, surname: String, age: Int) {
        self.name = name
        self.surname = surname
        self.age = age
    }
    
    
    func getCellIdentifier() -> String {
        return "portakal"
    }
    
}

class ElmaViewModel : BaseViewModel, CellViewModelProtocol {
    func getCellIdentifier() -> String {
        return "elma"
    }
}

class AyvaViewModel : BaseViewModel, CellViewModelProtocol {
    let image : UIImage?
    let onFavButtonTapped : (Bool)->()
    
    init(image: UIImage?, onFavButtonTapped: @escaping (Bool) -> Void) {
        self.image = image
        self.onFavButtonTapped = onFavButtonTapped
    }
    
    func getCellIdentifier() -> String {
        return "ayva"
    }
}

protocol TableViewCellProtocol {
    func fillData(viewModel : CellViewModelProtocol)
}

protocol CellViewModelProtocol {
    func getCellIdentifier() -> String
}
