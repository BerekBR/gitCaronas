//
//  CaronaViewController.swift
//  Caronas
//
//  Created by Alexandre Wajcman on 20/08/16.
//  Copyright © 2016 Alexandre Wajcman. All rights reserved.
//

import UIKit
import MapKit



class CaronaViewController: UIViewController, CLLocationManagerDelegate {

    
    //MARK: - Outlets
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBOutlet weak var caronaMapView: MKMapView!
    
    @IBOutlet weak var velocidadeLabel: UILabel!
   
    @IBOutlet weak var localLabel: UILabel!
    
    //MARK: - Properties
    
    let gps = CLLocationManager()
    var dictCarona = [Int: String]()
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.dataLabel.text = DataAtual().hoje
        
        //Ajustando o GPS
        self.gps.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedAlways && CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedWhenInUse {
        
            gps.requestWhenInUseAuthorization()
        
        } else {
            
          
            self.caronaMapView.showsUserLocation = true
            self.gps.delegate = self
            self.gps.startUpdatingLocation()
        
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: - Actions
    
    @IBAction func finalizarCarona(_ sender: UIButton) {
        
    self.gps.stopUpdatingLocation()
    self.performSegue(withIdentifier: "resumoSegue", sender: self.dictCarona)
    
    }
   
    //MARK: - Métodos de LocationManager Delegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
       
        
        let regiao = MKCoordinateRegion(center: (locations.last?.coordinate)!, span: MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007))
        
        self.caronaMapView.setRegion(regiao, animated: true)
        let velocidade = Int((locations.last!.speed) * 3.6)
        self.velocidadeLabel.text = "\(velocidade)"
        CLGeocoder().reverseGeocodeLocation(locations.last!) { (placeMark, error) in
        self.localLabel.text = placeMark?.last?.name
            
        }
        
        
    
    }
    //Segue programática
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resumoSegue"{
        
            let instanciaTelaResumo = segue.destination as! ResumoCaronaViewController
            instanciaTelaResumo.dictResumoCarona = self.dictCarona
            
            
        
        }
    }
   
}
