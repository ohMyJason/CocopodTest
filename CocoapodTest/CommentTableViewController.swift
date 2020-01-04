//
//  CommentTableViewController.swift
//  CocoapodTest
//
//  Created by Jason on 2020/1/4.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class CommentTableViewController: UITableViewController {
    var comments:[Comment]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 91
        self.tableView.rowHeight = 91
        getComments()
        createReflash()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func createReflash() {
        self.refreshControl?.tintColor = UIColor.green
        self.refreshControl?.addTarget(self, action: #selector(reflash), for: .valueChanged)
    }
    
    @objc func reflash() {
        print("刷新数据")
        getComments()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return comments?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentTableViewCell
        cell.comment = comments![indexPath.row]
        
        
        return cell
    }
    
    func getComments(){
        let parm = ["blogId": blogId!]
        
        NetWorkRequest.sharedInstance.postRequest(UrlString:"blog/showComment" , paramer: parm, success: { (res) in
            print(res)
            var commentContain = [Comment]()
            for comment in res["data"]{
                let userName = comment.1["userName"].rawString()
                let content = comment.1["commentContent"].rawString()
                let time = comment.1["commentTime"].rawString()
                let commentId = comment.1["commentId"].rawValue as! Int
                
        
                let commentItem = Comment(commentId: commentId, userName: userName!, content: content!, time: time!)
                
                commentContain.append(commentItem)
                
            }
            self.comments = commentContain
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
           
            print("加载评论数据。。。")
            print(self.comments)
            
            
        }) { (error) in
            
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
