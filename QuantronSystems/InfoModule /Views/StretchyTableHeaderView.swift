//
//  StretchyTableHeaderView.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 25.08.2022.
//

import UIKit

final class StretchyTableHeaderView: UIView {
    public let cachedImageView: CachedImageView = {
        let cachedImageView = CachedImageView()
        cachedImageView.clipsToBounds = true
        cachedImageView.contentMode = .scaleAspectFit
        cachedImageView.backgroundColor = #colorLiteral(red: 0.9180000627, green: 0.9180000627, blue: 0.9180000627, alpha: 1)
        return cachedImageView
    }()
    
    private var containerView = UIView()
    private var imageViewHeight = NSLayoutConstraint()
    private var imageViewBottom = NSLayoutConstraint()
    private var containerViewHeight = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func createViews() {
        self.addSubview(containerView)
        containerView.addSubview(cachedImageView)
    }
    
    private func addConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            self.heightAnchor.constraint(equalTo: containerView.heightAnchor),
            self.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        ])
        
        containerViewHeight = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        imageViewBottom = cachedImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        imageViewHeight = cachedImageView.heightAnchor.constraint(equalTo: self.heightAnchor)
        
        cachedImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalTo: cachedImageView.widthAnchor),
            containerViewHeight,
            imageViewHeight,
            imageViewBottom
        ])
    }
    
    public func scrollViewDidScroll(scrollView: UIScrollView, onTopHandler: ((Bool) -> Void)?) {
        containerViewHeight.constant = scrollView.contentInset.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0
        imageViewBottom.constant = (offsetY >= 0) ? 0 : (-offsetY / 2)
        imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, offsetY / 6 + scrollView.contentInset.top)
        
        if offsetY + frame.height <= 0 {
            onTopHandler?(true)
        } else {
            onTopHandler?(false)
        }
    }
}
