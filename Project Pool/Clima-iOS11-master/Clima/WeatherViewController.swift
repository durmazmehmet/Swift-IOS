//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON


class WeatherViewController: UIViewController , CLLocationManagerDelegate, ChangeCityDelegate {
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "5613e36d3cdbce1dedba5f9913986e27"

    @IBOutlet weak var birimDurumu: UISwitch!
    @IBOutlet weak var birimDurumuLabel: UILabel!
    
    //TODO: Declare instance variables here
    let locationYoneticisi = CLLocationManager()
    let weatherDataModel = WeatherDataModel()

    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        birimDurumu.isEnabled = false
        //TODO:Set up the location manager here.
        // delegasyon ile let locationManager = CLLocationManager() lokasyonu bulduğunda alttaki kodu arar bulunca oraya bilgi verir
        // bilgiyi aldığında ise  func locationManager bilgiyi değerlendiririz
        locationYoneticisi.delegate = self
        // class kısmında delegate yapmassak CLLOCATİON classında oluşan gps verisini alacak adam olmaz ozaman burada sıkıntı çıkar. buradan satır içi düzeltmek kaos üzerine kaos yaratır. classda delegasyon yapacağız
        locationYoneticisi.desiredAccuracy = kCLLocationAccuracyHundredMeters //best seçmiyoruz çünü 100 metrede bir hava değşmez bataryayı düşün
        locationYoneticisi.requestWhenInUseAuthorization() //tanıdık geldi mi? uygulama çaışırken gps gelsin
        locationYoneticisi.startUpdatingLocation() //asynch metod arkaplanda çalışır lokasyonu almaya çalışı işi bitince //didupdatelocation ile alırız
    }
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    
    func getWeatherData(url: String, parameters: [String : String]) {
        //response handlin yapacaz (alamo + swiftyjson) async olduğu için böye (yani arkaplanda coşuyor)
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess {
                print("Bağlantı Çalışıyor")
                let weatherJSON : JSON = JSON(response.result.value!)
                //DATA ANY? Optional olarak varsayıyor. ancak biz gerantiledik ki data gelecek ve json olarak gelecek
                // ozaman xcode'a dedik data keisnlikle nil (FORCE UNWRAP) değil ve JSON formatında
                //print(weatherJSON) //jsoneditoronline ile gözleyebilirsin
                self.updateWeatherData(json: weatherJSON)
                //self ekledik çünkü func içinde func olduğundan (in kelimesinden anlarsak) self ile dışa açılım (alamodan bizim koda geçişi sağladık)
            } else {
                //print("Bağlantı Hatası \(String(describing: response.result.error))")
                self.cityLabel.text = "Bağlantı Hatası"
            }
        }
    }

    //MARK: - JSON Parsing
    /***************************************************************/
    
    //Write the updateWeatherData method here:
    
    func updateWeatherData(json : JSON) {
        birimDurumu.isEnabled = true
        if let tempResult = json["main"]["temp"].double { //api key hatalı olsa göçecektik optional binding asla unutma
            if birimDurumu.isOn {
                weatherDataModel.temperature = Int(tempResult - 273.15)
            } else {
                 weatherDataModel.temperature = Int(tempResult * (9/5) - 459.67)
            }
            weatherDataModel.city = json["name"].stringValue
            weatherDataModel.condition = json["weather"][0]["id"].intValue
            weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
            updateUIWithWeatherData() 
        } else {
            cityLabel.text = "sıkıntı"
        }
    }
    
    
    //MARK: - UI Updates
    /***************************************************************/

    //Write the updateUIWithWeatherData method here:
    
    func updateUIWithWeatherData() {
        cityLabel.text = weatherDataModel.city
        temperatureLabel.text = "\(weatherDataModel.temperature)°"
        weatherIcon.image = UIImage(named: weatherDataModel.weatherIconName)
    }
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    //Write the didUpdateLocations method here: locationManager.startUpdatingLocation() ile dürtülür
    //cllocation bir dizey. lokasyon kesin verisini alana kadar dolarda dolar. en son indisi en iyi veridir teorik olarak
    //alttaki fonksiyon hazır classtan gelme şaşırma
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count-1]
        if location.horizontalAccuracy > 0 {
            locationYoneticisi.stopUpdatingLocation() // geçerli lokasyonu yakayınca coşmasın dursun
            locationYoneticisi.delegate = nil //durdurma işlemini yaparkeb kapat datayı
            print("boylam = \(location.coordinate.longitude), enlem = \(location.coordinate.latitude)")
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            //dictionary ve site böyle istiyor
            let params : [String : String] = ["lat" : latitude, "lon" : longitude, "appid" : APP_ID]
            
            getWeatherData(url: WEATHER_URL, parameters: params)
        }
    }
    
    //Write the didFailWithError method here:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Lokasyon bulunamadı"
    }
    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    //Write the userEnteredANewCityName Delegate method here:
    func kullaniciGirisi(sehir : String) {
        let params : [String : String] = ["q" : sehir, "appid" : APP_ID]
        getWeatherData(url: WEATHER_URL, parameters: params)
    }
    //Write the PrepareForSegue Method here
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segue identifierini buraya da düzgün yazmadığımdan burayı geçememiştim
        // hatta bocalayım ayni identifier ikinci VC'ye verdim sessiz ama onmaz bir çakışma oluştur. Xcode bana bunu söyleyemedi
        // tarif videosu olmasaydı sıçmıştım
        if segue.identifier == "changeCityName" {
            let destinationVC = segue.destination as! ChangeCityViewController
            destinationVC.delegasyon = self
        }
    }
   
    @IBAction func birimDegistir(_ sender: UISwitch) {
        if sender.isOn {
            weatherDataModel.temperature = Int((Double(weatherDataModel.temperature) - 32) / 1.8)
            birimDurumuLabel.text = "Santigrat"
        } else {
            weatherDataModel.temperature = Int(Double(weatherDataModel.temperature) * 1.8 + 32)
            birimDurumuLabel.text = "Fahrenayt"
        }
        updateUIWithWeatherData()
    }
}


