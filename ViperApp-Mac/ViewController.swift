//
//  ViewController.swift
//  ViperApp-Mac
//
//  Created by Bondar Yaroslav on 02/10/2017.
//  Copyright © 2017 Bondar Yaroslav. All rights reserved.
//

import Cocoa
import ViperKit
import DipUI

class ListViewController: NSViewController {
    var output: ListViewOutput!
    var moduleInput: ModuleInput!
    
    @IBOutlet private weak var tableView: NSTableView!
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }
}

extension ListViewController: StoryboardInstantiatable {}

extension ListViewController: TransitionHandler {
    func openModule(segueIdentifier: String) {
        
    }
    
    func openModule(segueIdentifier: String, configurationBlock: @escaping ConfigurationBlock) {
        
    }
    
    func closeCurrentModule() {
        
    }
}

extension ListViewController: ListViewInput {
    func setupInitialState() {
    }
    
    func show(error: Error) {
        print(error.localizedDescription)
    }
    
    func update(post: Post) {
        print(post.title)
    }
    
    func diplay(posts: [Post]) {
        self.posts = posts
        tableView.reloadData()
    }
}

extension ListViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return posts.count
    }
    
}

extension ListViewController: NSTableViewDelegate {

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "titleCell"), owner: nil) as? NSTableCellView else { return nil }
        
        var text = ""
        let post = posts[row]
        
        if tableColumn == tableView.tableColumns[0] {
            text = post.title
        } else if tableColumn == tableView.tableColumns[1] {
            text = String(post.id)
        } else if tableColumn == tableView.tableColumns[2] {
            text = String(post.userId)
        } else if tableColumn == tableView.tableColumns[3] {
            text = post.body
        }
        
        cell.textField?.stringValue = text
        return cell
    }
    
}

