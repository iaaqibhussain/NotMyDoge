//
//  DogeModel.swift
//  NotMyDoge
//
//  Created by Aaqib Hussain on 30/8/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit
import ObjectMapper

class DogeModel: Model {

    //MARK: - Vars
    
    //Returns URL from the string url
    var dogeImageURL: URL? {
        return URL(string: imageURL ?? "")
    }
    
    //Returns the name of breed from the URL
    var breedName: String {
       return splitDogeBreedFromImageURL(urlString: imageURL ?? "")
    }
    
    //Returns true if status is "success"
    var success: Bool? {
        return status == "success" ? true : false
    }
    
    private var status : String?
    private var imageURL : String?
   
    //MARK: - Init
    
    required init?(map: ModelMap) {
        imageURL <- map["message"]
        status <- map["status"]
    }

    //MARK: Functions
    
    func mapping(map: ModelMap) {

    }
    
    /**
    Splits the URL by '/' and gets the index of the string breeds from the array and since its certain that the breed name is right after the breeds string in the array so adding 1 into the breeds string index to get the name of the breed.
    **/
    
    private func splitDogeBreedFromImageURL(urlString: String) -> String {
        let splitedArray = urlString.split(separator: "/")
        guard let breedIndex =  splitedArray.index(of: "breeds"), breedIndex + 1 <= splitedArray.count  else { return "NA"}
        let breedNameIndex = breedIndex + 1
        let breedName = String(splitedArray[breedNameIndex]).capitalized
        return breedName
    }
}
