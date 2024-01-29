//
//  Filmler.swift
//  FilmlerApp
//
//  Created by Ebrar Levent on 27.01.2024.
//

import Foundation



class Filmler{
    
    var film_id:Int?
    var film_ad:String?
    var film_yil:Int?
    var film_resimAd:String?
    var kategori:Kategoriler?
    var yonetmen:Yonetmenler?
    
    init(){
        
    }
    
    
    init(film_id:Int, film_ad:String, film_yil:Int, film_resimAd:String, kategori:Kategoriler, yonetmen:Yonetmenler){
        
        self.film_id = film_id
        self.film_ad = film_ad
        self.film_yil = film_yil
        self.film_resimAd = film_resimAd
        self.kategori = kategori
        self.yonetmen = yonetmen
        
        
    }
    
    
    
    
}
