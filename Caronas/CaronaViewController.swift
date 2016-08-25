//
//  CaronaViewController.swift
//  Caronas
//
//  Created by Alexandre Wajcman on 20/08/16.
//  Copyright © 2016 Alexandre Wajcman. All rights reserved.
//

import UIKit
import MapKit

class CaronaViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    //MARK: - Outlets
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBOutlet weak var caronaMapView: MKMapView!
    
    @IBOutlet weak var passageirosPickerView: UIPickerView!
   
    
    //MARK: - Properties
    var arrayCaroneiros = [[String: String]]()
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       //Ajustando a data atual
        let data = NSDate()
        let formatadorData = NSDateFormatter()
        formatadorData.dateStyle = NSDateFormatterStyle.LongStyle
        formatadorData.locale = NSLocale(localeIdentifier: "pt_BR")

         print(formatadorData.stringFromDate(data))
        self.dataLabel.text = formatadorData.stringFromDate(data)
        
        //Ajustando PickerView
        self.passageirosPickerView.dataSource = self
        self.passageirosPickerView.delegate = self
        
        
    }
    override func viewDidAppear(animated: Bool) {
        
        dispatch_async(dispatch_get_main_queue()) {
            self.passageirosPickerView.reloadComponent(0)
        }
        
        if NSFileManager.defaultManager().fileExistsAtPath(arquivo){
            self.arrayCaroneiros = (NSArray(contentsOfFile: arquivo) as! [[String: String]])
            if self.arrayCaroneiros.isEmpty {
                let semCaroneiros = UIAlertController(title: "Alerta", message: "Não há passageiros cadastrados", preferredStyle: .Alert)
                let acaoOK = UIAlertAction(title: "OK", style: .Default, handler: { (acaoOK) in
                    print("Nao há passageiros cadastrados")
                })
                
                semCaroneiros.addAction(acaoOK)
                self.presentViewController(semCaroneiros, animated: true, completion: nil)
                
            }else {
                print(self.arrayCaroneiros)
            }
        }else {
            let semCaroneiros = UIAlertController(title: "Alerta", message: "Não há passageiros cadastrados", preferredStyle: .Alert)
            let acaoOK = UIAlertAction(title: "OK", style: .Default, handler: { (acaoOK) in
                print("Nao há passageiros cadastrados")
            })
            
            semCaroneiros.addAction(acaoOK)
            self.presentViewController(semCaroneiros, animated: true, completion: nil)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: - Actions
    
    @IBAction func adicionarPassageiro(sender: UIButton) {
    
    
    
    
    
    }
    
    //MARK: - Métodos de PickerView DataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrayCaroneiros.count
    }
    
    
    //MARK: - Métodos de PickerView Delegate
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.arrayCaroneiros[row]["nome"]
    }

   
}
