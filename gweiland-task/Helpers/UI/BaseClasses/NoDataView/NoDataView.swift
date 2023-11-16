////
////  NoDataView.swift
////  Nounou
////
////  Created by Maaz on 06/07/23.
////
//
//import Foundation
//import UIKit
//import Stevia
//
//
//class NoDataView: BaseView {
//    
//    let parentView = UIView()
//    
//    let titleLabel = Label(text: "No data", textColor: primary, font: .CustomFont(.bold, size: 24), alignment: .center)
//    let bodyLabel = Label(text: "Press \"Add\" on top-right to add a new address",  textColor: .darkGray, font: .CustomFont(.regular, size: 18), alignment: .center, numberOfLines: 0)
//    lazy var labelStack = StackView(arrangedSubviews: [titleLabel, bodyLabel], spacing: defaultSpacing/2 ,axis: .vertical, distribution: .fill)
//    
//    init(titleLabel: String, bodyLabel: String){
//        super.init(frame: .zero)
//        
//        self.titleLabel.text = titleLabel.localized()
//        self.bodyLabel.text = bodyLabel.localized()
//        
//        isHidden = true
//        
//        configureUI()
//        
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func configureUI() {
//        
//        titleLabel.setContentHuggingPriority(.required, for: .vertical)
//        bodyLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
//        
//        subviews{
//            parentView
//        }
//        
//        parentView.subviews{
//            labelStack
//        }
//        
//        parentView.Width == Width/1.3
//        parentView.centerVertically()
//        parentView.centerHorizontally()
//        
//        labelStack.fillContainer()
//    }
//    
//    
//}
