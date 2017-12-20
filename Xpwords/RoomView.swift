//
//  RoomView.swift
//  Xpwords
//
//  Created by Yanggl on 15/11/13.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit

enum RoomType: Int {
    case wordRoom
    case sentenceRoom1
    case sentenceRoom2
}

class RoomView: UIView, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var roomTableView: UITableView!
    @IBOutlet weak var title: UILabel!
    
    var roomType: RoomType = RoomType.wordRoom
    var words = [Word]()
    var sentences = [Sentence]()
    
    var heights = Dictionary<String, CGFloat>()
    
    // MARK: - TableView Datasource Delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.roomType == .wordRoom {
            return (words.count % 4 == 0) ? words.count / 4 : words.count / 4 + 1
        }else {
            return sentences.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if self.roomType == .wordRoom {
            let cellIdentifier = "wordCell"
            var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
            if (cell == nil) {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
            }else {
                while cell?.contentView.subviews.last != nil {
                    cell?.contentView.subviews.last?.removeFromSuperview()
                }
            }
            
            cell!.backgroundColor = UIColor.clearColor()
            
            let count = (words.count - indexPath.row * 4 <= 4) ? (words.count - indexPath.row * 4) : 4
            for var i = 0; i < count; i++ {
                let card = NSBundle.mainBundle().loadNibNamed("WordCard", owner: nil, options: nil)[0] as! WordCard
                card.frame = CGRectMake(50 + 238  * CGFloat(i), 6, 228, 338)
                card.layoutWord(words[indexPath.row * 4 + i])
                cell!.contentView.addSubview(card)
            }
            
            return cell!
        }else {
            let cell = NSBundle.mainBundle().loadNibNamed("WordCard", owner: nil, options: nil)[1] as! SentenceCell
            cell.backgroundColor = UIColor.clearColor()
            
            let imageView = UIImageView(image: UIImage(named: "class_sentence"))
            imageView.frame = CGRectMake(25, 15, cell.frame.width - 50, heights["\(indexPath.row)"]! - 30)
            cell.contentView.insertSubview(imageView, atIndex: 0)
            
            let sentence = sentences[indexPath.row]
            cell.layoutSentence(sentence)
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if self.roomType == .wordRoom {
            return 380.0
        }else {
            let cell = NSBundle.mainBundle().loadNibNamed("WordCard", owner: nil, options: nil)[1] as! SentenceCell
            
            let sentence = sentences[indexPath.row]
            cell.layoutSentence(sentence)
            
            let h = cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height + 1
            if heights["\(indexPath.row)"] == nil {
                heights["\(indexPath.row)"] = h
            }

            return h
        }
    }
    
//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        var text = "单词"
//        if self.roomType == .wordRoom {
//            text = "单词"
//        }else if self.roomType == .sentenceRoom1 {
//            text = "句子（一）"
//        }else {
//            text = "句子（二）"
//        }
//        let view = UIView(frame: CGRectMake(0, 0, 180, 100))
//        let title = UILabel(frame: CGRectMake(60, 40, 180, 50))
//        title.font = UIFont(name: "STYuanti-SC-Bold", size: 35.0)
//        title.text = text
//        view.addSubview(title)
//        
//        return view
//    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
