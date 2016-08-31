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
    
   
    
    //MARK: - Properties
    
    let gps = CLLocationManager()
    var arrayResumoCarona = [String]()
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.arrayResumoCarona)
        self.dataLabel.text = DataAtual().hoje
        
        //Ajustando o GPS
        self.gps.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedAlways && CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse {
        
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
    
    @IBAction func finalizarCarona(sender: UIButton) {
        
    self.gps.stopUpdatingLocation()
    self.dismissViewControllerAnimated(true, completion: nil)
    
    
    }
   
    //MARK: - Métodos de LocationManager Delegate
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
       
        
        let regiao = MKCoordinateRegion(center: (locations.last?.coordinate)!, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
        
        self.caronaMapView.setRegion(regiao, animated: true)
        
    
    }
    
   
}
