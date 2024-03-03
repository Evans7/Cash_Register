//
//  ManagerViewController.swift
//  Cash_Register
//
//  Created by user235857 on 2/29/24.
//

import UIKit

class ManagerViewController: UIViewController,UITableViewDataSource , UITableViewDelegate{
    
        
    @IBOutlet weak var orderTable: UITableView!
    
    var orders = (UIApplication.shared.delegate as? AppDelegate)!.orders

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        performSegue(withIdentifier: "orderHistory", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "orderHistory" {
                
                if let indexPath = sender as? IndexPath {
                    let OHC = segue.destination as? OrderHistoryViewController
                    OHC?.data = indexPath.row
                }
                
            }
        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ordercell")
        
        cell?.textLabel?.text = orders[indexPath.row].product_name
        
        cell?.detailTextLabel?.text = String(orders[indexPath.row].quantity)
        
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        orderTable.reloadData()
        // Do any additional setup after loading the view.
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
