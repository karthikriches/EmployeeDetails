//
//  ViewController.swift
//  Employee
//
//  Created by Karthik on 15/04/21.
//

import UIKit

class ViewController: UIViewController {

    var users = [User]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        tableView.register(UINib(nibName: "TitleCell", bundle: nil), forCellReuseIdentifier: "TitleCell")
        if !DBManager.shared.readData().isEmpty  {
            users = DBManager.shared.readData()
            print("from DB")
            return
        }
        API.shared.loadAPI {
            result in
            print("loadig API")
            for i in result {
                DBManager.shared.createData(user: i)
            }
            self.users = DBManager.shared.readData()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }

    deinit {
        print("deinit")
    }

}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell") as! TitleCell
        cell.firstName.text = "\(indexPath.row+1). "+users[indexPath.row].firstname + " " + users[indexPath.row].lastname
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        controller.user = users[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    
}

