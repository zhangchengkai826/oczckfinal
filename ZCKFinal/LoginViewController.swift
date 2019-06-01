//
//  LoginViewController.swift
//  ZCKFinal
//
//  Created by iqra on 2019/5/18.
//  Copyright © 2019 iqra. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        refreshContent()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        refreshContent()
    }
    
    @IBAction func clickOutside(_ sender: UIControl) {
        username.resignFirstResponder()
        passwd.resignFirstResponder()
    }
    
    func refreshContent() {
        if !AppDelegate.bHasLogin {
            hiLabel.isHidden = true
            username.isHidden = false
            passwd.isHidden = false
            btnLogin.isHidden = false
        } else {
            if username.text == nil {
                hiLabel.text = "Hi"
            } else {
                hiLabel.text = "Hi, " + username.text!
            }
            hiLabel.isHidden = false
            username.isHidden = true
            passwd.isHidden = true
            btnLogin.isHidden = true
        }
    }
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var passwd: UITextField!
    @IBOutlet weak var hiLabel: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    @IBAction func login(_ sender: UIButton) {
        if username.text == nil || passwd.text == nil {
            return
        }
        
        let context = AppDelegate.viewContext
        
        let request: NSFetchRequest<Account> = Account.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(
            key: "username", ascending: true,
            selector: #selector(NSString.localizedStandardCompare(_:))
            )]
        request.predicate = NSPredicate(format: "username == %@", username.text!)
        let fetchedResultsController = NSFetchedResultsController<Account>(
            fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: "account")
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            return
        }
        
        if fetchedResultsController.fetchedObjects?.count == 0 {
            let alert = UIAlertController(title: "Error", message: "用户名不存在", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "重试", style: .default))
            self.present(alert, animated: true)
            return
        }
        let account = fetchedResultsController.object(at: IndexPath(item: 0, section: 0))
        if account.passwd == passwd.text {
            let alert = UIAlertController(title: "Succeed", message: "登录成功", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
            AppDelegate.bHasLogin = true
            refreshContent()
        } else {
            let alert = UIAlertController(title: "Error", message: "用户名或密码错误", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "重试", style: .default))
            self.present(alert, animated: true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
