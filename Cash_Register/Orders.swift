//
//  Orders.swift
//  Cash_Register
//
//  Created by user235857 on 2/29/24.
//

import Foundation
class Orders{
    var product_name: String
    var quantity: Int
    var time: Date
    var total: Float
    
    init(pname: String,qty: Int,total: Float,time: Date){
        self.product_name = pname;
        self.quantity = qty;
        self.total = total;
        self.time = time;
        }
    
}
