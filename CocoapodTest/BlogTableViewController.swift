//
//  BlogTableViewController.swift
//  CocoapodTest
//
//  Created by Jason on 2020/1/3.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class BlogTableViewController: UITableViewController {
    
    var blogs:[Blog]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 161
        self.tableView.rowHeight = 161
        
       

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        getBlogs()
        CommentUtil().alert(controller: self, title: "温馨提示", msg: "正在请求数据...请稍后")
        
        createReflash()
    
    }
    
    func createReflash() {
        self.refreshControl?.tintColor = UIColor.green
        self.refreshControl?.addTarget(self, action: #selector(reflash), for: .valueChanged)
    }
    @objc func reflash() {
        print("刷新数据")
        getBlogs()
    }

    
    // MARK: - Table view data source
    
    //传递当前行数据
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else {
            return
        }
        
        guard let indexPath = self.tableView.indexPathForSelectedRow else{
            return
        }
        
        print(blogs![indexPath.row])
        //更改全局blodId给评论列表用 偷懒传值法
        blogId! = blogs![indexPath.row].blogId!
        detailVC.blog = blogs![indexPath.row]
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return blogs?.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BlogTableViewCell
        cell.blog = blogs![indexPath.row]
        
        return cell
    }

    
    func getBlogs(){
        let parm = ["size":"1000","page":"1"]
        var blogList = [Blog]()
        NetWorkRequest.sharedInstance.postRequest(UrlString:"blog/showBlogByCreateTime" , paramer: parm, success: { (res) in
            
            for blog in res["data"]{
                let userName = blog.1["userName"].rawString()
                let content = blog.1["content"].rawString()
                let date = blog.1["createTime"].rawString()
                let blogId = blog.1["blogId"].rawValue as! Int
                let blogItem = Blog(userName: userName! , content: content! , date: date!,blogId: blogId )
                blogList.append(blogItem)
            
            }
            self.blogs = blogList
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()

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
