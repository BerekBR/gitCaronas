//
//  Paths.swift
//  Caronas
//
//  Created by Alexandre Wajcman on 20/08/16.
//  Copyright © 2016 Alexandre Wajcman. All rights reserved.
//

import Foundation


let home = NSHomeDirectory()
let documents = (home as NSString).stringByAppendingPathComponent("Documents")
let arquivo = (documents as NSString).stringByAppendingPathComponent("cadastro.plist")
