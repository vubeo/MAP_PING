//
//  ViewController.swift
//  MAP_PING
//
//  Created by Đỗ Hoàng Vũ on 7/4/18.
//  Copyright © 2018 Đỗ Hoàng Vũ. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    

    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var CollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        self.mapView.camera = camera
       mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        
    }
    func addMarket(coordinate: CLLocationCoordinate2D){
        let marker = GMSMarker()
        marker.position = coordinate
        marker.map = self.mapView
    }

    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        self.mapView.clear()
        self.addMarket(coordinate: coordinate)
    }
    @IBAction func autocompleteClicked(_ sender: UIButton) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self as! GMSAutocompleteViewControllerDelegate
        present(autocompleteController, animated: true, completion: nil)
    }
    // collectionVIew
    var arratImage: Array = [#imageLiteral(resourceName: "car"),#imageLiteral(resourceName: "cafe"),#imageLiteral(resourceName: "house"),#imageLiteral(resourceName: "hopital"),#imageLiteral(resourceName: "store"),#imageLiteral(resourceName: "store2"),#imageLiteral(resourceName: "postbox")]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arratImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath as IndexPath) as! MAP_CollectionViewCell
        cell.image_icon.image = self.arratImage[indexPath.item]
        cell.backgroundColor = UIColor.cyan
        return cell
    }
}

