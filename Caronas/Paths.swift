//
//  Paths.swift
//  Caronas
//
//  Created by Alexandre Wajcman on 20/08/16.
//  Copyright © 2016 Alexandre Wajcman. All rights reserved.
//

import UIKit

//Estrutura de paths
let home = NSHomeDirectory()
let documents = (home as NSString).appendingPathComponent("Documents")
let arquivo = (documents as NSString).appendingPathComponent("cadastro.plist")
let tarifaArquivo = (documents as NSString).appendingPathComponent("tarifa.plist")


public var  dictListaCarona = [Int: String]()

public var tarifaFixa = ""


//Criação da data atual no formato português do Brasil
struct  DataAtual {
    let data = Date()
    let formatadorData = DateFormatter()
    let hoje: String!
    
    init(){
    
    self.formatadorData.dateStyle = DateFormatter.Style.long
    self.formatadorData.locale = Locale(identifier: "pt_BR")
    self.hoje = formatadorData.string(from: data)
    }

}
