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
    @IBOutlet weak var school: UITextField!
    @IBOutlet weak var hometown: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBAction func submit(_ sender: UIButton) {
        if name.text == nil || id.text == nil || school.text == nil || hometown.text == nil || phone.text == nil || email.text == nil {
            return
        }
        
        if Int64(id.text!) == nil || Int64(phone.text!) == nil {
            return
        }
        
        let context = AppDelegate.viewContext
        let student = Student(context: context)
        student.name = name.text
        student.id = Int64(id.text!)!
        student.school = school.text
        student.hometown = hometown.text
        student.phone = Int64(phone.text!)!
        student.email = email.text
        
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
