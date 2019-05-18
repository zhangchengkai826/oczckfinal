//
//  InfoManViewController.swift
//  ZCKFinal
//
//  Created by iqra on 2019/5/18.
//  Copyright © 2019 iqra. All rights reserved.
//

import UIKit
import CoreData

class InfoManViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let cellIdentifier = "student"
    
    @IBOutlet weak var tableView: UITableView!
    var fetchedResultsController: NSFetchedResultsController<Student>?
    
    func numberOfSectionsInTableView(sender: UITableView) -> Int {
        return fetchedResultsController?.sections?.count ?? 1
    }
    
    func tableView(_ sender: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController?.sections, sections.count > 0 {
            return sections[section].numberOfObjects
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if(cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCell.CellStyle.default,
                reuseIdentifier: cellIdentifier
            )
        }
        if let obj = fetchedResultsController?.object(at: indexPath) {
            cell?.textLabel?.text = obj.name
        }
        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateFetchResults()
        // Do any additional setup after loading the view.
    }
    
    func updateFetchResults() {
        let context = AppDelegate.viewContext
        
        let request: NSFetchRequest<Student> = Student.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(
            key: "name", ascending: true,
            selector: #selector(NSString.localizedStandardCompare(_:))
            )]
        fetchedResultsController = NSFetchedResultsController<Student>(
            fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: "student")
        try? fetchedResultsController?.performFetch()
        tableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "insert") {
            let dest = segue.destination as! InsertViewController;
            dest.navigationItem.title = "添加新学生";
        }
    }

}
