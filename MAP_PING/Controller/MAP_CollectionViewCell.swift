//
//  MAP_CollectionViewCell.swift
//  MAP_PING
//
//  Created by Đỗ Hoàng Vũ on 7/4/18.
//  Copyright © 2018 Đỗ Hoàng Vũ. All rights reserved.
//

import UIKit

class MAP_CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image_icon: UIImageView!
    @IBOutlet weak var label_icon: UILabel!
    func displaycontent(image: UIImage , title : String) {
        image_icon.image = image
        label_icon.text = title
    }
}
