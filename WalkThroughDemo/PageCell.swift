//
//  PageCell.swift
//  WalkThroughDemo
//
//  Created by SimpuMind on 10/25/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page?{
        didSet{
            guard let page = page else {
                return
            }
            
            imageView.image = UIImage(named: page.imageName)
            
            let color = UIColor(white: 0.2, alpha: 1)
            
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium), NSForegroundColorAttributeName: color])
            
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: color]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedText.string.characters.count
            
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            textView.attributedText = attributedText
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupViews()
    }
    
    let imageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .yellow
        iv.image = UIImage(named: "news_slide")
        iv.clipsToBounds = true
        return iv
    }()
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "SAMPLE TEXT FOR NOW"
        tv.isEditable = false
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right : 0)
        return tv
    }()
    
    let lineSeparatorview : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    
    func setupViews(){
        
        addSubview(imageView)
        addSubview(textView)
        addSubview(lineSeparatorview)
        
        imageView.anchorToTop(topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        
        textView.anchorWithConstantsToTop(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 26)
        
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        lineSeparatorview.anchorToTop(nil, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        
        lineSeparatorview.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
