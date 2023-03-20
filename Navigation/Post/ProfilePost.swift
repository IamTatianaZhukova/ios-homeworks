
import Foundation
import UIKit

struct ProfilePost {
    let author: String
    let description: String
    let image: UIImage
    var likes: Int
    var views: Int

    func postShow() -> [ProfilePost] {
        var post = [ProfilePost]()
        post.append(ProfilePost(author: "", description: "", image: UIImage(named: "openstore")!, likes: 0, views: 0))
        post.append(ProfilePost(author: "triptoworld", description: "See Paris and... fall in love", image: UIImage(named:"Photo4")!, likes: 2546, views: 5167))
        post.append(ProfilePost(author: "triptoworld", description: "We're in Paris. Hello Disneyland", image: UIImage(named: "Photo1")!, likes: 3145, views: 6365))
        post.append(ProfilePost(author: "triptoworld", description: "London is the capital of Great Britain", image: UIImage(named:"Photo5")!, likes: 4961, views: 6370))
        post.append(ProfilePost(author: "triptoworld", description: "Moscow never sleep...", image: UIImage(named:"Photo2")!, likes: 5346, views: 8432))
        post.append(ProfilePost(author: "triptoworld", description: "Thailand is the land of smiles", image: UIImage(named:"Photo3")!, likes: 7103, views: 9328))

        return post
    }
}
