//
//  UserSpaceViewController.swift
//  Xpwords
//
//  Created by Yanggl on 15/11/13.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit

class UserSpaceViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var userTableView: UITableView!
    var imagePickerController: UIImagePickerController?
    var errCount = 0
    
    //MARK: TableView DataSource Delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if UserAPI.sharedInstance.rewardBest != 0 {
            return 5
        }else if UserAPI.sharedInstance.rewardExcell != 0 {
            return 4
        }else if UserAPI.sharedInstance.rewardGood != 0 {
            return 3
        }else {
            return 2
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1 {
            return (UserAPI.sharedInstance.rewardUsual % 5 == 0) ? UserAPI.sharedInstance.rewardUsual / 5 : UserAPI.sharedInstance.rewardUsual / 5 + 1
        }else if section == 2 {
            return (UserAPI.sharedInstance.rewardGood % 5 == 0) ? UserAPI.sharedInstance.rewardGood / 5 : UserAPI.sharedInstance.rewardGood / 5 + 1
        }else if section == 3{
            return (UserAPI.sharedInstance.rewardExcell % 3 == 0) ? UserAPI.sharedInstance.rewardExcell / 3 : UserAPI.sharedInstance.rewardExcell / 3 + 1
        }else {
            return (UserAPI.sharedInstance.rewardBest % 3 == 0) ? UserAPI.sharedInstance.rewardBest / 3 : UserAPI.sharedInstance.rewardBest / 3 + 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("userCell")!
            cell.backgroundColor = UIColor.clearColor()
            
            (cell.viewWithTag(1) as! UIImageView).image = UserAPI.sharedInstance.photo
            (cell.viewWithTag(2) as! UITextField).text = UserAPI.sharedInstance.name
            (cell.viewWithTag(3) as! UITextField).text = UserAPI.sharedInstance.sex
            (cell.viewWithTag(4) as! UITextField).text = UserAPI.sharedInstance.age
            (cell.viewWithTag(5) as! UITextField).text = UserAPI.sharedInstance.coins
            (cell.viewWithTag(6) as! UITextField).text = "\(self.errCount)"
            
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("usualCell")!
            cell.backgroundColor = UIColor.clearColor()
            
            if (UserAPI.sharedInstance.rewardUsual % 5 != 0) {
                let num = UserAPI.sharedInstance.rewardUsual - (indexPath.row + 1) * 5
                if num < 0 {
                    if num == -1 {
                        cell.viewWithTag(25)!.hidden = true
                    }else if num == -2 {
                        cell.viewWithTag(25)!.hidden = true
                        cell.viewWithTag(24)!.hidden = true
                    }else if num == -3 {
                        cell.viewWithTag(25)!.hidden = true
                        cell.viewWithTag(24)!.hidden = true
                        cell.viewWithTag(23)!.hidden = true
                    }else if num == -4 {
                        cell.viewWithTag(25)!.hidden = true
                        cell.viewWithTag(24)!.hidden = true
                        cell.viewWithTag(23)!.hidden = true
                        cell.viewWithTag(22)!.hidden = true
                    }
                }
            }
            
            return cell
        }else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("goodCell")!
            cell.backgroundColor = UIColor.clearColor()
            
            if (UserAPI.sharedInstance.rewardGood % 5 != 0) {
                let num = UserAPI.sharedInstance.rewardGood - (indexPath.row + 1) * 5
                if num < 0 {
                    if num == -1 {
                        cell.viewWithTag(35)!.hidden = true
                    }else if num == -2 {
                        cell.viewWithTag(35)!.hidden = true
                        cell.viewWithTag(34)!.hidden = true
                    }else if num == -3 {
                        cell.viewWithTag(35)!.hidden = true
                        cell.viewWithTag(34)!.hidden = true
                        cell.viewWithTag(33)!.hidden = true
                    }else if num == -4 {
                        cell.viewWithTag(35)!.hidden = true
                        cell.viewWithTag(34)!.hidden = true
                        cell.viewWithTag(33)!.hidden = true
                        cell.viewWithTag(32)!.hidden = true
                    }
                }
            }
            return cell
        }else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCellWithIdentifier("excellCell")!
            cell.backgroundColor = UIColor.clearColor()
            
            if (UserAPI.sharedInstance.rewardExcell % 3 != 0) {
                let num = UserAPI.sharedInstance.rewardExcell - (indexPath.row + 1) * 3
                if num < 0 {
                    if num == -1 {
                        cell.viewWithTag(43)!.hidden = true
                    }else {
                        cell.viewWithTag(43)!.hidden = true
                        cell.viewWithTag(42)!.hidden = true
                    }
                }
            }
            return cell
        }else {
            let cell = tableView.dequeueReusableCellWithIdentifier("bestCell")!
            cell.backgroundColor = UIColor.clearColor()
            
            if (UserAPI.sharedInstance.rewardBest % 3 != 0) {
                let num = UserAPI.sharedInstance.rewardBest - (indexPath.row + 1) * 3
                if num < 0 {
                    if num == -1 {
                        cell.viewWithTag(53)!.hidden = true
                    }else {
                        cell.viewWithTag(53)!.hidden = true
                        cell.viewWithTag(52)!.hidden = true
                    }
                }
            }
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 286.0
        }else if indexPath.section == 1 {
            return 130.0
        }else if indexPath.section == 2 {
            return 150.0
        }else if indexPath.section == 3 {
            return 228.0
        }else {
            return 245.0
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80.0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCellWithIdentifier("titleCell")!
        cell.backgroundColor = UIColor.clearColor()
        let tap = UITapGestureRecognizer(target: self, action: Selector("tapGesture:"))
        cell.addGestureRecognizer(tap)
        
        if section == 0 {
            (cell.viewWithTag(15) as! UILabel).text = "         用户信息"
        }else if section == 1 {
            cell.tag = 20
            (cell.viewWithTag(15) as! UILabel).text = "三星奖章"  //连续1次
        }else if section == 2 {
            cell.tag = 30
            (cell.viewWithTag(15) as! UILabel).text = "六星奖章"  //连续2次
        }else if section == 3 {
            cell.tag = 40
            (cell.viewWithTag(15) as! UILabel).text = "九星奖牌"  //连续3次
        }else {
            cell.tag = 50
            (cell.viewWithTag(15) as! UILabel).text = "至尊奖杯"   //连续5次
        }
        
        return cell
    }
    
    // MARK: - NavigationController, ImagePickerController Delegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
