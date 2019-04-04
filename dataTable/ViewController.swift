//
//  ViewController.swift
//  dataTable
//
//  Created by Brittany.Waters on 4/2/19.
//  Copyright © 2019 Brittany Waters. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    
////// Variables
    var booksLoaded = false
    var booksOrMovies = 1   //used as a switch case
    var holderNumber:Int?
    
////// DATA
            var favMovies:[String] = ["~ M O V I E S ~","Brother Bear (2003)", "The Secret Garden (1993)", "Anastasia (1997)", "Spirited Away (2001)", "Rugrats in Paris: The Movie (2000)", "Spirit: Stallion of the Cimarron (2002)"]
            var favBooks:[String] = ["~ B O O K S ~","The Percy Jackson Series by Rick Riordan", "The Lunar Chronicles by Marissa Meyer", "The Nightworld Series by L.J. Smith", "The Giver by Lois Lowry", "Tuck Everlasting by Natalie Babbitt", "Books by Mary Downing Hahn. These", "were the only ghost books I could", "ever read because ghost stuff freaks", "me out but they were so freakin' good."]
    
    
//Setting number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       /* if booksLoaded == false {
            let holderNumber = favMovies.count
        }
        if booksLoaded == true {
            let holderNumber = favBooks.count
        }
        return holderNumber!
        // return favMovies.count */
        if booksLoaded == false {
            return favMovies.count
        }
        if booksLoaded == true {
            return favBooks.count
        }
        else {
            return 0
        }
    }

    
//Filling the rows with content
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cellInTableView")!
        let holderText = favMovies[indexPath.row]
        myCell.textLabel?.text = holderText
        return myCell
    }
 
    
////// Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var myCustomTableView: UITableView!
    @IBOutlet weak var appendMovieTextField: UITextField!

    
    
////// viewDidLoad sets datasource //////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        myCustomTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    
//----functions for tableViewDataSource protocol
    func myCustomTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if booksLoaded == false {
            return favMovies.count
        }
        if booksLoaded == true {
            return favBooks.count
        } else {            //basically the same as a default case
            return 0
        }
    }
    
    func myCustomTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cellInTableView")

        if booksLoaded == false {
            let holderText = favMovies[indexPath.row]
            myCell?.textLabel?.text = holderText
        }
        if booksLoaded == true {
            let holderTextTwo = favBooks[indexPath.row]
            myCell?.textLabel?.text = holderTextTwo
        }
    
        return myCell!
    }
    
    
////// Actions
    @IBAction func addButtonPressed(_ sender: Any) {
        favMovies.append(appendMovieTextField.text ?? "blah")
        myCustomTableView.reloadData()
    }
    
    @IBAction func removeButtonPressed(_ sender: Any) {
        favMovies.removeLast()
        myCustomTableView.reloadData()
    }
    
    @IBAction func switchTopicButtonPressed(_ sender: Any) {
        //checks if books are already showing
        switch booksOrMovies {
            case 1:
                booksLoaded = true
                booksOrMovies += 1
                myCustomTableView.reloadData()
            case 2:
                booksLoaded = false
                booksOrMovies -= 1
                myCustomTableView.reloadData()
            default:
                break
        }
        
    }
    
    
    
}

