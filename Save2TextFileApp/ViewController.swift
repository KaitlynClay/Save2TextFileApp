//
//  ViewController.swift
//  Save2TextFileApp
//
//  Created by student on 3/15/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func writeMyTextBtn(_ sender: Any) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            try typeTextHere.text.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Error writing to file")
        }
    }
    
    @IBAction func readMyTextBtn(_ sender: Any) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            displayTextHere.text = fileContent
        } catch {
            print("Error reading from file")
        }
    }
    
    @IBOutlet weak var typeTextHere: UITextView!
    
    @IBOutlet weak var displayTextHere: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeTextHere.text = "Type your new text here."
        displayTextHere.text = ""
        
        // Do any additional setup after loading the view.
    }


}

