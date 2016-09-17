//
//  Paths.swift
//  Caronas
//
//  Created by Alexandre Wajcman on 20/08/16.
//  Copyright © 2016 Alexandre Wajcman. All rights reserved.
//

import UIKit


let home = NSHomeDirectory()
let documents = (home as NSString).appendingPathComponent("Documents")
let arquivo = (documents as NSString).appendingPathComponent("cadastro.plist")


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
