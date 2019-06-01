//
//  InsertViewController.swift
//  ZCKFinal
//
//  Created by iqra on 2019/5/18.
//  Copyright © 2019 iqra. All rights reserved.
//

import UIKit

class InsertViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var citizenId: UITextField!
    @IBOutlet weak var school: UITextField!
    @IBOutlet weak var hometown: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBAction func tagOutside(_ sender: UIControl) {
        name.resignFirstResponder()
        id.resignFirstResponder()
        citizenId.resignFirstResponder()
        school.resignFirstResponder()
        hometown.resignFirstResponder()
        phone.resignFirstResponder()
        email.resignFirstResponder()
    }
    
    @IBAction func submit(_ sender: UIButton) {
        if name.text == nil || id.text == nil || citizenId.text == nil || school.text == nil || hometown.text == nil || phone.text == nil || email.text == nil {
            return
        }
        
        if Int64(id.text!) == nil || Int64(phone.text!) == nil {
            return
        }
        
        let context = AppDelegate.viewContext
        let student = Student(context: context)
        student.name = name.text
        student.id = Int64(id.text!)!
        student.citizenid = citizenId.text
        student.school = school.text
        student.hometown = hometown.text
        student.phone = Int64(phone.text!)!
        student.email = email.text
        if let vctlers = navigationController?.viewControllers {
            let parent = vctlers[vctlers.count-2] as? InfoManViewController
            parent?.updateFetchResults()
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
