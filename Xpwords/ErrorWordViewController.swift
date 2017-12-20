//
//  ErrorWordViewController.swift
//  Xpwords
//
//  Created by Yanggl on 15/11/17.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit

class ErrorWordViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var eTableView: UITableView!
    var errorLists = [ErrorList]()
    var errorType = ErrorType.Date
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        eTableView.tableFooterView = UIView(frame: CGRectZero)
        
        errorLists = UserAPI.sharedInstance.queryError(self.errorType)
        self.eTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Landscape
    }
    
    // MARK: - Touch Methods
    
    @IBAction func segTouch(sender: AnyObject) {
        HelperAPI.systemSound("sys_buttonClick.m4a")
        (self.view.viewWithTag(1) as! UIButton).selected = false
        (self.view.viewWithTag(2) as! UIButton).selected = false
        
        let button:UIButton = sender as! UIButton
        button.selected = true
        
        if button.tag == 1 {
            self.errorType = .Date
        }else {
            self.errorType = .Count
        }
        
        errorLists = UserAPI.sharedInstance.queryError(self.errorType)

        self.eTableView.reloadData()
    }
    
    @IBAction func goHome(sender: AnyObject) {
        HelperAPI.systemSound("sys_buttonClick.m4a")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - TableView Datasource Delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.errorLists.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let list = self.errorLists[section]
        if list.listOpne {
            return list.listError.count
        }else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let list = self.errorLists[indexPath.section]
        let error = list.listError[indexPath.row]

        if self.errorType == ErrorType.Date {
            let cell = tableView.dequeueReusableCellWithIdentifier("dataCell")! as UITableViewCell
            cell.backgroundColor = UIColor.clearColor()
            
            (cell.viewWithTag(21) as! UILabel).text = error.word
            (cell.viewWithTag(22) as! UILabel).text = "\(error.count)次"
            
            return cell
        }else {
            let cell = tableView.dequeueReusableCellWithIdentifier("countCell")! as UITableViewCell
            cell.backgroundColor = UIColor.clearColor()
            
            (cell.viewWithTag(21) as! UILabel).text = error.date
            (cell.viewWithTag(22) as! UILabel).text = "\(error.count)次"
            
            return cell
        }
        
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let errorList = errorLists[section]
        let choose: (indentifier:String, word:String, count:String) = (self.errorType == .Date) ? (indentifier:"dateTitle", word:errorList.listDate, count:"\(errorList.listError.count)个") : (indentifier:"countTitle", word:errorList.listWord, count:"\(errorList.listCount)次")

        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.eTableView.frame.width, height: 120.0))
        let sectionView: SectionView = tableView.dequeueReusableCellWithIdentifier(choose.indentifier) as! SectionView
        sectionView.loadAll( choose.word, count: choose.count, section: section, isOpen: errorList.listOpne, closeBlock: {_,_ in
            HelperAPI.systemSound("sys_buttonClick.m4a")
            errorList.listOpne = !errorList.listOpne
            
            let rows = self.eTableView.numberOfRowsInSection(section)
            if !errorList.listOpne {
                errorList.listIndexPaths.removeAll()
                for var i = 0; i < rows; i++ {
                    errorList.listIndexPaths.append(NSIndexPath(forRow: i, inSection: section))
                }
            }
            self.eTableView.deleteRowsAtIndexPaths(errorList.listIndexPaths, withRowAnimation: UITableViewRowAnimation.Top)
            }, openBlock: {_,_ in
                HelperAPI.systemSound("sys_buttonClick.m4a")
                errorList.listOpne = !errorList.listOpne
                
                if errorList.listIndexPaths.count > 0 {
                    self.eTableView.insertRowsAtIndexPaths(errorList.listIndexPaths, withRowAnimation: UITableViewRowAnimation.Top)
                }else {
                    self.eTableView.reloadData()
                }
        })

        view.addSubview(sectionView)
        return view
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120.0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
        
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
