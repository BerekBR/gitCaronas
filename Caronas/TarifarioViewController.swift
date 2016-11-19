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

    
    //MARK: - Properties
    var arrayValor:[String] = []
    var valor = ""
    var indexPickerView:[Int] = []
    
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
            //print(self.arrayValor)
        }
        
        //verificação que inicia o Pickerview com o último index selecionado
        
        if FileManager.default.fileExists(atPath: tarifaArquivo){
        
            let index = (NSArray(contentsOfFile: tarifaArquivo) as! Array<Int>)
            print(index[0])
            
            self.tarifaPickerView.selectRow(index[0], inComponent: 0, animated: true)
            let linha = self.tarifaPickerView.selectedRow(inComponent: 0)
            tarifaFixa = self.arrayValor[linha]
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
        self.indexPickerView.append(row)
        // Persistencia do preço selecionado 
        (self.indexPickerView as NSArray).write(toFile: tarifaArquivo, atomically: true)
        print(self.indexPickerView)
        
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
