//
//  HomeViewController.swift
//  LastDay
//
//  Created by Jinwook Huh on 2021/08/11.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
  
  // MARK: - Views
  
  lazy var greetingMessageLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "안녕하세요, 악어님"
    label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16.0)
    label.textColor = UIColor.black
    return label
  }()
  
  lazy var lastColorMessageLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "마지막 "
    label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 22.0)
    label.textColor = UIColor(displayP3Red: 175/255.0, green: 170/255.0, blue: 226/255.0, alpha: 1)
    return label
  }()
  
  lazy var largeGreetingMessageLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "여행지를"
    label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 22.0)
    label.textColor = UIColor.black
    return label
  }()
  
  lazy var secondGreetingMessageLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "함께 찾아보세요!"
    label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 22.0)
    label.textColor = UIColor.black
    return label
  }()
  
  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    addViews()
    setConstraints()
  }
  
  
  
  // MARK: - Appearance, Constraints
  
  func addViews() {
    view.addSubview(greetingMessageLabel)
    view.addSubview(lastColorMessageLabel)
    view.addSubview(largeGreetingMessageLabel)
    view.addSubview(secondGreetingMessageLabel)

  }
  
  
  func setConstraints() {
    greetingMessageLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(80)
      make.leading.equalToSuperview().offset(20)
    }
    
    lastColorMessageLabel.snp.makeConstraints { make in
      make.top.equalTo(greetingMessageLabel.snp.bottom).offset(20)
      make.leading.equalTo(greetingMessageLabel)
    }
    
    largeGreetingMessageLabel.snp.makeConstraints { make in
      make.centerY.equalTo(lastColorMessageLabel)
      make.leading.equalTo(lastColorMessageLabel.snp.trailing)
    }
    
    secondGreetingMessageLabel.snp.makeConstraints { make in
      make.top.equalTo(lastColorMessageLabel.snp.bottom).offset(2)
      make.leading.equalTo(lastColorMessageLabel)
    }
    
  }
  
}
