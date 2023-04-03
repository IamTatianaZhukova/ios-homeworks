//
//  ProfilePost.swift
//  Navigation
//
//  Created by Татьяна Жукова on 25.03.2023.
//

import UIKit

struct ProfilePost {
    let author: String
    let description: String
    let image: String
    var likes: Int
    var views: Int
}
    
var postProfile = [ProfilePost(author: "triptoworld", description: "See Paris and... fall in love", image: "Photo4", likes: 2546, views: 5167),
    ProfilePost(author: "triptoworld", description: "We're in Paris. Hello Disneyland", image: "Photo1", likes: 3145, views: 6365),
    ProfilePost(author: "triptoworld", description: "London is the capital of Great Britain", image: "Photo5", likes: 4961, views: 6370),
    ProfilePost(author: "triptoworld", description: "Moscow never sleep...", image: "Photo2", likes: 5346, views: 8432),
    ProfilePost(author: "triptoworld", description: "Thailand is the land of smiles", image: "Photo3", likes: 7103, views: 9328)]
