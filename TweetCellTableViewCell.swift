//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Aryan Sharma on 9/13/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    @IBAction func fav(_ sender: Any) {
        
        let tobeFavorited = !favorited
        if(tobeFavorited)
        {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(isFavorited: true)
                
            }, failure: {(error) in
                print("Favorite did not succeed:\(error)")
                
            })
        }
            else{
                TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                    self.setFavorite(isFavorited: false)
                    
                }, failure: {(error) in
                    print ("Unfavorite did not succeed: \(error)")
                    })
            }
        }
    @IBOutlet weak var fav: UIButton!
    
    @IBOutlet weak var retweet: UIButton!
    
    @IBAction func retweet(_ sender: Any) {
        
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success : {
            self.setRetweeted(isRetweeted: true)},
            failure:{(error) in
            print("Error is retweeting :\(error)")
        })
    }
    
    func setRetweeted( isRetweeted: Bool)
    {
        if(isRetweeted)
        {
          retweet.setImage(UIImage(named: "retweet-icon-green"), for:UIControl.State.normal)
            retweet.isEnabled = false
        }
        else{
            retweet.setImage(UIImage(named: "retweet-icon"), for:UIControl.State.normal)
                       retweet.isEnabled = true
        }
    }
    var favorited: Bool = false
    var tweetId:Int = -1
    //var retweeted: Bool = false
    
    func setFavorite( isFavorited: Bool)
    {
        favorited=isFavorited
        if(favorited)
        {
            fav.setImage(UIImage(named:"favor-icon-red"), for:UIControl.State.normal )
        }
        else{
            fav.setImage(UIImage(named:"favor-icon"), for:UIControl.State.normal )
            
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
