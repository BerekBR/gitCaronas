//
//  ListaPassageirosViewController.swift
//  Caronas
//
//  Created by Alexandre Wajcman on 20/08/16.
//  Copyright © 2016 Alexandre Wajcman. All rights reserved.
//

import UIKit

class ListaPassageirosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //MARK: - Outlets
    @IBOutlet weak var listaPassageirosTableView: UITableView!
    
    //MARK: - Propriedades
    
    var arrayListaPassageiros = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.listaPassageirosTableView.dataSource = self
        self.listaPassageirosTableView.delegate = self
        
        
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
    
    //MARK: - Actions!
    
    
    //MARK: - Métodos de TableView DataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        return self.arrayListaPassageiros.count

    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Passageiros Cadastrados"
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("celula", forIndexPath: indexPath)
        
        // Configure the cell...
        
        cell.textLabel?.text = self.arrayListaPassageiros[indexPath.row]["nome"]
        print(cell.textLabel?.text)
       

        return cell
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
