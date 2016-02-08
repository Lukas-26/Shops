//
//  AboutView.swift
//  Asia shops
//
//  Created by Lukáš Pechač on 15.12.15.
//  Copyright © 2015 Lukáš Pechač. All rights reserved.
//

import Foundation
import UIKit

class AboutView: UIView {
    
    weak var contactButton: UIButton!
    
    var delegate : AboutViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let myButton = UIButton()
        myButton.setTitle("Kontaktujte mě", forState: .Normal)
        myButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        myButton.backgroundColor=UIColor(colorLiteralRed: 0.235, green: 0.38, blue: 0.847, alpha: 1)
        myButton.addTarget(self, action: "contactButt", forControlEvents: .TouchUpInside)
        
        let text=UILabel()
        text.text="Tato aplikace byla vytvořena jako semestrální práce v předmětu BI-IOS na fakultě Informačních technologií na Českém vysokém učení technickém v Praze.\n\nNa aplikaci se stále pracuje, tak prosím omluvte některé chyby aplikace, které mohou nastat.\n\nV případě, že naleznete nefunkčnost, nebo máte nápad na vylepšení, rád uvítam vaše návrhy, kterém můžete zasílat prostřednictvím kliknutí na tlačítko \"Kontaktujte mě\""
        text.numberOfLines=0
        text.textAlignment=NSTextAlignment.Left
        self.addSubview(text)
        text.snp_makeConstraints { (make) in
            make.topMargin.equalTo(90)
            make.left.equalTo(15)
            make.right.equalTo(-15)
        }
        
        self.addSubview(myButton)
        
        self.contactButton=myButton
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contactButton.frame = CGRectMake(15, CGRectGetHeight(self.bounds)-65, CGRectGetWidth(self.bounds)-30, 50)
    }
    
    func contactButt() {
        delegate?.showAlert()
        print("Contact button pressed")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
protocol AboutViewDelegate {
    
    func showAlert()
}