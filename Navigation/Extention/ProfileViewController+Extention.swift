//
//  ProfileViewController+Extention.swift
//  Navigation
//
//  Created by insomnia on 01.03.2022.
//

import UIKit

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count + 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row  == 0 {
            
            let likesCell = tableView.dequeueReusableCell(withIdentifier: Cells.likesCell) as! LikesViewCell
            likesCell.setLikes(myLikes: likeLabel)
            likesCell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            likesCell.selectionStyle = UITableViewCell.SelectionStyle.none
            return likesCell
        
        } else if indexPath.row  == 1 {
            
            let photoCell = tableView.dequeueReusableCell(withIdentifier: Cells.photoCell) as! PhotosTableViewCell
            let photo = photos
            photoCell.set4photo(photo: photo)
            photoCell.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
            photoCell.selectionStyle = UITableViewCell.SelectionStyle.none
            photoCell.isUserInteractionEnabled = true
            return photoCell
            
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Cells.labelCell) as! MyLootsViewCell
            cell.setFav(favourites: label)
            cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Cells.postCell) as! ProfileHeaderViewCell
            let post = posts[indexPath.row - 3]
            cell.set(post: post)
            cell.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        profileView.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        return profileView
    }
    
    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let photosViewController = PhotosViewController()
            navigationController?.pushViewController(photosViewController, animated: true)
            
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 1 {
            let photoCell = tableView.dequeueReusableCell(withIdentifier: Cells.photoCell) as! PhotosTableViewCell
            photoCell.selectionStyle = UITableViewCell.SelectionStyle.none
        }
    }
}

extension ProfileViewController {
    func fetchData() -> [PostView] {
        let post1 = PostView(author: "PORTRAIT OF TWO BOYS. 1900", description: "Portrait of two boys in an expensive decorative frame. Collectible value is the work of an unknown master, a portrait painted in the style of Western European classicism, around the beginning of 1900. Two boys are depicted on the canvas in oil, most likely they are brothers, since external similarity is visually determined. The children are calmly and serenely posing for the master, one of them is leaning on the sideboard, the second is holding a net for catching butterflies and dragonflies.", imageName: Images.portraitsGays!, price: 29000, views: 3404)
        let post2 = PostView(author: "ANTIQUE WATCH. Girl with a baby. 1914", description: "Antique table clock, composition of a girl holding a baby. The color is gold, the clock mechanism is wound up from the key, the key is included with the watch.", imageName: Images.watch!, price: 39000, views: 1974)
        let post3 = PostView(author: "CКYPTOPUNK. 2017", description: "CryptoPunks is a non-fungible collection of tokens on the Ethereum blockchain. The project was launched in June 2017 by Larva Labs, a two-person team of Canadian software developers Matt Hall and John Watkinson.", imageName: Images.cryptoPunk!, price: 620000, views: 7631)
        let post4 = PostView(author: "THE DAY IS BURNING OUT. VERONA. 1909", description: "The painting was shown at the 17th Exhibition of the St. Petersburg Society of Artists, and was also reproduced on a postcard reproduced in the book Artists of the Russian Salon (St. Petersburg, 2004). The painting “The day is burning down. Verona is a typical and very high-quality example of painting by the famous landscape painter Ivan Avgustovich Velts. The artist's works were often reproduced in pre-revolutionary illustrated magazines and on postcards", imageName: Images.verona!, price: 20400, views: 1760)
        return [post1, post2, post3, post4]
    }
}
