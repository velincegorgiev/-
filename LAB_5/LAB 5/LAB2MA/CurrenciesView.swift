//
//  DataView.swift
//  LAB2MA
//
//  Created by David Atanasoski on 16.9.23.
//

import Foundation

import UIKit

class CurrenciesView: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
                
                _ = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(refreshData), userInfo: nil, repeats: true)

    }
    
    
    @IBOutlet weak var btcPrice: UILabel!
    @IBOutlet weak var ethPrice: UILabel!
    @IBOutlet weak var usPrice: UILabel!
    
    @IBOutlet weak var lastUpdated: UILabel!
    
    let urlString = "https://api.coingecko.com/api/v3/exchange_rates"
    
    @objc func refreshData() -> Void
        {
            fetchData()
        }
    
    
    func fetchData()
    {
        let url = URL(string: urlString)
        let defaultSession = URLSession(configuration: .default)
        let dataTask = defaultSession.dataTask(with: url!) {
            (data: Data?, response: URLResponse?,error: Error?) in
            
            if(error != nil)
            {
                print(error!)
                return
            }
            
            do
            {
                let json = try JSONDecoder().decode(Rates.self, from: data!)
                self.setPrices(currency: json.rates)
            }
            catch
            {
                print(error)
                return
            }
            
            
        }
        dataTask.resume()
    }
    
    func setPrices(currency: Currency)
        {
            DispatchQueue.main.async
            {
                self.btcPrice.text = self.formatPrice(currency.btc)
                self.ethPrice.text = self.formatPrice(currency.eth)
                self.usPrice.text = self.formatPrice(currency.usd)
                self.lastUpdated.text = self.formatDate(date: Date())
            }
        }
    
    
    func formatPrice(_ price: Price) -> String
        {
            return String(format: "%@ %.6f", price.unit, price.value)
        }
    
    func formatDate(date: Date) -> String
        {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd MMM y HH:mm:ss"
            return formatter.string(from: date)
        }

        struct Rates: Codable
        {
            let rates: Currency
        }
        
        struct Currency: Codable
        {
            let btc: Price
            let eth: Price
            let usd: Price
        }
        
        struct Price: Codable
        {
            let name: String
            let unit: String
            let value: Float
            let type: String
        }
}
