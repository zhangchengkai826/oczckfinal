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
    
    @IBAction func tagOutside(_ sender: UIControl) {
        searchInput.resignFirstResponder()
    }
    @IBOutlet weak var searchInput: UITextField!
    @IBAction func search(_ sender: UIButton) {
        let context = AppDelegate.viewContext
        
        let request: NSFetchRequest<Student> = Student.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(
            key: "name", ascending: true,
            selector: #selector(NSString.localizedStandardCompare(_:))
            )]
        if searchInput.text != nil && searchInput.text != "" {
            request.predicate = NSPredicate(format: "name CONTAINS %@", searchInput.text!)
        }
        fetchedResultsController = NSFetchedResultsController<Student>(
            fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: "student")
        try? fetchedResultsController?.performFetch()
        tableView.reloadData()
    }
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
        
        refreshContent()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        refreshContent()
    }
    
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var insertBtn: UIButton!
    func refreshContent() {
        if !AppDelegate.bHasLogin {
            searchBtn.isEnabled = false
            insertBtn.isEnabled = false
            searchInput.isEnabled = false
            let alert = UIAlertController(title: "Error", message: "请登录", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        } else {
            searchBtn.isEnabled = true
            insertBtn.isEnabled = true
            searchInput.isEnabled = true
            updateFetchResults()
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detail", sender: tableView.cellForRow(at: indexPath))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "insert") {
            let dest = segue.destination as! InsertViewController
            dest.navigationItem.title = "添加新学生"
        } else if(segue.identifier == "detail") {
            let dest = segue.destination as! DetailViewController
            let cell = sender as? UITableViewCell
            dest.navigationItem.title = cell?.textLabel?.text
        }
    }
    
}
