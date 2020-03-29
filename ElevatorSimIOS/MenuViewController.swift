//
//  ViewController.swift
//  ElevatorSimIOS
//
//  Created by Ryan Schoenlein on 3/17/20.
//  Copyright © 2020 Ryan Schoenlein. All rights reserved.
//

//TODO make this adaptive
import UIKit

class MenuViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet weak var simulateButton: UIButton!
    @IBOutlet weak var numElevators: UITextField!
    var delegate: SimulationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //disable button
        self.numElevators.delegate = self
        self.simulateButton.isUserInteractionEnabled = false
        self.simulateButton.alpha = 0.5
    }
    
    //MARK: Actions
    
    //go to simulation view
    @IBAction func simulateButtonPressed(_ sender: Any) {
        let simView: SimulationViewController = SimulationViewController()
        delegate?.setNumElevators(num: numElevators.text!)
        
        self.present(simView, animated: true, completion: nil)
    }
    
    //responds to any input in a text field
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //only enable button if textfield is not empty
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if !text.isEmpty{
            simulateButton.isUserInteractionEnabled = true
            simulateButton.alpha = 1.0
        } else {
            simulateButton.isUserInteractionEnabled = false
            simulateButton.alpha = 0.5
        }
        
        //only allow integers in texfield (from stackoverflow)
        
        // Create an `NSCharacterSet` set which includes everything *but* the digits
        let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
        
        // At every character in this "inverseSet" contained in the string,
        // split the string up into components which exclude the characters
        // in this inverse set
        let components = string.components(separatedBy: inverseSet)
        
        // Rejoin these components
        let filtered = components.joined(separator: "")  // use join("", components) if you are using Swift 1.2
        
        // If the original string is equal to the filtered string, i.e. if no
        // inverse characters were present to be eliminated, the input is valid
        // and the statement returns true; else it returns false
        return string == filtered
    }
}
