//
//  shiftabletitleview.swift
//  shiftable
//
//  Created by Juan Jose Nino on 11/17/19.
//  Copyright © 2019 Juan Jose Nino. All rights reserved.
//

import UIKit

class CustomizeTitleView: UIView {
    
    private var centerXConstraint: NSLayoutConstraint!

    var label = UILabel()
    var offset: CGFloat = 0 {
        didSet {
            centerXConstraint?.constant = offset
        }
    }
    
    var titleWidth: CGFloat {
        guard let text = label.text, let font = label.font else { return 0 }
        return (text as NSString).size(withAttributes: [.font: font]).width
    }
    
    init() {
        super.init(frame: .zero)
        self.commonInit(offset: offset)
    }
    
    private func commonInit(offset: CGFloat) {
        //add label
        addSubview(label)
        
        //set constraints
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        centerXConstraint = label.centerXAnchor.constraint(equalTo: centerXAnchor, constant: offset)
        centerXConstraint?.isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit(offset: offset)
    }
}
