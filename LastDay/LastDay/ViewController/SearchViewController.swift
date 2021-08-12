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
  
  lazy var reactingBGView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.white
    return view
  }()
  
  lazy var cornerBGView: UIView = {
    let view = UIView()
    return view
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
    view.addSubview(reactingBGView)
    view.addSubview(cornerBGView)
  }
  
  
  func setAppearance() {
    // MARK: - ReactingBGView
    
    reactingBGView.layer.cornerRadius = 15
    
    
  }
  
  func setConstraints() {
    backgroundImgView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    reactingBGView.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(50)
      make.bottom.leading.trailing.equalToSuperview()
    }
  }
  
}
