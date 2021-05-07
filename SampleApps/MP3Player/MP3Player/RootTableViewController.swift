//
//  RootTableViewController.swift
//  MP3Player
//
//  Created by Kaan Aslan on 9.02.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit

var cellInfo: [CellInfo]! = []

class RootTableViewController: UITableViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.rowHeight = 70
        
        let fm: FileManager = FileManager.default
        do {
            let url = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            print(url)
            let songs = try fm.contentsOfDirectory(atPath: url.path)
            for song in songs {
                if !song.hasSuffix("mp3") {
                    continue
                }
                var url = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                url.appendPathComponent(song)
                cellInfo.append(CellInfo(songName: song, url: url))
                
            }
        }
        catch {
            print("cannot get directory path!")
            return
        }

       
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
     
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       
        return cellInfo.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let mp3Cell: Mp3TableViewCell = tableView.dequeueReusableCell(withIdentifier: "mp3Cell", for: indexPath) as! Mp3TableViewCell
        
        
        mp3Cell.songName!.text = cellInfo[indexPath.row].songName
        mp3Cell.startStop!.tag = indexPath.row


        return mp3Cell
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
