//
//  RestockViewController.swift
//  Cash_Register
//
//  Created by user235857 on 3/3/24.
//

import UIKit

class RestockViewController: UIViewController, UITableViewDataSource , UITableViewDelegate{
    
    var products = (UIApplication.shared.delegate as? AppDelegate)!.products
    var selectedProductIndex = -1
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = products[indexPath.row].product_name
        
        cell?.detailTextLabel?.text = String(products[indexPath.row].quantity)
        return cell!
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func restockProduct(_ sender: Any) {
        if let enteredQuantity =  restockQuantity.text{
            var alert = UIAlertController();
            if(enteredQuantity == ""){
                alert = UIAlertController(title: "Error", message: "No Quantity Entered", preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "Okay", style: .destructive, handler: { action in
                    self.clearInputs()
                }))
                
            }
            else if(!isInteger(enteredQuantity)){
                alert = UIAlertController(title: "Error", message: "Entered Quantity not in correct format", preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "Okay", style: .destructive, handler: { action in
                    self.clearInputs()
                }))
                
            }
            else if(Int(enteredQuantity)!<0 || Int(enteredQuantity)!>1000){
                alert = UIAlertController(title: "Error", message: "Entered Quantity not in desired range", preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "Okay", style: .destructive, handler: { action in
                    self.clearInputs()
                }))
                
            }
            else if(selectedProductIndex<0){
                alert = UIAlertController(title: "Error", message: "No Product selected to Restock", preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "Okay", style: .destructive, handler: { action in
                    self.clearInputs()
                }))
            }
            else{
                let new_quantity = restockQuantity.text
                products[selectedProductIndex].quantity = Int(new_quantity!)!
                appDelegate!.products = products
                restockProductTable.reloadData()
                alert = UIAlertController(title: "Success", message: "Quantity updated", preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "Okay", style: .destructive, handler: { action in
                    self.clearInputs()
                }))
                
            }
            present(alert, animated: true)

        }
        
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        selectedProductIndex = indexPath.row
    }
    @IBOutlet weak var restockProductTable: UITableView!
    func clearInputs(){
        restockQuantity.text = ""
    }
    
    func isInteger(_ str: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^\\d+$")
        let matches = regex.matches(in: str, range: NSRange(str.startIndex..., in: str))
        return !matches.isEmpty
    }
    func containsOnlyNumbers(_ input: String) -> Bool {
            // Regular expression pattern to match only integers or doubles
            let numberRegex = "^[0-9]+(\\.[0-9]+)?$"
            
            // Create a regular expression object
            guard let regex = try? NSRegularExpression(pattern: numberRegex) else {
                return false // Failed to create regex
            }
            
            // Match the input against the regular expression
            let range = NSRange(location: 0, length: input.utf16.count)
            return regex.firstMatch(in: input, options: [], range: range) != nil
        }
    
    @IBAction func cancelRestock(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var restockQuantity: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
