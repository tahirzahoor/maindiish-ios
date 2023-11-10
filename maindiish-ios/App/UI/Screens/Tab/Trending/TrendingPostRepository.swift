import Foundation
import UIKit

class PostRepository {
    
    // MARK: - Shared Instance
    
    static let shared = PostRepository()
    
    // MARK: - Instance Properties
    
    var filterLabels: [String] = ["All", "Italian", "Desi", "Cuban", "French", "Indian", "Pakistani"]
    
    var postData: [PostData] = []
    
    // MARK: - Private Properties
    
    private var dummyImageData = UIImage(named: "dummy_post_image")?.jpegData(compressionQuality: 0.8) ?? Data()
    
    // MARK: - Public Methods
    
    private init() {
        postData = loadData()
    }
    
    private func loadData() -> [PostData] {
        var data = [PostData]()
        
        for i in 1...10 {
            
            let imagesData = Array<Data>(repeating: dummyImageData, count: i)
            let postData = PostData(
                title: "New Food Post",
                owner: "Name-\(i)",
                description: "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
                tags: "#tag #tag #tag #tag #tag",
                imagesData: imagesData,
                timeElapsedSincePosted: "\(i * 3) mins ago",
                numberOfHearts: i * 2 + i,
                numberOfComments: i * 4,
                numberOfViews: i * i,
                numberOfShares: 2 * i
            )
            
            data.append(postData)
        }
        
        return data
    }
    
}
