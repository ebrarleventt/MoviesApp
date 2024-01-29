//
//  FilmCellCollectionViewCell.swift
//  FilmlerApp
//
//  Created by Ebrar Levent on 26.01.2024.
//

import UIKit


//Sepete ekle butonu icin:
protocol FilmCellCollectionViewCellProtocol{
    func sepeteEkle(indexPath:IndexPath )
}


class FilmCellCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageViewFilmResim: UIImageView!
    @IBOutlet weak var labelFilmAdi: UILabel!
    @IBOutlet weak var labelFilmFiyat: UILabel!
    
    var cellProtocol:FilmCellCollectionViewCellProtocol?
    var indexPathDisari:IndexPath?
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        
        cellProtocol?.sepeteEkle(indexPath: indexPathDisari!)
        
    }
    
    
}
