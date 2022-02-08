//
//  ProfileView.swift
//  Navigation
//
//  Created by insomnia on 08.02.2022.
//

import UIKit

class ProfileView: UIView {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var portraitView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    private func commonInit() {
        let bundle = Bundle.init(for: ProfileView.self)
        if let viewToAdd = bundle.loadNibNamed("ProfileView", owner: self, options: nil), let contentView = viewToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        }
    }
}
