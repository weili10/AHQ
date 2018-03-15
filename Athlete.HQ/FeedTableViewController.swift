//
//  FeedTableViewController.swift
//  Athlete.HQ
//
//  Created by Wei Li on 13/3/18.
//  Copyright © 2018 Wei Li. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController{

    @IBOutlet var FeedTableView: UITableView!
    
    var sampleFeeds = [Feed]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FeedTableView.delegate = self
        FeedTableView.dataSource = self

        loadSampleFeeds()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sampleFeeds.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else {
            fatalError("The dequeued cell is not an instance of FeedTableViewCell.")
        }
        let feed = sampleFeeds[indexPath.row]
        
        cell.FeedCellNameLabel.text = feed.name
        cell.FeedCellTextView.text = feed.text
        cell.FeedCellImageView.image = feed.photo
        
        return cell
    }
 
    private func loadSampleFeeds(){
        let feedName = ["Jack","Peter","Coach"]
        let feedContent = ["You have complete all scheduled training tasks for today!",
                           "Just breaking my own dead lift record XD",
                           "You've done well today, could add 10kg tomorrow. Have a good rest"]
        let photo0 = UIImage(named: feedName[0])
        let photo1 = UIImage(named: feedName[1])
        let photo2 = UIImage(named: feedName[2])
        
        guard let feed0 = Feed(name: feedName[0], photo: photo0, text: feedContent[0]) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let feed1 = Feed(name: feedName[1], photo: photo1, text: feedContent[1]) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let feed2 = Feed(name: feedName[2], photo: photo2, text: feedContent[2]) else {
            fatalError("Unable to instantiate meal1")
        }
                    
        sampleFeeds += [feed0,feed1,feed2]
    }

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
