//
//  ViewController.swift
//  Cash_Register
//
//  Created by user235857 on 2/27/24.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var productTable: UITableView!
    
    var allProducts = [Product]()
    var allOrders = [Orders]()
    var selectedProductIndex = -1
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allProducts.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ProductTableViewCell
        
        cell?.productname.text = allProducts[indexPath.row].product_name
        
        cell?.quantity.text = String(allProducts[indexPath.row].quantity)
        cell?.price.text = String(allProducts[indexPath.row].price)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        type.text = allProducts[indexPath.row].product_name
        selectedProductIndex = indexPath.row
        if let goodNum =  quantity.text{
            if(goodNum != "")
            {
                total.text = String(computeTotal(quantity: Float(goodNum)!, price: allProducts[selectedProductIndex].price ))
            }
        }
        
    }
    
    func computeTotal(quantity : Float, price : Float) -> Float{
        return quantity * price
    }
    
    override func viewWillAppear(_ animated: Bool ){
        super.viewWillAppear(animated)
            
        allProducts = (UIApplication.shared.delegate as? AppDelegate)!.products
        selectedProductIndex = -1
        productTable.reloadData()
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let product1 = Product(pn:"Shoes",q:10,p:120);
        let product2 = Product(pn:"Pants",q:10,p:190);
        let product3 = Product(pn:"Hats",q:10,p:20);
        let product4 = Product(pn:"Tshirts",q:10,p:60);
        let product5 = Product(pn:"Dresses",q:10,p:220);
        allProducts.append(product1)
        allProducts.append(product2)
        allProducts.append(product3)
        allProducts.append(product4)
        allProducts.append(product5)
        
        appDelegate!.products = allProducts
        productTable.reloadData()
    }
    
    @IBAction func swithManagerView(_ sender: Any) {
  
    }
    
    
    @IBAction func updateQuantity(_ sender: UIButton) {
        
        if let goodNum =  sender.titleLabel!.text{
            quantity.text = "\(quantity.text!)\(goodNum)"
            if(selectedProductIndex != -1){
                total.text = String(computeTotal(quantity: Float(quantity.text!)!, price: allProducts[selectedProductIndex].price))
            }}
    }
    
    func clearInputs() {
        type.text = "Type"
        quantity.text = ""
        total.text = "Total"
    
        
    }
    
    
    @IBAction func buyProduct(_ sender: UIButton) {
        
        var alert = UIAlertController();
        if(selectedProductIndex == -1)
        {
            alert = UIAlertController(title: "Error", message: "No Product selected", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Okay", style: .destructive, handler: { action in
                self.clearInputs()
            }))
        }
        else if(quantity.text == "")
        {
             alert = UIAlertController(title: "Error", message: "No Quantity entered", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Okay", style: .destructive, handler: { action in
                self.clearInputs()
            }))
            
        }
        else if(Int(quantity.text!)! > allProducts[selectedProductIndex].quantity ||
                Int(quantity.text!)! < 1)
        {
             alert = UIAlertController(title: "Error", message: "Quantity out of range for product selected", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Okay", style: .destructive, handler: { action in
                self.clearInputs()
            }))
        }
        else{
            
            let product_name = allProducts[selectedProductIndex].product_name
            let quantity = Int(quantity.text!)!
            let total = Float(total.text!)!
            let timestamp = Date()
            var new_order = Orders(pname: product_name, qty: quantity, total: total, time: timestamp)
            allOrders.append(new_order)
            allProducts[selectedProductIndex].quantity -= quantity
            productTable.reloadData()
            alert = UIAlertController(title: "Order Successful", message: "Purchase completed!", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Okay", style: .destructive, handler: { action in
                self.clearInputs()
            }))
            appDelegate!.products = allProducts
             appDelegate!.orders = allOrders
            selectedProductIndex = -1
        }
        present(alert, animated: true)

        
    }
}

