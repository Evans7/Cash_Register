//
//  OrderHistoryViewController.swift
//  Cash_Register
//
//  Created by user235857 on 3/3/24.
//

import UIKit

class OrderHistoryViewController: UIViewController{
   
    
    var data: Int?
    var orders = (UIApplication.shared.delegate as? AppDelegate)!.orders

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var product: UILabel!
    @IBOutlet weak var orderHistoryTable: UITableView!
    override func viewDidLoad() {
        

        super.viewDidLoad()
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MM/dd/yyyy HH:mm:ss a"
        if let recievedIndex = data {
            product.text = orders[recievedIndex].product_name
            navigationItem.title = product.text
            quantity.text = String(orders[recievedIndex].quantity)
            time.text = (dateformatter.string(from: orders[recievedIndex].time))
            price.text = String(orders[recievedIndex].total)
            }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
