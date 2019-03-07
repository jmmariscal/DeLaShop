//
//  GalleryViewController.swift
//  DelaShop
//
//  Created by Juan M Mariscal on 5/6/18.
//  Copyright © 2018 Juan M Mariscal. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit

        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        self.addSubview(imageView)
        imageView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func updateWith(image: Image) {
        InstagramImageFetcher.shared.fetchImage(with: image.standard_resolution.url) { (data) in
            guard let data = data else { return }
            self.imageView.image = UIImage(data: data)
        }
    }
}


class GalleryViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var iData: InstagramData? {
        didSet{
            collectionView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InstagramImageFetcher.shared.getInstagramData { (iData) in
            self.iData = iData
        }
        
        assignBackground()
        
        collectionView?.backgroundColor = .clear
        collectionView?.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 150, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 80, height: 100)

        navigationItem.title = "Gallery"
        navigationController?.navigationBar.backgroundColor = .backgroundColor
        collectionView?.register(PhotoCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    func assignBackground() {
        let background = UIImage(named: "barbershop")
        
        var imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iData?.data.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? PhotoCell
        
        guard let image = iData?.data[indexPath.row].images else { return UICollectionViewCell() }
        
        cell?.updateWith(image: image)
        cell?.backgroundColor = .black
        
        return cell ?? UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? PhotoCell
        
        let image = iData?.data[indexPath.row].images
        
        cell?.updateWith(image: image!)
        cell?.frame = self.view.frame
        cell?.backgroundColor = .black
        cell?.contentMode = .scaleAspectFit
        cell?.isUserInteractionEnabled = true
        
        _ = UITapGestureRecognizer(target: self, action: #selector(dismissFullScreenImage))
        
        self.view.addSubview(cell!)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 2) / 3
        return CGSize(width: width, height: width)
    }
    
    @objc func dismissFullScreenImage(_ sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
    }
    
}
