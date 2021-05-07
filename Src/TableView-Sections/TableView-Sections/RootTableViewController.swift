//
//  RootTableViewController.swift
//  TableView-Sections
//
//  Created by Kaan Aslan on 8.12.2018.
//  Copyright © 2018 CSD. All rights reserved.
//

import UIKit

struct SectionData {
    var title: String
    var rowTexts: [String]
    var imageView: UIImageView
    
    init(_ title: String, _ rowTexts: [String], _ imageName: String)
    {
        self.title = title
        self.rowTexts = rowTexts
        
        self.imageView = UIImageView(image: UIImage(named:imageName))
        self.imageView.frame = CGRect(x:300, y: 27, width: 50, height: 50)
    }
}

class RootTableViewController: UITableViewController {
    var sectionData: [SectionData] = [SectionData("İsimler", ["Ali", "Veli", "Selami", "Ayşe", "Fatma", "Kerem"], "WhiteKing"), SectionData("Meyveler",["Kiraz", "Kayısı", "Karpuz", "Armut", "Elma", "Muz"], "WhiteQueen"), SectionData("Şehirler", ["Adana", "İzmir", "Malatya", "Eskişehir", "Ankara", "Bolu"], "WhiteRook")]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return sectionData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return sectionData[section].rowTexts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Mycell", for: indexPath)
        
        if cell.tag == 0 {
            cell.accessoryType = .disclosureIndicator
        }

        cell.textLabel!.text = sectionData[indexPath.section].rowTexts[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return sectionData[section].title
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView : UIView, forSection section: Int)
    {
        let hfv = willDisplayHeaderView as! UITableViewHeaderFooterView
     
        hfv.addSubview(sectionData[section].imageView)
        
        hfv.contentView.backgroundColor = .red
    }

    /*
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let view = UIView()
        view.backgroundColor = .yellow
     
        return view
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
