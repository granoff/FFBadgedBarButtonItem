// FFBadgedBarButtonItem.swift
//
// Created by Mark Granoff 2/22/14
// Ported to Swift by Mark Granoff 2/23/25
// Copyright (c) 2014 Hark iMedia. All rights reserved.
//

import Foundation
import UIKit

@objcMembers
public class FFBadgedBarButtonItem: UIBarButtonItem {

    private var _badge: String?
    public var badge: String? {
        get {
            badgeLabel.isHidden ? nil : _badge
        }
        set {
            if let newValue, newValue.count > 0 {
                badgeLabel.text = newValue
                _badge = newValue
                let newSize = badgeLabel.sizeThatFits(.init(width: buttonView.frame.size.width, height: 14))
                var frame = badgeLabel.frame
                frame.origin.x = min(buttonView.frame.size.width - 14, max(0, buttonView.frame.size.width - newSize.width))
                frame.size.width = max(14, newSize.width)
                badgeLabel.frame = frame
                badgeLabel.isHidden = false
                buttonView.setNeedsDisplay()
            } else {
                badgeLabel.isHidden = true
            }
        }
    }

    private var buttonView: UIView
    private var badgeLabel: UILabel

    @objc(initWithImage:target:action:)
    init(with image: UIImage, target: Any, action: Selector) {
        let imageView = UIImageView(image: image)
        imageView.frame = .init(x: 0, y: 7, width: image.size.width, height: image.size.height)

        let v = UIView(frame: .init(x: 0, y: 0, width: image.size.width+7, height: image.size.height+7))
        v.addSubview(imageView)

        let label = UILabel(frame: .init(x: v.frame.size.width - 14, y: 0, width: 14, height: 14))
        label.backgroundColor = .red
        label.layer.cornerRadius = 7
        label.layer.masksToBounds = true
        label.isUserInteractionEnabled = false
        label.font = UIFont(name: "HelveticaNeue", size: 10)
        label.textColor = .white
        label.textAlignment = .center
        label.text = nil
        label.isHidden = true

        v.addSubview(label)
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.numberOfTapsRequired = 1
        v.addGestureRecognizer(tap)

        self.buttonView = v
        self.badgeLabel = label

        super.init()
        customView = v
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
