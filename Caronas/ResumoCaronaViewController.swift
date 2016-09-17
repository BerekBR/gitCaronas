//
//  ResumoCaronaViewController.swift
//  Caronas
//
//  Created by Alexandre Wajcman on 31/08/16.
//  Copyright © 2016 Alexandre Wajcman. All rights reserved.
//

import UIKit

class ResumoCaronaViewController: UIViewController {
    //Outlets
    
    @IBOutlet weak var resumoTextView: UITextView!
   
   //Properties
    var dictResumoCarona = [Int: String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resumoTextView.text = "O percurso da carona foi de 12 km e o valor a ser pago por cada passageiro é\n"

        for i in self.dictResumoCarona {
        
        self.resumoTextView.text = self.resumoTextView.text + "\(i.1) Valor R$ 4,00\n"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
