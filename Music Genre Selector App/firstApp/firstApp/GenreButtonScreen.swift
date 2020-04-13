//
//  GenreButtonScreen.swift
//  firstApp
//
//  Created by Greg Varghese on 4/13/20.
//  Copyright © 2020 Greg Varghese. All rights reserved.
//

import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func genreButtonTapped(_ sender: UIButton) {
        // after asking the user for permissions
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.playGenre(genre: sender.currentTitle!)
            }
        }
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre:  String) {
        musicPlayer.stop()
        
        //set up query to set up genre we want
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
         
        query.addFilterPredicate(predicate) //applies filter to genre songs are going to get
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
    
}
