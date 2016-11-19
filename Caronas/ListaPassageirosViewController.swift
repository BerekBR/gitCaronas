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
    var dictEstaoNaCarona = [Int:String]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Definindo o Delegate e DataSource
        self.listaPassageirosTableView.dataSource = self
        self.listaPassageirosTableView.delegate = self
        
        //Registrando a célula personalizada
        
        let nib = UINib(nibName:"PassageiroTableViewCell", bundle: nil)
        self.listaPassageirosTableView.register(nib, forCellReuseIdentifier: "celula")
        
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        DispatchQueue.main.async {
            self.listaPassageirosTableView.reloadData()
        }
        if FileManager.default.fileExists(atPath: arquivo){
            self.arrayListaPassageiros = (NSArray(contentsOfFile: arquivo) as! [[String: String]])
            
            }
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Actions
    
    
    //MARK: - Métodos de TableView DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        return self.arrayListaPassageiros.count

    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Passageiros a bordo"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath) as! PassageiroTableViewCell
        
        // Configure the cell...
        
        cell.nomeLabel.text = self.arrayListaPassageiros[indexPath.row]["nome"]
        
        cell.delegate = self
        
        

        return cell
        
    }
    //MARK: - Actions
    
    @IBAction func iniciarCarona(_ sender: UIButton) {
        self.performSegue(withIdentifier: "mapaSegue", sender: nil)
        
    }
    
    
    @IBAction func retornar (_ segue: UIStoryboardSegue){
        
        
        print("Disparou segue unwind")
        
    }

    
    //MARK: - Métodos de TableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: implementar açao ao clicar célula
    }

    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: UITableViewRowActionStyle.destructive, title: "Delete") { (delete, indexPath) in
            
            self.arrayListaPassageiros.remove(at: indexPath.row)
            (self.arrayListaPassageiros as NSArray).write(toFile: arquivo, atomically: true)
            DispatchQueue.main.async {
                self.listaPassageirosTableView.reloadData()
        }
        
            print("deletar nome")
        }
        return [delete]
   
    }
    

    //MARK: - Métodos de PassaeiroTableViewCellDelegate
    func passageiroTableViewCellSwitch(_ cell: PassageiroTableViewCell) {
        
        let index = self.listaPassageirosTableView.indexPath(for: cell)?.row
            
        
        if cell.vaiDeCaronaSwitch.isOn {
            dictListaCarona[index!] = cell.nomeLabel.text!
            print(dictListaCarona)
            print(index!)
        }else {
            
            if !dictListaCarona.isEmpty {
                dictListaCarona.removeValue(forKey: index!)
               print(dictListaCarona)
                print(index!)
            }
        }
        
        
        
    }
   /* //Segue programática para "passar" array de passageiros
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mapaSegue" {
        
        let instanciaTelaMapa = segue.destination as! CaronaViewController
            instanciaTelaMapa.dictCarona = dictListaCarona
        }
    } */
    
}
