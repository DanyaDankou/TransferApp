//
//  SecondViewController.swift
//  TransferApp
//
//  Created by comp on 14.11.22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    var updatingData: String = ""
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTextFieldData(withText: updatingData)
    }
    private func updateTextFieldData(withText text: String) {
        dataTextField.text = text
    }
    
    @IBAction func saveDataWithProperty(_ sender: UIButton) {
        self.navigationController?.viewControllers.forEach { viewController in
            (viewController as? ViewController)?.updateData = dataTextField.text ?? ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toFirstScreen":
            prepareFirstScreen(_segue: segue)
        default:
            break
        }
    }
    private func prepareFirstScreen(_segue:UIStoryboardSegue) {
        guard let destinationController = _segue.destination as? ViewController
        else {
            return
        }
        destinationController.updateData = dataTextField.text ?? ""
    }
}
