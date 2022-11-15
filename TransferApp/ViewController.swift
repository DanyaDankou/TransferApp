//
//  ViewController.swift
//  TransferApp
//
//  Created by comp on 14.11.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    @IBAction func editDataWithProperty(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        editScreen.updatingData = dataLabel.text ?? ""
        self.navigationController?.pushViewController(editScreen, animated: true)
    }
    var updateData: String = "Test data"
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabel(withText : updateData)
    }
    private func updateLabel (withText text: String) {
        dataLabel.text = updateData
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toEditScreen":
            prepareEditScreen(segue)
        default:
            break
        }
    }
    private func prepareEditScreen(_ segue: UIStoryboardSegue) {
        guard let destinationController = segue.destination as? SecondViewController else {
            return
        }
        destinationController.updatingData = dataLabel.text ?? ""
    }
    @IBAction func unwindToFirstScreen(_ segue: UIStoryboardSegue) {
        
    }


}

