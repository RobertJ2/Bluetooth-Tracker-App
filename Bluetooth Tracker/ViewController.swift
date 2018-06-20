//
//  ViewController.swift
//  Bluetooth Tracker
//
//  Created by Robert Jackson Jr on 6/19/18.
//  Copyright © 2018 Robert Jackson Jr. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CBCentralManagerDelegate {

    
    @IBOutlet var tableView: UITableView!
    var centralManager: CBCentralManager?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
    }

    
    @IBAction func refreshTapped(_ sender: Any) {
        
        
    }
    
    //CBCentralManager Code
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if let name = peripheral.name {
        print("Peripheral Name: \(name)")
        }
        print("Peripheral UUID: \(peripheral.identifier.uuidString)")
        print("Peripheral RSSI: \(RSSI)")
        print("Ad Data: \(advertisementData)")
        print("***************")
    }
    
    
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            //Working
            central.scanForPeripherals(withServices: nil, options: nil)
        } else {
            //Not working
            let alertVC = UIAlertController(title: "Bluetooth isn't working", message: "Make sure your bluetooth is on and ready to pair", preferredStyle: .alert)
           let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                alertVC.dismiss(animated: true, completion: nil)
            }
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
        }
    }
    
    //TableView Code
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "blueCell", for: indexPath) as? BlueTableViewCell {
            cell.nameLabel.text = "This is a test"
            cell.rssiLabel.text = "RSSI: -28"
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}

