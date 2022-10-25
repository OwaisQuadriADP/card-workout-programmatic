//
//  CWButton.swift
//  CardWorkout-Programmatic
//
//  Created by Quadri, Owais on 2022-10-25.
//

import UIKit

class CWButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //its a diff init so must call configure again
    init (to title: String,is foregroundColor: UIColor, on backgroundColor: UIColor){
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        configure()
    }
    
    func configure(){
        layer.cornerRadius = 8.0
        titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false //use auto layout
    }
  

}
