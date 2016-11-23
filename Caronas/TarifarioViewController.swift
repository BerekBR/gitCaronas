//
//  TarifarioViewController.swift
//  Caronas
//
//  Created by Alexandre Wajcman on 03/10/16.
//  Copyright © 2016 Alexandre Wajcman. All rights reserved.
//

import UIKit

class TarifarioViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    //MARK: - Outlets
    
    @IBOutlet weak var tarifaPickerView: UIPickerView!
    
    @IBOutlet weak var tarifaLabel: UILabel!

    
    //MARK: - Properties
    var arrayValor:[String] = []
    var valor = ""
    var pickerViewValue:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tarifaPickerView.dataSource = self
        self.tarifaPickerView.delegate = self
        
        //Construção do array com preços
        for r in 1...10 {
            
            for c in 0...9{
                self.valor = "\(r).\(c)0"
                self.arrayValor.append(valor)
                
            }
            
        }
        
        //verificação que inicia o Pickerview com o último index selecionado
        
        if FileManager.default.fileExists(atPath: tarifaArquivo){
        
            let tarifaArray = (NSArray(contentsOfFile: tarifaArquivo) as! Array<String>)
            
            tarifaFixa = (tarifaArray.last)!
            self.tarifaLabel.text = "R$ " + tarifaFixa
        }else {
            self.tarifaLabel.text = "R$ 0.00" 
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Actions
    
    @IBAction func definirTarifa(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Métodos de PickerView DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return self.arrayValor.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.arrayValor[row]
    
    }
    //MARK: - Métodos de PickerView Delegate
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tarifaFixa = self.arrayValor[row]
        self.pickerViewValue.append(tarifaFixa) //Rever implementaçao da tupla do pickerviewValue
       
    // Persistencia do preço selecionado
        (self.pickerViewValue as NSArray).write(toFile: tarifaArquivo, atomically: true)
        self.tarifaLabel.text = "R$ " + tarifaFixa
        print(self.pickerViewValue.last)
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
