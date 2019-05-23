//
//  DetailViewController.swift
//  ZCKFinal
//
//  Created by iqra on 2019/5/18.
//  Copyright © 2019 iqra. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var citizenId: UITextField!
    @IBOutlet weak var school: UITextField!
    @IBOutlet weak var hometown: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    private var student: Student?;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if navigationItem.title == nil {
            return
        }

        let context = AppDelegate.viewContext
        
        let request: NSFetchRequest<Student> = Student.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(
            key: "name", ascending: true,
            selector: #selector(NSString.localizedStandardCompare(_:))
            )]
        request.predicate = NSPredicate(format: "name == %@", navigationItem.title!)
        let fetchedResultsController = NSFetchedResultsController<Student>(
            fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: "student")

        do {
            try fetchedResultsController.performFetch()
        } catch {
            return
        }
        
        student = fetchedResultsController.object(at: IndexPath(item: 0, section: 0))
        name.text = student?.name
        id.text = String(student!.id)
        school.text = student?.school
        hometown.text = student?.hometown
        phone.text = String(student!.phone)
        email.text = student?.email
        
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var modifyButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBAction func modifyThis(_ sender: UIButton) {
        if modifyButton.title(for: .normal) == "修改" {
            id.isEnabled = true
            school.isEnabled = true
            hometown.isEnabled = true
            phone.isEnabled = true
            email.isEnabled = true
            modifyButton.setTitle("提交", for: .normal)
            deleteButton.isEnabled = false
        } else {
            if id.text == nil || school.text == nil || hometown.text == nil || phone.text == nil || email.text == nil {
                return
            }
            
            if Int64(id.text!) == nil || Int64(phone.text!) == nil {
                return
            }
            
            id.isEnabled = false
            school.isEnabled = false
            hometown.isEnabled = false
            phone.isEnabled = false
            email.isEnabled = false
            modifyButton.setTitle("修改", for: .normal)
            deleteButton.isEnabled = true
            
            student?.id = Int64(id.text!)!
            student?.school = school.text
            student?.hometown = hometown.text
            student?.phone = Int64(phone.text!)!
            student?.email = email.text
        }
    }
    
    @IBAction func deleteThis(_ sender: UIButton) {
        AppDelegate.viewContext.delete(student!)
        if let vctlers = navigationController?.viewControllers {
            let parent = vctlers[vctlers.count-2] as? InfoManViewController
            parent?.updateFetchResults()
        }
        navigationController?.popViewController(animated: true)
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
