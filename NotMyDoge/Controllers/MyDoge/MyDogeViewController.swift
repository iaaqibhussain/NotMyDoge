//
//  MyDogeViewController.swift
//  NotMyDoge
//
//  Created by Aaqib Hussain on 30/8/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit
import Toast_Swift
import Kingfisher

class MyDogeViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var dogeImageImageView: UIImageView!
    @IBOutlet weak var dogeBreedLabel: UILabel!
    @IBOutlet weak var notMyDogeButton: UIButton!
    
    //MARK: - Var
    
    let viewModel = MyDogeViewModel()
    
    //MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModelCallbacks()
        viewModel.thatsNotMyDoge()
    }
    
    //MARK: - Private Functions
    
    //View and ViewModel Binding
    private func setupViewModelCallbacks() {
        
        //Shows or hides loader and enable/disables the button
        viewModel.loader = { [weak self] state in
            
            self?.notMyDogeButton.isEnabled = !state
            if state {
                self?.view.makeToastActivity(.center)
            } else {
                self?.view.hideToastActivity()
            }
        }
        
        //loads the data
        viewModel.showData = { [weak self] dogeModel in
  
            self?.setDataToUI(dogeModel: dogeModel)
        }
        
        //Shows any error message
        viewModel.showMessage = { [weak self] message in

            self?.view.makeToast(message, duration: 1, position: .center)
        }
        
    }
    
    //Sets the data to UI
    private func setDataToUI(dogeModel: DogeModel) {
        dogeBreedLabel.text = "Doge"
        guard let dogeImageURL = dogeModel.dogeImageURL else {
            dogeImageImageView.image = #imageLiteral(resourceName: "doge")
            return
        }
        
        self.dogeImageImageView.kf.setImage(with: dogeImageURL, placeholder: #imageLiteral(resourceName: "doge"), completionHandler: { [weak self] (_, _, _, _) in
            
            self?.viewModel.loader(false)
            self?.dogeBreedLabel.text = dogeModel.breedName
        })
        
    }
    
    //MARK: - Action
    
    @IBAction func thatsNotMyDoge(_ sender: UIButton) {
        viewModel.thatsNotMyDoge()
    }
    
    @IBAction func logoutAction(_ sender: UIBarButtonItem) {
        viewModel.logout()
        tabBarController?.dismiss(animated: true)
    }
}
