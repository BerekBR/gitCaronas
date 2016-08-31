//
//  ListaPassageirosViewController.swift
//  Caronas
//
//  Created by Alexandre Wajcman on 20/08/16.
//  Copyright © 2016 Alexandre Wajcman. All rights reserved.
//

import UIKit

class ListaPassageirosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PassageiroTableViewCellDelegate {

    //MARK: - Outlets
    @IBOutlet weak var listaPassageirosTableView: UITableView!
    
    //MARK: - Properties
    
    var arrayListaPassageiros = [[String: String]]()
    var arrayEstaoNaCarona = [String]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Definindo o Delegate e DataSource
        self.listaPassageirosTableView.dataSource = self
        self.listaPassageirosTableView.delegate = self
        
        //Registrando a célula personalizada
        
        let nib = UINib(nibName:"PassageiroTableViewCell", bundle: nil)
        self.listaPassageirosTableView.registerNib(nib, forCellReuseIdentifier: "celula")
        
        
    }
    override func viewDidAppear(animated: Bool) {
        
        dispatch_async(dispatch_get_main_queue()) {
            self.listaPassageirosTableView.reloadData()
        }
        if NSFileManager.defaultManager().fileExistsAtPath(arquivo){
            self.arrayListaPassageiros = (NSArray(contentsOfFile: arquivo) as! [[String: String]])
            
            }
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Actions
    
    
    //MARK: - Métodos de TableView DataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        return self.arrayListaPassageiros.count

    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Passageiros a bordo"
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("celula", forIndexPath: indexPath) as! PassageiroTableViewCell
        
        // Configure the cell...
        
        cell.nomeLabel.text = self.arrayListaPassageiros[indexPath.row]["nome"]
        
        cell.delegate = self

        return cell
        
    }
    //MARK: - Actions
    
    @IBAction func iniciarCarona(sender: UIButton) {
        self.performSegueWithIdentifier("mapaCarona", sender: self.arrayEstaoNaCarona)
    
    }
    
    
    //MARK: - Métodos de TableView Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .Destructive, title: "Delete") { (delete, indexPath) in
           
            self.arrayListaPassageiros.removeAtIndex(indexPath.row)
            (self.arrayListaPassageiros as NSArray).writeToFile(arquivo, atomically: true)
            dispatch_async(dispatch_get_main_queue()) {
                self.listaPassageirosTableView.reloadData()
            }
            
            print("deletar nome")
        }
        return [delete]
   
    }
    //MARK: - Métodos de PassaeiroTableViewCellDelegate
    func passageiroTableViewCellSwitch(cell: PassageiroTableViewCell) {
        if cell.vaiDeCaronaSwitch.on {
            self.arrayEstaoNaCarona  += [cell.nomeLabel.text!]
            
        }
    }
    //Segue programática
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mapaCarona" {
        
        let instanciaTelaMapa = segue.destinationViewController as! CaronaViewController
        instanciaTelaMapa.arrayResumoCarona = self.arrayEstaoNaCarona
        }
    }
    
}
