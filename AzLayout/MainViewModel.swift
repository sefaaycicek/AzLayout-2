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
        viewModels.append(AyvaViewModel(image: UIImage(named: "manzara2")))
        viewModels.append(PortakalViewModel(name: "Ali", surname: "Veli", age: 20))
        viewModels.append(AyvaViewModel(image: UIImage(named: "manzara")))
        viewModels.append(AyvaViewModel(image: UIImage(named: "manzara2")))
        viewModels.append(AyvaViewModel(image: UIImage(named: "manzara")))
     
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
    init(image: UIImage?) {
        self.image = image
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
