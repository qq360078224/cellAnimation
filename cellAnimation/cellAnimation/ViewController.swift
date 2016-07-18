//
//  ViewController.swift
//  cellAnimation
//
//  Created by XQ on 16/7/15.
//  Copyright © 2016年 XQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView = UITableView.init(frame: self.view.frame)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.addSubview(tableView)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.redColor()
        cell.textLabel?.text = "aaaaaaaaa \(indexPath.row) aaaaaaaa"
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell

    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = ViewController2()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
        let cells = self.tableView.visibleCells
        for cell in cells {
            cell.transform = CGAffineTransformMakeTranslation(0, self.view.frame.size.height)
        }
        for (index, cell) in cells.enumerate() {
            UIView.animateWithDuration(1, delay: 0.05 * Double(index), options: .CurveLinear, animations: { () -> Void in
                cell.transform = CGAffineTransformMakeTranslation(0, 0)
                }, completion: { (finished) -> Void in
                    
            })
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

