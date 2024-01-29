//
//  FilmlerDao.swift
//  FilmlerApp
//
//  Created by Ebrar Levent on 29.01.2024.
//

import Foundation


class FilmlerDao{
    
    //Veritabani ile iletisime gecme kodlari:
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath:hedefYol).appendingPathComponent("filmler.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    
    
    
    func filmlerAl(kategori_id:Int) -> [Filmler] {
        
        var liste = [Filmler]()
        
        db?.open()
        
        do{
            
            let rs = try db!.executeQuery("SELECT * FROM kategoriler, yonetmenler, filmler WHERE filmler.kategori_id = kategoriler.kategori_id AND filmler.yonetmen_id = yonetmenler.yonetmen_id AND filmler.kategori_id = ?", values: [kategori_id])
             
            while rs.next(){
                
                let kategori = Kategoriler(
                    kategori_id: Int(rs.string(forColumn: "kategori_id"))!,
                    kategori_ad: rs.string(forColumn: "kategori_ad"))
                
                let yonetmen = Yonetmenler(
                     yonetmen_id: Int(rs.string(forColumn: "yonetmen_id"))!,
                    yonetmen_ad: rs.string(forColumn: "yonetmen_ad")!)
                
                let film = Filmler(
                    film_id: Int(rs.string(forColumn: "film_id"))!,
                    film_ad: rs.string(forColumn: "film_ad")!,
                    film_yil: Int(rs.string(forColumn: "film_yil"))!,
                    film_resimAd: rs.string(forColumn: "film_resim")!,
                    kategori: kategori,
                    yonetmen: yonetmen)
                
                liste.append(film)
            }
            
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        
        return liste
    }
    
    
    
    
    
}
