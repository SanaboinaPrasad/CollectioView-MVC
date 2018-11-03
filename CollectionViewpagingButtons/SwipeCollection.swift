//
//  SwipeCollection.swift
//  SwipeCollectioView
//
//  Created by Sriram Prasad on 02/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//


import UIKit
class SWipeController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    
    let cellId = "Cell"
//    let headerSection = ["Hiiii","let meet","have some Coffe","what next","thanks"]
    let pages = [
        Page(imageName: "s2", headertext: "let meet bro have a nice time on Monday",bodyText:" override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> 1"),
        Page(imageName: "s1", headertext: "let meet bro have a nice time on Tuesday",bodyText:" override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> 2 "),
        Page(imageName: "s3", headertext: "let meet bro have a nice time on Thursday",bodyText:" override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> 3 "),
        Page(imageName: "s1", headertext: "let meet bro have a nice timeon saturday",bodyText:" override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> 4 "),
        Page(imageName: "s4", headertext: "let meet bro have a nice time Sunday",bodyText:" override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> 5 "),

    
    ]
    
    
    override  func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.backgroundColor = .green
        collectionView.isPagingEnabled = true
        collectionView.register(SwipeCell.self, forCellWithReuseIdentifier: cellId)
        
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:cellId , for: indexPath) as! SwipeCell
        let page = pages[indexPath.row]
        cell.page = page
//        cell.imageView.image = UIImage(named:page.imageName)
//        cell.descriptionTextView.text = page.headertext
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}











class SwipeCell: UICollectionViewCell {
    
    let topCantainerView = UIView()
    var imageView = UIImageView()
    var page: Page? {
        didSet {
            guard let unWrapped = page else { return }
    imageView.image = UIImage(named: unWrapped.imageName)
            let attributedText = NSMutableAttributedString(string: unWrapped.headertext , attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: "\n\n\n\(unWrapped.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            descriptionTextView.attributedText = attributedText
        }
    }
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
//       textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.font = .boldSystemFont(ofSize: 20)
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView .textAlignment = .center

        return textView
    }()
//    let label : UITextView = {
//        label.text = "Lets do Something Dude"
//        label.textAlignment = .center
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.isScrollEnabled = false
//        label.isEditable = false
//
//        let yourAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.black, .font: UIFont.boldSystemFont(ofSize: 25)]
//        let yourOtherAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 14)]
//        let partOne = NSMutableAttributedString(string: "This is an example ", attributes: yourAttributes)
//        let partTwo = NSMutableAttributedString(string: "\n\n\nfor the combination of Attributed String!", attributes: yourOtherAttributes)
//        partOne.append(partTwo)
//        label.attributedText = partOne
//        label.textAlignment = .center
//
//    }()
//
    private let pageControl = UIPageControl()
    private let nextButton = UIButton(type:.system)
    private let prevButton = UIButton(type:.system)
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        placeBottonControls()

        backgroundColor = .purple
    }
    
    
    
    
    func  setupViews(){
    
//    topCantainerView.backgroundColor = .blue
    topCantainerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topCantainerView)
    topCantainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    topCantainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    topCantainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    topCantainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
    //placing imageView on ContainerView
//    imageView.image = UIImage(named: "green")
    imageView.contentMode = .scaleAspectFit
    imageView.layer.cornerRadius = 100
    imageView.clipsToBounds = true
    topCantainerView.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints  = false
    imageView.centerYAnchor.constraint(equalTo: topCantainerView.centerYAnchor).isActive = true
    imageView.centerXAnchor.constraint(equalTo: topCantainerView.centerXAnchor).isActive = true
    imageView.heightAnchor.constraint(equalTo: topCantainerView.heightAnchor, multiplier: 0.5).isActive = true
    
    
    
    //    plaing desciption text
   
        addSubview(descriptionTextView)
    descriptionTextView.topAnchor.constraint(equalTo: topCantainerView.bottomAnchor).isActive = true
    descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10).isActive = true
    descriptionTextView.bottomAnchor.constraint(equalTo:bottomAnchor,constant: 10 ).isActive = true
    }
    
    
    
    fileprivate func placeBottonControls(){
        
        prevButton.backgroundColor = .clear
        addSubview(prevButton)
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        prevButton.setTitle("Prev", for: .normal)
        prevButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        prevButton.setTitleColor(.red, for: .normal)
        
        
        
        nextButton.backgroundColor = .clear
        addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        nextButton.setTitle("Next", for: .normal)
        
        
        
        let greenView = UIView()
        greenView.backgroundColor = .mainColour

        pageControl.currentPage  = 0
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.numberOfPages = 4
        pageControl.pageIndicatorTintColor = .red
        
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [prevButton,nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.axis = .horizontal
        bottomControlsStackView.distribution = .fillEqually
        addSubview(bottomControlsStackView)
        
        
        
        NSLayoutConstraint.activate([
            
            bottomControlsStackView.bottomAnchor.constraint(equalTo:safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            
            
            ])
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
