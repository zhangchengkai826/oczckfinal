//
//  AppDelegate.swift
//  ZCKFinal
//
//  Created by iqra on 2019/5/18.
//  Copyright © 2019 iqra. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let context = AppDelegate.viewContext
        let student1 = Student(context: context)
        student1.name = "章成凯"
        student1.id = 2017302580093
        student1.citizenid = "330481199908265816"
        student1.school = "计算机学院"
        student1.hometown = "杭州"
        student1.phone = 15927310675
        student1.email = "15927310675@163.com"
        
        let student2 = Student(context: context)
        student2.name = "胡宽东"
        student2.id = 2017302581923
        student2.citizenid = "356423199811120987"
        student2.school = "计算机学院"
        student2.hometown = "武汉"
        student2.phone = 15968930875
        student2.email = "15968930875@126.com"
        
        var student = Student(context: context)
        student.name = "魏明宇"
        student.id = 2016578907689
        student.citizenid = "345676199807075467"
        student.school = "计算机学院"
        student.hometown = "Wuhan"
        student.phone = 15968938790
        student.email = "15968938790@163.com"
        
        student = Student(context: context)
        student.name = "陈叔杰"
        student.id = 2016571234589
        student.citizenid = "344567199805075466"
        student.school = "外语学院"
        student.hometown = "武汉"
        student.phone = 15963458790
        student.email = "15963458790@163.com"
        
        student = Student(context: context)
        student.name = "宋勇忠"
        student.id = 2017573234534
        student.citizenid = "342387199806185476"
        student.school = "医学院"
        student.hometown = "荆州"
        student.phone = 15783458790
        student.email = "15783458790@163.com"
        
        student = Student(context: context)
        student.name = "何远平"
        student.id = 2017238934534
        student.citizenid = "342323199802225456"
        student.school = "化学院"
        student.hometown = "十堰"
        student.phone = 15783678790
        student.email = "15783678790@126.com"
        
        student = Student(context: context)
        student.name = "张秉杰"
        student.id = 2017235783434
        student.citizenid = "345673199812225456"
        student.school = "物理学院"
        student.hometown = "荆门"
        student.phone = 15784598790
        student.email = "15784598790@126.com"
        
        student = Student(context: context)
        student.name = "张清一"
        student.id = 2017245634434
        student.citizenid = "345457199911223456"
        student.school = "哲学学院"
        student.hometown = "武汉"
        student.phone = 15784565790
        student.email = "15784565790@163.com"
        
        student = Student(context: context)
        student.name = "李维言"
        student.id = 2016578634434
        student.citizenid = "345356199710123446"
        student.school = "物理学院"
        student.hometown = "武汉"
        student.phone = 15782345540
        student.email = "15782345540@163.com"
        
        student = Student(context: context)
        student.name = "张祥军"
        student.id = 2017245635634
        student.citizenid = "345234199910123236"
        student.school = "哲学学院"
        student.hometown = "成都"
        student.phone = 15348705790
        student.email = "15348705790@163.com"
        
        student = Student(context: context)
        student.name = "李正为"
        student.id = 2016578656734
        student.citizenid = "345357199803123556"
        student.school = "计算机学院"
        student.hometown = "武汉"
        student.phone = 15788765540
        student.email = "15788765540@163.com"
        
        student = Student(context: context)
        student.name = "袁奎红"
        student.id = 2017245347634
        student.citizenid = "345234199810143236"
        student.school = "哲学学院"
        student.hometown = "武汉"
        student.phone = 15348568790
        student.email = "15348568790@163.com"
        
        student = Student(context: context)
        student.name = "李回宗"
        student.id = 2016545656734
        student.citizenid = "345357199911233556"
        student.school = "文学院"
        student.hometown = "荆门"
        student.phone = 15786734540
        student.email = "15786734540@163.com"
        
        student = Student(context: context)
        student.name = "刘匀常"
        student.id = 2017245234534
        student.citizenid = "342312199811243236"
        student.school = "物理学院"
        student.hometown = "武汉"
        student.phone = 15348568123
        student.email = "15348568123@163.com"
        
        student = Student(context: context)
        student.name = "李于军"
        student.id = 2016234326734
        student.citizenid = "342345199801233545"
        student.school = "计算机学院"
        student.hometown = "武汉"
        student.phone = 15786723232
        student.email = "15786723232@163.com"
        
        student = Student(context: context)
        student.name = "李江治"
        student.id = 2017242344534
        student.citizenid = "543412199901213236"
        student.school = "物理学院"
        student.hometown = "荆州"
        student.phone = 15312345623
        student.email = "15312345623@126.com"
        
        student = Student(context: context)
        student.name = "钟波"
        student.id = 2016234453234
        student.citizenid = "432345199803233534"
        student.school = "数学院"
        student.hometown = "成都"
        student.phone = 15123213232
        student.email = "15123213232@163.com"
        
        var score = Score(context: context)
        score.subject = "信息系统导论"
        score.score = 94
        score.student = student1
        
        score = Score(context: context)
        score.subject = "信息系统导论实验"
        score.score = 95
        score.student = student1
        
        score = Score(context: context)
        score.subject = "计算机基础及应用"
        score.score = 95
        score.student = student1
        
        score = Score(context: context)
        score.subject = "英语听说1"
        score.score = 85
        score.student = student1
        
        score = Score(context: context)
        score.subject = "军事理论"
        score.score = 91
        score.student = student1
        
        score = Score(context: context)
        score.subject = "大学英语2"
        score.score = 91
        score.student = student1
        
        score = Score(context: context)
        score.subject = "高等数学B1"
        score.score = 96
        score.student = student1
        
        score = Score(context: context)
        score.subject = "思想道德修养与法律基础"
        score.score = 95
        score.student = student1
        
        score = Score(context: context)
        score.subject = "中国近代史纲要"
        score.score = 93
        score.student = student1
        
        score = Score(context: context)
        score.subject = "古希腊语"
        score.score = 94
        score.student = student1
        
        score = Score(context: context)
        score.subject = "英语听说2"
        score.score = 96
        score.student = student1
        
        score = Score(context: context)
        score.subject = "C++程序设计"
        score.score = 92
        score.student = student1
        
        score = Score(context: context)
        score.subject = "C++程序设计实验"
        score.score = 98
        score.student = student1
        
        score = Score(context: context)
        score.subject = "计算机音乐"
        score.score = 89
        score.student = student1
        
        score = Score(context: context)
        score.subject = "定向越野（高级）"
        score.score = 92
        score.student = student1
        
        score = Score(context: context)
        score.subject = "大学英语3"
        score.score = 89
        score.student = student1
        
        score = Score(context: context)
        score.subject = "高等数学B2"
        score.score = 99
        score.student = student1
        
        score = Score(context: context)
        score.subject = "线性代数B"
        score.score = 93
        score.student = student1
        
        score = Score(context: context)
        score.subject = "大学物理B（上）"
        score.score = 92
        score.student = student1
        
        score = Score(context: context)
        score.subject = "马克思主义基本原理概论"
        score.score = 90
        score.student = student1
        
        score = Score(context: context)
        score.subject = "创业管理与实践"
        score.score = 90
        score.student = student1
        
        score = Score(context: context)
        score.subject = "信息系统导论"
        score.score = 93
        score.student = student2
        
        score = Score(context: context)
        score.subject = "信息系统导论实验"
        score.score = 91
        score.student = student2
        
        score = Score(context: context)
        score.subject = "计算机基础及应用"
        score.score = 88
        score.student = student2
        
        score = Score(context: context)
        score.subject = "英语听说1"
        score.score = 86
        score.student = student2
        
        score = Score(context: context)
        score.subject = "军事理论"
        score.score = 92
        score.student = student2
        
        score = Score(context: context)
        score.subject = "大学英语2"
        score.score = 85
        score.student = student2
        
        score = Score(context: context)
        score.subject = "高等数学B1"
        score.score = 91
        score.student = student2
        
        score = Score(context: context)
        score.subject = "思想道德修养与法律基础"
        score.score = 94
        score.student = student2
        
        score = Score(context: context)
        score.subject = "中国近代史纲要"
        score.score = 94
        score.student = student2
        
        score = Score(context: context)
        score.subject = "古希腊语"
        score.score = 81
        score.student = student2
        
        score = Score(context: context)
        score.subject = "英语听说2"
        score.score = 91
        score.student = student2
        
        score = Score(context: context)
        score.subject = "C++程序设计"
        score.score = 86
        score.student = student2
        
        score = Score(context: context)
        score.subject = "C++程序设计实验"
        score.score = 92
        score.student = student2
        
        score = Score(context: context)
        score.subject = "计算机音乐"
        score.score = 88
        score.student = student2
        
        score = Score(context: context)
        score.subject = "定向越野（高级）"
        score.score = 94
        score.student = student2
        
        score = Score(context: context)
        score.subject = "大学英语3"
        score.score = 86
        score.student = student2
        
        score = Score(context: context)
        score.subject = "高等数学B2"
        score.score = 96
        score.student = student2
        
        score = Score(context: context)
        score.subject = "线性代数B"
        score.score = 93
        score.student = student2
        
        score = Score(context: context)
        score.subject = "大学物理B（上）"
        score.score = 94
        score.student = student2
        
        score = Score(context: context)
        score.subject = "马克思主义基本原理概论"
        score.score = 92
        score.student = student2
        
        score = Score(context: context)
        score.subject = "创业管理与实践"
        score.score = 85
        score.student = student2
        
        var account = Account(context: context)
        account.username = "zck"
        account.passwd = "123abc"
        
        account = Account(context: context)
        account.username = "zs"
        account.passwd = "654xyz"
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "ZCKFinal")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    static var persistentContainer: NSPersistentContainer {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    }
    
    static var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    static var bHasLogin: Bool = false
}

