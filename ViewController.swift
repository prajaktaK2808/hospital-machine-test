////
//  ViewController.swift
//  HospitalMachineTest
//
//  Created by Student P_08 on 07/08/19.
//  Copyright © 2019 felix. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    var HospitalDataArray = [String]()
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var PName: UITextField!
    @IBOutlet weak var DName: UITextField!
    @IBOutlet weak var WNumber: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        TableView.delegate = self
        TableView.dataSource = self
         Display()
    }

    
    @IBAction func SubmitData(_ sender: UIButton)
    {
      /*  let insert = "insert into Hospital(Pname,Dname,Wnumber) values ('\(PName.text!)','\(DName.text!)','\(WNumber.text!)')"
        let insert1 = "insert into Hospital(Pname,Dname,Wnumber) values ('1','DDD','23')"

        
       // let isSuccess = DBWrapper.sharedObj.exuceteQuery(query: insert)
        let isSuccess = DBWrapper.sharedObj.exuceteQuery(query: insert1)
        if isSuccess
        {
            print("Insertion: Success")
           
           // Display()
        }
        else
        {
            print("Failed")
        }*/
        
        
      /*  let insertQeury = "insert into Hospital (Pname,Dname,Wnumber)values('Amit','Dr Patil','12346')"
        let isSuccess = DBWrapper.sharedObj.exuceteQuery(query: insertQeury)
        if isSuccess
        {
            print("Insert:Success")
            Display()
        }
        else
        {
            print("Failed")
        }*/
        
        
        let insert = "insert into Hospital(Pname,Dname,Wnumber)values('\(PName.text!)','\(DName.text!)','\(WNumber.text!)')"
        let isSuccess = DBWrapper.sharedObj.exuceteQuery(query: insert)
        if isSuccess
        {
            print("insert:Success")
           Display()
        }
        else
        {
            print("Failed")
        }
        
    }
    
    @IBAction func CancleData(_ sender: UIButton)
    {
        PName.text = ""
        DName.text = ""
        WNumber.text = ""
    }
    
    func Display()
    {
        let select = "select * from Hospital "
        DBWrapper.sharedObj.selectAllTask(query: select)
        if DBWrapper.sharedObj.HospitaArray.count > 0
        {
            HospitalDataArray = DBWrapper.sharedObj.HospitaArray
            TableView.reloadData()
        }
        else
        {
            print("Data not found")
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return HospitalDataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = HospitalDataArray[indexPath.row]
        return cell
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }


}

