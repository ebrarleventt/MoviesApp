//
//  ViewController.swift
//  FilmlerApp
//
//  Created by Ebrar Levent on 26.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var kategoriTableview: UITableView!
    
    var kategoriListesi = [Kategoriler]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        veritabaniKopyala()
        
        kategoriTableview.delegate = self
        kategoriTableview.dataSource = self
        
        
        kategoriListesi = KategorilerDao().tumKategorilerAl( )
        

    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let index = sender as? Int
        let gidilecekVC = segue.destination as! FilmViewController
        gidilecekVC.kategori = kategoriListesi[index!]
        
    }
    
    
    
    func veritabaniKopyala(){
        
        //Veritabaninin bundle uzerindeki yeri:
        let bundleYolu = Bundle.main.path(forResource: "filmler", ofType: ".sqlite")
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        //Kopyalama islemi icin nesne:
        let fileManager = FileManager.default
        
        //Kopyalama yapilacak yer:
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler.sqlite")
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabani zayen var. Kopyalamaya gerek yok.")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{
                print(error)
            }
        }
        
}
}


extension ViewController:UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kategoriListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let kategori = kategoriListesi[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "kategoriCell", for: indexPath) as! KategoriCellTableViewCell
        
        cell.labelKategoriAd.text = kategori.kategori_ad
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toFilm", sender: indexPath.row)
}
    
    
    
}
