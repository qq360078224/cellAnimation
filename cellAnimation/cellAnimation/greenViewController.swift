//
//  ViewController2.swift
//  cellAnimation
//
//  Created by XQ on 16/7/15.
//  Copyright © 2016年 XQ. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView.init(frame: self.view.frame)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.addSubview(tableView)

        // Do any additional setup after loading the view.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.greenColor()
        cell.textLabel?.text = "aaaaaaaaa \(indexPath.row) aaaaaaaa"
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = ViewController()
        self.navigationController?.popViewControllerAnimated(true)
    }
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let trans = CATransform3DMakeScale(0.1, 0.1, 0.1)
        cell.layer.transform = CATransform3DRotate(trans, CGFloat(M_PI_2), 0, 0, 1)
        UIView.animateWithDuration(1) { () -> Void in
            cell.layer.transform = CATransform3DIdentity
        }
        cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
