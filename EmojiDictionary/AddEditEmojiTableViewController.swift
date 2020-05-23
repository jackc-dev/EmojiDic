//
//  AddEditEmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Jack on 9/Aug/19.
//  Copyright © 2019 Jack. All rights reserved.
//

import UIKit

class AddEditEmojiTableViewController: UITableViewController {

    var emoji: Emoji?
    
    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load selected emoji's details
        if let emoji = emoji {
            symbolTextField.text = emoji.symbol
            nameTextField.text = emoji.name
            descriptionTextField.text = emoji.description
            usageTextField.text = emoji.usage
        }
        
        updateSaveButtonState()
    }

    func updateSaveButtonState() {
        let symbolText = symbolTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        let usage = usageTextField.text ?? ""
        
        saveButton.isEnabled = !symbolText.isEmpty && !name.isEmpty && !description.isEmpty && !usage.isEmpty
    }
    
    @IBAction func textEditingChanged(_ sender:UITextField) {
        updateSaveButtonState()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveUnwind" else { return }
        
        let symbolText = symbolTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        let usage = usageTextField.text ?? ""
        
        emoji = Emoji(symbol: symbolText, name: name, description: description, usage: usage)
    }
}
