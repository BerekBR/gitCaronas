//
//  Paths.swift
//  Caronas
//
//  Created by Alexandre Wajcman on 20/08/16.
//  Copyright © 2016 Alexandre Wajcman. All rights reserved.
//

import UIKit


let home = NSHomeDirectory()
let documents = (home as NSString).stringByAppendingPathComponent("Documents")
let arquivo = (documents as NSString).stringByAppendingPathComponent("cadastro.plist")


struct  DataAtual {
    let data = NSDate()
    let formatadorData = NSDateFormatter()
    let hoje: String!
    
    init(){
    
    self.formatadorData.dateStyle = NSDateFormatterStyle.LongStyle
    self.formatadorData.locale = NSLocale(localeIdentifier: "pt_BR")
    self.hoje = formatadorData.stringFromDate(data)
    }

}
