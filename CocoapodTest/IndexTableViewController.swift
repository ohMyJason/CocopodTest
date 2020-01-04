//
//  IndexTableViewController.swift
//  CocoapodTest
//
//  Created by Jason on 2020/1/1.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class IndexTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.isEditing = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0 {
            return 3
        }else{
            return 10
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        if  cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellID")
        }
        cell?.textLabel?.text = "第\(indexPath.section)分区"
        cell?.detailTextLabel?.text = "第\(indexPath.row)行"
        cell?.imageView?.image = UIImage(named: "image")
        cell?.backgroundColor = UIColor.purple
        cell?.accessoryType = .checkmark
        return cell!
    }
    //设置行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section==0 {
            return 100
        }else{
            return 44
        }
    }
    //设置分区尾视图高度
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    //设置分区头视图高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    //设置分区头视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        view.backgroundColor = UIColor.blue
        return view
    }
    //设置分区尾视图
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        view.backgroundColor = UIColor.green
        return view
    }
    //选中cell时调用的方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.section == 0 {
            return .insert
        }else{
            return .delete
        }
    }
    //设置某行数据载体cell是否支持位置移动
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //设置移动后回调的方法
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    //设置删除按钮的标题
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    //提交编辑操作时触发的方法
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["one","two"]
    }
}
