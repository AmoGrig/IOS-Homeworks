//
//  File.swift
//  Navigation
//
//  Created by ARAM on 17.06.2022.
//

import Foundation
import UIKit

struct Post1 {
    let author: String
    let description: String
    let image: String
    let likes: String
    let views: String
    }

struct Photos {
    var image: String
    
    static func setupImages() -> [Photos] {
        let images = ["Pic1", "Pic2", "Pic3", "Pic4", "Pic5", "Pic6","Pic7", "Pic8", "Pic9", "Pic10", "Pic11", "Pic12", "Pic13", "Pic14", "Pic15", "Pic16", "Pic17", "Pic18", "Pic19", "Pic20"]
        var currentImage = [Photos]()
        for (_, number) in images.enumerated() {
            currentImage.append(Photos(image: number))
        }
        return currentImage
    }
}
