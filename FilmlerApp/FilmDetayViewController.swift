//
//  FilmDetayViewController.swift
//  FilmlerApp
//
//  Created by Ebrar Levent on 26.01.2024.
//

import UIKit

class FilmDetayViewController: UIViewController {
    
    
    @IBOutlet weak var imageViewFilmResim: UIImageView!
    @IBOutlet weak var labelFilmAdi: UILabel!
    @IBOutlet weak var labelFilmYil: UILabel!
    @IBOutlet weak var labelKategoriAdi: UILabel!
    @IBOutlet weak var labelFilmYonetmen: UILabel!
    
    var film:Filmler?

    override func viewDidLoad() {
        super.viewDidLoad()


        if let f = film{
            
            imageViewFilmResim.image = UIImage(named: f.film_resimAd!)
            labelFilmAdi.text = f.film_ad
            labelFilmYil.text = String(f.film_yil!)
            labelKategoriAdi.text = f.kategori?.kategori_ad
            labelFilmYonetmen.text = f.yonetmen?.yonetmen_ad
            
        }
        

    }
    


    

}
