//
//  SentenceCell.swift
//  Xpwords
//
//  Created by Young on 15/11/14.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit
import AVFoundation

class SentenceCell: UITableViewCell,AVAudioPlayerDelegate {

    @IBOutlet weak var sentence1: UILabel!
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var sentence2: UILabel!
    @IBOutlet weak var title2: UILabel!
    
    var sentence: Sentence!

    private var audioAnimate: UIImageView!
    private var audioAnimate2: UIImageView!
    private var audioPlayer: AVAudioPlayer!
    private var audiosIndex: Int = 0
    private var audios: [String]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func layoutSentence(sentence:Sentence) {
        self.sentence = sentence
        self.sentence1.text = sentence.sentences[0]
        self.title1.text = sentence.titles[0]

//        self.sentence.audios = [["I am", "two","years old"],["I am", "three","years old"]]
        
        if sentence.titles.count > 1 {
            self.viewWithTag(101)?.hidden = false
            self.sentence2.text = sentence.sentences[1]
            self.title2.text = sentence.titles[1]
        }else {
            self.viewWithTag(101)?.hidden = true
            self.sentence2.text = ""
            self.title2.text = ""
        }
    }

    @IBAction func playAudio(sender: AnyObject) {
        if sender.tag == 100 {
            audios = self.sentence.audios[0]
            if audioAnimate == nil {
                audioAnimate = UIImageView(frame: CGRectMake(0, 0, sender.frame.width, sender.frame.height))
                audioAnimate.animationImages = [UIImage(named: "class_audio1")!, UIImage(named: "class_audio2")!]
                audioAnimate.animationDuration = 0.6
                audioAnimate.animationRepeatCount = 2
                audioAnimate.startAnimating()
                sender.addSubview(audioAnimate)
            }else {
                audioAnimate.startAnimating()
            }
        }else {
            audios = self.sentence.audios[1]
            if audioAnimate2 == nil {
                audioAnimate2 = UIImageView(frame: CGRectMake(0, 0, sender.frame.width, sender.frame.height))
                audioAnimate2.animationImages = [UIImage(named: "class_audio1")!, UIImage(named: "class_audio2")!]
                audioAnimate2.animationDuration = 0.6
                audioAnimate2.animationRepeatCount = 2
                audioAnimate2.startAnimating()
                sender.addSubview(audioAnimate2)
            }else {
                audioAnimate2.startAnimating()
            }
        }
        
        audios[0] = audios[0].stringByReplacingOccurrencesOfString("?", withString: ".")
        audiosIndex = 0
        let coinSound = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("MP3/\(audios[audiosIndex])", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: coinSound)
            audioPlayer.delegate = self
            audioPlayer.play()
            
            audiosIndex++
        } catch let error as NSError {
            print("Could not create audio player: \(error)")
        }
    }
    
    //MARK: Delegate
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        if audiosIndex == self.audios.count {
            audiosIndex = 0
            audioPlayer.stop()
            return
        }
        let coinSound = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("MP3/\(audios[audiosIndex])", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: coinSound)
            audioPlayer.delegate = self
            audioPlayer.play()
            
            audiosIndex++
        } catch let error as NSError {
            print("Could not create audio player: \(error)")
        }
    }

}
