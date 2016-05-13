//
//  AvatarView.swift
//  CustomControl
//
//  Created by Corotata on 16/5/12.
//  Copyright © 2016年 Sun. All rights reserved.
//

import UIKit
@IBDesignable
class AvatarView: UIView {

    let backgroundImageView = UIImageView()
    let iconView = UIImageView()
    let nameLabel = UILabel()
    
    //设置背景
    @IBInspectable var backgroundImageAvatar: UIImage? {
        didSet {
            configure()
        }
    }
    
    //设置头像
    @IBInspectable var imageAvatar: UIImage? {
        didSet {
            configure()
        }
    }
    
    //设置用户名
    @IBInspectable var avatarName: String = "" {
        didSet {
            configure()
        }
    }

    
    //设置头像的边框宽度
    @IBInspectable var imageBorderWidth:CGFloat = 5{
        didSet{
            configure()
        }
    }
    
    //设置头像的边框颜色
    @IBInspectable var imageBorderColor:UIColor? {
        didSet {
            configure()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    func configure(){
        iconView.layer.borderColor = imageBorderColor?.CGColor
        iconView.layer.borderWidth = imageBorderWidth
        iconView.image = imageAvatar
        
        backgroundImageView.image = backgroundImageAvatar
        
        nameLabel.text = avatarName
        
    }
    
    func setup(){
        // Add constraints for backgroundImageView
        backgroundImageView.contentMode = .ScaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.clipsToBounds = true
        addSubview(backgroundImageView)
        
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        let backgroundViewTop = backgroundImageView.topAnchor.constraintEqualToAnchor(self.topAnchor)
        let backgroundViewLeft = backgroundImageView.leftAnchor.constraintEqualToAnchor(self.leftAnchor)
        let backgroundViewRight = backgroundImageView.rightAnchor.constraintEqualToAnchor(self.rightAnchor)
        let backgroundViewBottom = backgroundImageView.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor)
        NSLayoutConstraint.activateConstraints([backgroundViewTop, backgroundViewLeft, backgroundViewRight, backgroundViewBottom])
        
        iconView.contentMode = .ScaleAspectFill
        iconView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconView)
        // Add constraints for imageView
        let iconViewCenterX = iconView.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor)
        let iconViewCenterY = iconView.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor,constant: 0)
        let iconViewHeight = iconView.heightAnchor.constraintEqualToAnchor(self.heightAnchor, multiplier: 0.4)
        let iconViewWidth = iconView.widthAnchor.constraintEqualToAnchor(iconView.heightAnchor)
        NSLayoutConstraint.activateConstraints([iconViewCenterX, iconViewCenterY, iconViewHeight, iconViewWidth])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = UIColor.whiteColor()
        addSubview(nameLabel)
        // Add constraints for imageView
        let nameLabelCenterX = nameLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor)
        let nameLabelTop = nameLabel.topAnchor.constraintEqualToAnchor(iconView.bottomAnchor,constant: 10)

        NSLayoutConstraint.activateConstraints([nameLabelCenterX, nameLabelTop])
        
    }

    
    override func layoutSubviews() {
        iconView.layer.cornerRadius = CGRectGetWidth(iconView.frame)/2
    }
}