//        let image = editingInfo![UIImagePickerControllerEditedImage] as! UIImage
        let photoPath = NSHomeDirectory().stringByAppendingFormat("/Library/Caches/user_photo.png")
        if ((UIImagePNGRepresentation(image)?.writeToFile(photoPath, atomically: true)) != nil) {
            UserAPI.sharedInstance.photo = image
            (self.view.viewWithTag(1) as! UIImageView).image = UserAPI.sharedInstance.photo
        }
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: Cycle life
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        for list in UserAPI.sharedInstance.queryError(ErrorType.Count) {
            errCount += list.listCount
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Landscape
    }

    // MARK: - Private Methods
    
    @IBAction func tapGesture(sender: AnyObject) {
        let view = sender.view!
        
        let alertView = NSBundle.mainBundle().loadNibNamed("UtilAlertView", owner: nil, options: nil)[0] as! UtilAlertView
        if view!.tag == 20 {
            alertView.show("连续三星闯关一次获得三星奖章")
        }else if view!.tag == 30 {
            alertView.show("连续三星闯关二次获得六星奖章")
        }else if view!.tag == 40 {
            alertView.show("连续三星闯关三次获得九星奖牌")
        }else {
            alertView.show("连续三星闯关五次获得至尊奖杯")
        }
    }
    
    
    // MARK: - Touch Methods
    
    @IBAction func goHome(sender: AnyObject) {
        HelperAPI.systemSound("sys_buttonClick.m4a")
        self.dismissViewControllerAnimated(true, completion: nil)
        
        if  (self.view.viewWithTag(2) as! UITextField).text! != UserAPI.sharedInstance.name ||
            (self.view.viewWithTag(3) as! UITextField).text! != UserAPI.sharedInstance.sex  ||
            (self.view.viewWithTag(4) as! UITextField).text! != UserAPI.sharedInstance.age ||
            (self.view.viewWithTag(5) as! UITextField).text! != UserAPI.sharedInstance.coins {
                UserAPI.sharedInstance.name = (self.view.viewWithTag(2) as! UITextField).text!
                UserAPI.sharedInstance.sex = (self.view.viewWithTag(3) as! UITextField).text!
                UserAPI.sharedInstance.age = (self.view.viewWithTag(4) as! UITextField).text!
                UserAPI.sharedInstance.coins = (self.view.viewWithTag(5) as! UITextField).text!
                
                UserAPI.sharedInstance.updateUser()
        }
    }
    
    @IBAction func getPhoto(sender: AnyObject) {
        HelperAPI.systemSound("sys_buttonClick.m4a")
        let alertView = NSBundle.mainBundle().loadNibNamed("UtilAlertView", owner: nil, options: nil)[2] as! UtilAlertView
        alertView.show("修改头像", btnLeft: "照相", btnRight: "相册")
        alertView.goBack = {
            let isCamera = UIImagePickerController.isCameraDeviceAvailable(UIImagePickerControllerCameraDevice.Rear)
            if !isCamera {
                print("没有摄像头")
                return
            }
            
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
            imagePickerController.delegate = self
            imagePickerController.allowsEditing = true// 编辑模式
            imagePickerController.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
            self.imagePickerController = imagePickerController
            
            self.presentViewController(self.imagePickerController!, animated: true, completion: nil)
        }
        alertView.goAgain = {
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            imagePickerController.delegate = self
            imagePickerController.allowsEditing = true
            imagePickerController.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
            self.imagePickerController = imagePickerController
            
            self.presentViewController(self.imagePickerController!, animated: true, completion: nil)
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        HelperAPI.systemSound("sys_buttonClick.m4a")
    }
    

}
