//
//  NYCSchoolDetailViewController.swift
//  20210920-NikhilChallagulla-NYCSchools
//
//  Created by Nikhil on 9/19/21.
//

import Foundation
import UIKit

class NYCSchoolDetailViewController: UIViewController {
    
    private let schoolNameLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .boldSystemFont(ofSize: 20.0)
        return label
    }()

    private let mathScore: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let readingScore: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let writtingScore: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let cancel: UIButton = {
        let b = UIButton()
        b.setTitle("Cancel", for: .normal)
        b.backgroundColor = .red
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        return b
    }()
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fillEqually
        sv.axis = .vertical
        sv.spacing = 8
        sv.layer.cornerRadius = 4.0
        return sv
    }()
    
    var data: NYCSchoolViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpContraints()
        setData()
        cancel.addTarget(self, action: #selector(didTapOnCancel), for: .touchUpInside)
    }
    
    @objc
    func didTapOnCancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    init(_ detailSatSore: NYCSchoolViewModel) {
        self.data = detailSatSore
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
       super.awakeFromNib()
       //custom logic goes here
    }
    
    //MARK: - Bind UI data
    private func setData() {
        schoolNameLbl.text = data.schoolName
        mathScore.text = "Tha Math Score is :\(data.satMathAvgScore ?? "NA")"
        readingScore.text = "Tha Reading Score is :\(data.satCriticalReadingAvgScore ?? "NA")"
        writtingScore.text = "Tha Writting Score is :\(data.satWritinAvgScore ?? "NA")"
        schoolNameLbl.setMargins(margin: 20)
        mathScore.setMargins(margin: 20)
        readingScore.setMargins(margin: 20)
        writtingScore.setMargins(margin: 20)
    }

    
    //MARK: - initiating UI Constraints
    private func setUpContraints() {
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 26),
            stackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -26),
            stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -300),
            stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120)
        ])
        stackView.layer.cornerRadius = 4.0
        stackView.backgroundColor = .systemYellow
        self.stackView.addArrangedSubview(schoolNameLbl)
        self.stackView.addArrangedSubview(mathScore)
        self.stackView.addArrangedSubview(readingScore)
        self.stackView.addArrangedSubview(writtingScore)
        self.stackView.addArrangedSubview(cancel)
    }

}


