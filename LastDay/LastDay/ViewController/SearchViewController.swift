//
//  SearchViewController.swift
//  LastDay
//
//  Created by Jinwook Huh on 2021/08/11.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
  
  // MARK: - Views
  
  lazy var backgroundImgView: UIImageView = {
    let imgView = UIImageView()
    imgView.image = UIImage(named: "search_background")
    imgView.contentMode = .scaleAspectFill
    return imgView
  }()
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    addViews()
    setConstraints()
    setAppearance()
  }
  
  
  // MARK: - Appearance, Constraints
  
  func addViews() {
    view.addSubview(backgroundImgView)
  }
  
  
  func setAppearance() {
    
  }
  
  func setConstraints() {
    backgroundImgView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
}
