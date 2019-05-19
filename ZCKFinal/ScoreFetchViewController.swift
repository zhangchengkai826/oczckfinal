//
//  ScoreFetchViewController.swift
//  ZCKFinal
//
//  Created by iqra on 2019/5/18.
//  Copyright © 2019 iqra. All rights reserved.
//

import UIKit
import CoreData

class ScoreFetchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let cellIdentifier = "score"
    var fetchedResultsController: NSFetchedResultsController<Score>?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchInput: UITextField!
    @IBAction func search(_ sender: UIButton) {
        if searchInput.text == nil {
            return
        }
        
        let context = AppDelegate.viewContext
        
        let request: NSFetchRequest<Score> = Score.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(
            key: "subject", ascending: true,
            selector: #selector(NSString.localizedStandardCompare(_:))
            )]
        request.predicate = NSPredicate(format: "student.name == %@", searchInput.text!)
        fetchedResultsController = NSFetchedResultsController<Score>(
            fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: "score")
        try? fetchedResultsController?.performFetch()
        
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
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
            cell?.textLabel?.text = obj.subject! + ": " + String(obj.score) + "分"
        }
        return cell!
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
