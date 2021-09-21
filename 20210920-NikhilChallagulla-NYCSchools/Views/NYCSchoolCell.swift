//
//  NYCSchoolCell.swift
//  20210920-NikhilChallagulla-NYCSchools
//
//  Created by Nikhil on 9/19/21.
//

import Foundation
import UIKit

class NYCSchoolCell: UITableViewCell {
    
    private let schoolNameLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 20.0)
        label.textColor = .white
        return label
    }()

    private let addressLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fillEqually
        sv.axis = .vertical
        sv.spacing = 0
        sv.layer.cornerRadius = 8.0
        return sv
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        // cells are reused, so remove any previously created layout
        self.stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        self.contentView.addSubview(stackView)
        self.stackView.addArrangedSubview(schoolNameLbl)
        self.stackView.addArrangedSubview(addressLbl)
        self.stackView.backgroundColor =  UIColor.systemYellow
        setUpContraints()
    }
    //MARK: - initiating cell UI Constraints
    private func setUpContraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0),
            stackView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20)
        ])
    }
    //
    //MARK: - func to configure data in cell UI
    func configure(nycSchoolViewMOdel: NYCSchoolViewModel) {
          schoolNameLbl.text = nycSchoolViewMOdel.schoolName
          addressLbl.text = nycSchoolViewMOdel.address
          schoolNameLbl.setMargins(margin: 20)
          addressLbl.setMargins(margin: 20)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

