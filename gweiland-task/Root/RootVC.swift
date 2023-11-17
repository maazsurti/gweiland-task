//
//  RootVC.swift
//  gweiland-task
//
//  Created by Maaz on 16/11/23.
//
import UIKit
import Stevia
import Foundation

class RootVC: BaseViewController {
    
    let v = RootView()
    
    override func loadView() { view = v }
    
    let api = API()
    
    override func configure() {
        super.configure()
        
        v.isHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        Task{
            Loading.start()
            await getCryptoData()
            Loading.stop()
            await getMetadata(for: v.currencyTV.currencyData)
        }
    }
    
    func getCryptoData() async {
        
        do {
            
            let data = try await api.getCryptocurrencies()
            let filteredData = data.filter { $0.id != 1 }
            v.currencyTV.currencyData = filteredData
            let btcData = data.first(where: {$0.id ?? 0 == 1})
            v.banner.configure(with: btcData)
            v.isHidden = false
            
        } catch {
            
            printError(with: error)
        }
    }
    
    func getMetadata(for data: [Cryptocurrency]) async {
        
        do {
            
            let logoURLs = try await api.getLogos(for: v.currencyTV.currencyData)
            let sortedLogos: [String] = v.currencyTV.currencyData.compactMap { crypto in
                guard let id = crypto.id,
                    let logoDict = logoURLs.first(where: { $0.keys.contains(String(id)) }),
                    let logo = logoDict[String(id)] else {
                        return nil
                }
                return logo
            }
            v.currencyTV.logoURLs = sortedLogos
            
        } catch {
            
            printError(with: error)
        }
    }
}
