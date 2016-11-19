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
        
        self.trecho = self.arrayTrechos[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Actions
    
    @IBAction func cadastrar(_ sender: UIButton) {
        //Swift 3 removeu o prefixo "NS" da classe NSFileManager
        
        if FileManager.default.fileExists(atPath: arquivo){
            self.arrayPassageiros  = (NSArray(contentsOfFile: arquivo) as! [[String: String]])
        
        }else {
            print("array vazio")
            
        }
        
        if let nomeTemp = self.nomeTextField.text, let telefoneTemp = self.telefoneTextField.text, let emailTemp = self.emailTextField.text{
            self.arrayPassageiros = self.arrayPassageiros + [["nome": nomeTemp, "telefone": telefoneTemp, "email": emailTemp, "trecho": self.trecho]]
            print(self.arrayPassageiros)
            (self.arrayPassageiros as NSArray).write(toFile: arquivo, atomically: true)
            self.nomeTextField.text = ""
            self.telefoneTextField.text = ""
            self.emailTextField.text = ""
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelarCadastro(_ sender: UIButton) {
    
    self.dismiss(animated: true, completion: nil)
    
    }
    
    //MARK: - Métodos de PickerView DataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrayTrechos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.arrayTrechos[row]
    }
    
    
    //MARK: - Métodos de PickerView Delegate
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.trecho = self.arrayTrechos[row]
    }
    
    //MARK: - Métodos de TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

    
    

}
