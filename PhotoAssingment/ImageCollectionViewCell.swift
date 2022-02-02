//
//  ImageCollectionViewCell.swift
//  PhotoAssingment
//
//  Created by Alexey on 2/2/22.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    static let identifier = "ImageCollectionViewCell"
    
    private let tickmark: UIImageView = {
        let image = UIImage(named: "tick")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0
        return imageView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        updateSelectedState()
        setupTickView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func configure(with urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self?.imageView.image = image
            }
        }
        .resume()
    }
    
    override var isSelected: Bool {
        didSet {
            updateSelectedState()
        }
    }
    
    
    private func updateSelectedState() {
        imageView.alpha = isSelected ? 0.7 : 1
        tickmark.alpha = isSelected ? 1 : 0
    }
    
    private func setupTickView() {
        addSubview(tickmark)
        tickmark.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -8).isActive = true
        tickmark.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -8).isActive = true
    }
    
    
}

