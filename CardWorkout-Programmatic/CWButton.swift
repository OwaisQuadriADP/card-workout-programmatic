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
        translatesAutoresizingMaskIntoConstraints = false //use auto layout
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //its a diff init so must call configure again
    init (_ title: String,is foregroundColor: UIColor, on backgroundColor: UIColor, with image: String){
        super.init(frame: .zero)
        configuration = .tinted()
        configuration?.title = title
        configuration?.baseForegroundColor = foregroundColor
        configuration?.baseBackgroundColor = backgroundColor
        configuration?.cornerStyle = .capsule
        configuration?.image = UIImage(systemName: image)
        configuration?.imagePadding = 4
        configuration?.imagePlacement = .trailing
        translatesAutoresizingMaskIntoConstraints = false //use auto layout
    }
    
  

}
