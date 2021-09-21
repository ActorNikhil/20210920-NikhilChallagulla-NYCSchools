//
//  ViewController.swift
//  20210920-NikhilChallagulla-NYCSchools
//
//  Created by Nikhil on 9/19/21.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let t = UITableView()
        t.rowHeight = 250
        t.separatorStyle = .none
        return t
    }()
    
    private var viewModel: NYCSchoolsListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Do any additional setup after loading the view.
        setUpUI()
        viewModel = NYCSchoolsListViewModel()
        /// Request the Data thought the ViewModel
        viewModel?.requestForNYCSchoolsData {
            self.tableView.reloadData()
        }
    }
    //MARK: - initiating UI
    private func setUpUI() {
        self.navigationController?.navigationBar.backgroundColor = .red
        self.title = "NYC Schools List"

        //NYC Schools List"
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate( [
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20)
        ])
        tableView.register(NYCSchoolCell.self, forCellReuseIdentifier: "NYCSchoolCell")
        tableView.dataSource =  self
        tableView.delegate =  self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    //MARK:- TableView DataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.nycSchoolViewModel.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let schoolViewModel = viewModel?.nycSchoolViewModel[indexPath.row] else { // Get from Viewmodel object
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "NYCSchoolCell") as? NYCSchoolCell
        cell?.configure(nycSchoolViewMOdel: schoolViewModel)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /// Detail view called
        if let schoolViewModel = viewModel?.nycSchoolViewModel[indexPath.row] {
          let nextViewController = NYCSchoolDetailViewController(schoolViewModel)
          self.present(nextViewController, animated:true, completion:nil)
        }
    }
}

