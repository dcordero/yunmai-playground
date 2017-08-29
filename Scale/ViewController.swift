//
//  ViewController.swift
//  Scale
//
//  Created by David Cordero on 29.08.17.
//  Copyright © 2017 David Cordero. All rights reserved.
//

import UIKit
import CoreBluetooth
import QuartzCore

//private let DeviceInfoService = "180A"
private let HeartRateService = "D618"

private let MeasurementCharacteristic = "2A37"
private let BodyLocationCharacteristic = "2A38"
private let NameCharacteristic = "2A29"

class ViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    private var cbCentralManager: CBCentralManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let services: [CBUUID] = [CBUUID(string: HeartRateService)]
        cbCentralManager = CBCentralManager(delegate: self, queue: nil)
        cbCentralManager?.scanForPeripherals(withServices: services, options: nil)
    }
    
    // MARK: CBCentralManagerDelegate
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        
        print("didConnect")
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        print("didDiscoverPeripheral")
        
        let localName = advertisementData[CBAdvertisementDataLocalNameKey]
        print(advertisementData)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
        if central.state == .poweredOff {
            print("CoreBluetooth BLE hardware is powered off")
        }
        else if central.state == .poweredOn {
            print("CoreBluetooth BLE hardware is powered on and ready")
        }
        else if central.state == .unauthorized {
            print("CoreBluetooth BLE state is unauthorized")
        }
        else if central.state == .unknown {
            print("CoreBluetooth BLE state is unknown")
        }
        else if central.state == .unsupported {
            print("CoreBluetooth BLE hardware is unsupported on this platform")
        }
        
        let services: [CBUUID] = [CBUUID(string: HeartRateService)]
        cbCentralManager?.scanForPeripherals(withServices: services, options: nil)

    }
    

    // MARK: CBPeripheralDelegate

    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        
        print("didDiscoverServices")
    }

    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        
        print("didDiscoverCharacteristicsFor")
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor descriptor: CBDescriptor, error: Error?) {
        
        print("didUpdateValueFor")
    }
}

