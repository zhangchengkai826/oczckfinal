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
    @IBOutlet weak var school: UITextField!
    @IBOutlet weak var hometown: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
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
        
        let student = fetchedResultsController.object(at: IndexPath(item: 0, section: 0))
        name.text = student.name
        id.text = String(student.id)
        school.text = student.school
        hometown.text = student.hometown
        phone.text = String(student.phone)
        email.text = student.email
        
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
