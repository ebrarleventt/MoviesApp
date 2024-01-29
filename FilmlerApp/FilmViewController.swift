//
//  FilmViewController.swift
//  FilmlerApp
//
//  Created by Ebrar Levent on 26.01.2024.
//

import UIKit

class FilmViewController: UIViewController {
    
    
    @IBOutlet weak var filmCollectionView: UICollectionView!
    
    
    var filmlerlistesi = [Filmler]()
    var kategori:Kategoriler?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let k = kategori{
            navigationItem.title = k.kategori_ad
            filmlerlistesi = FilmlerDao().filmlerAl(kategori_id: k.kategori_id!)
        }
        
        
        filmCollectionView.delegate = self
        filmCollectionView.dataSource = self
        
        
        //TASARIM
        let tasarim:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        //Tum Genislik:
        let genislik = self.filmCollectionView.frame.size.width
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        //Hucrenin genisligi
        let cellGenislik = (genislik-30)/2

        tasarim.itemSize = CGSize(width: cellGenislik, height: cellGenislik*1.81)
        
        //Yatayda aradaki bosluk:
        tasarim.minimumInteritemSpacing = 10
        
        //Asagida aradaki bosluk
        tasarim.minimumLineSpacing = 10
        
        filmCollectionView.collectionViewLayout = tasarim
        
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let index = sender as? Int
        let gidilecekVC = segue.destination as! FilmDetayViewController
        gidilecekVC.film = filmlerlistesi[index!]
        
    }


}


extension FilmViewController:UICollectionViewDelegate, UICollectionViewDataSource, FilmCellCollectionViewCellProtocol {
    
    
    func sepeteEkle(indexPath: IndexPath) {
        print("Sepete eklenen film: \(filmlerlistesi[indexPath.row].film_ad!)" )
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerlistesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let film = filmlerlistesi[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmCell", for: indexPath) as! FilmCellCollectionViewCell
        
        cell.imageViewFilmResim.image = UIImage(named: film.film_resimAd!)
        cell.labelFilmAdi.text = film.film_ad
        cell.labelFilmFiyat.text = "200 TL"
        
        //Cell e sınır cizmek icin:
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        //Sepete ekle yi aktif etmek icin:
        cell.cellProtocol = self
        cell.indexPathDisari = indexPath
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "toDetay", sender: indexPath.row    )
        
    }
    
    
}
