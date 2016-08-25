//
//  CadastroViewController.swift
//  Caronas
//
//  Created by Alexandre Wajcman on 20/08/16.
//  Copyright © 2016 Alexandre Wajcman. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    
    //MARK: - Outlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var telefoneTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var trechoPickerView: UIPickerView!
    
    //MARK: - Properties
    
    
    var arrayPassageiros: [[String: String]] = []
    
    var trecho: String!
    
    var arrayTrechos = ["POA - Eldorado do Sul", "POA - Guaíba", "POA - Esteio", "POA - Canoas"]

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.trechoPickerView.delegate = self
        self.trechoPickerView.dataSource = self
        
        self.nomeTextField.delegate = self
        self.telefoneTextField.delegate = self
        self.emailTextField.delegate = self
        
        
        print(home)
        self.trecho = self.arrayTrechos[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Actions
    
    @IBAction func cadastrar(sender: UIButton) {
    
        if NSFileManager.defaultManager().fileExistsAtPath(arquivo){
            self.arrayPassageiros  = (NSArray(contentsOfFile: arquivo) as! [[String: String]])
        
        }else {
            print("array vazio")
            
        }
        
        if let nomeTemp = self.nomeTextField.text, telefoneTemp = self.telefoneTextField.text, emailTemp = self.emailTextField.text{
            self.arrayPassageiros += [["nome": nomeTemp, "telefone": telefoneTemp, "email": emailTemp, "trecho": self.trecho]]
            print(self.arrayPassageiros)
            (self.arrayPassageiros as NSArray).writeToFile(arquivo, atomically: true)
            self.nomeTextField.text = ""
            self.telefoneTextField.text = ""
            self.emailTextField.text = ""
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func cancelarCadastro(sender: UIButton) {
    
    self.dismissViewControllerAnimated(true, completion: nil)
    
    }
    
    //MARK: - Métodos de PickerView DataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrayTrechos.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.arrayTrechos[row]
    }
    
    
    //MARK: - Métodos de PickerView Delegate
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.trecho = self.arrayTrechos[row]
    }
    
    //MARK: - Métodos de TextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

    
    

}
