//
//  Product.swift
//  Cash_Register
//
//  Created by user235857 on 2/27/24.
//

import Foundation

class Product{
    var product_name: String
    var quantity: Int
    var price: Float
      
    init(pn: String,q: Int,p: Float){
        self.product_name = pn;
        self.quantity = q;
        self.price = p;
        }
    
}
