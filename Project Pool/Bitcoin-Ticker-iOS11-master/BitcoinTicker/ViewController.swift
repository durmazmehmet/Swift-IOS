//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Angela Yu on 23/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["TRY","AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    let currencySymbolArray = ["₺", "$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R"]
    var finalURL = ""

    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        finalURL = baseURL + "TRY"
        getCurrencyData(url: finalURL, symbol: "₺")
    }

    
    //TODO: Place your 3 UIPickerView delegate methods here
    
    // class da picker ile ilgili inheritleri yaptıktan sonra bize protokolun nerde kardeş çekecek
    // aşağıdaki 3 tanımlamayı yapınca şikayetler bitecek
    
    // 1. pickerde kaç sütun istediğimizi belirtiş
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // 2. pickerde kaç satır istediğimizi belirtiş
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    // 3. pickeri dolduruş
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    
    // pickeri kullanınca nolacak onu yapalım
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //print("\(row) \(currencyArray[row])")
        finalURL = baseURL + currencyArray[row]
        print(finalURL)
        getCurrencyData(url: finalURL, symbol: currencySymbolArray[row])
    }
//    
//    //MARK: - Networking
//    /***************************************************************/
//    
    func getCurrencyData(url: String, symbol: String) {
        bitcoinPriceLabel.text = "Bağlantı Kuruluyor"
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {

                    print("Sucess! Got the currency value")
                    let currencyJSON : JSON = JSON(response.result.value!)

                    self.getCurrencyValue(json: currencyJSON, symbol: symbol)

                } else {
                    print("Error: \(String(describing: response.result.error))")
                    self.bitcoinPriceLabel.text = "Connection Issues"
                }
            }
    }
  
//    //MARK: - JSON Parsing
//    /***************************************************************/
//    
    func getCurrencyValue(json : JSON, symbol: String) {
        
        if let tempResult = json["ask"].double {
            bitcoinPriceLabel.text = "\(symbol) \(tempResult)"
        } else {
            bitcoinPriceLabel.text = "Değer Bulunamadı"
        }
    
    }
}

