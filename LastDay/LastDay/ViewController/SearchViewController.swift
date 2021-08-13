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
    view.backgroundColor = UIColor.white
    return view
  }()
  
  
  lazy var backButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
    button.tintColor = UIColor.black
    button.addTarget(self, action: #selector(goToMain), for: .touchUpInside)
    return button
  }()
  
  lazy var searchTextField: UITextField = {
    let textfield = UITextField()
    textfield.translatesAutoresizingMaskIntoConstraints = false
    textfield.attributedPlaceholder = NSAttributedString(
      string: "어디로 여행가세요?",
      attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray2])
    textfield.tintColor = UIColor.black
    textfield.textColor = .black
//    textfield.font = UIFont(name: "GmarketSansTTFMedium", size: 16.0)
    textfield.isEnabled = true
    textfield.autocapitalizationType = .none
    textfield.autocorrectionType = .no
    textfield.keyboardType = .default
    textfield.returnKeyType = .next
    
    return textfield
  }()
  
  lazy var timePickerStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.alignment = .center
    stackView.axis = .horizontal
    stackView.spacing = 0
    
    return stackView
  }()
  
  
  
  lazy var hourPickerView: UIPickerView = {
    let pickerView = UIPickerView()
    pickerView.tag = 0
    return pickerView
  }()
  
  lazy var minPickerView: UIPickerView = {
    let pickerView = UIPickerView()
    pickerView.tag = 1
    return pickerView
  }()
  
  
  lazy var ampmPickerView: UIPickerView = {
    let pickerView = UIPickerView()
    pickerView.tag = 2
    return pickerView
  }()
  
  lazy var timeDividerLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = ":"
    label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 22.0)
    label.textColor = UIColor.black
    label.textAlignment = .center
    return label
  }()
  
  
  lazy var timeWrapView: UIView = {
    let view = UIView()
    view.layer.borderWidth = 2
    view.layer.borderColor = UIColor(displayP3Red: 175/255.0, green: 170/255.0, blue: 226/255.0, alpha: 1).cgColor
    return view
  }()
  
  // MARK: - Variables
  
  let hours = TimeDataModel.getHours()
  let mins = TimeDataModel.getMins()
  let ampm = TimeDataModel.getAMPM()
  
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    addViews()
    setConstraints()
    setAppearance()
    setDelegates()
  }
  
  
  
  // MARK: - Target Functions
  
  @objc func goToMain() {
    dismiss(animated: true, completion: nil)
  }
  
  // MARK: - Delegates
  
  func setDelegates() {
    hourPickerView.delegate = self
    hourPickerView.dataSource = self
    minPickerView.delegate = self
    minPickerView.dataSource = self
    ampmPickerView.delegate = self
    ampmPickerView.dataSource = self
  }
  
  // MARK: - Appearance, Constraints
  
  func addViews() {
    view.addSubview(backgroundImgView)
    view.addSubview(cornerBGView)
    view.addSubview(reactingBGView)
    
    // reactingBGView
    reactingBGView.addSubview(backButton)
    reactingBGView.addSubview(searchTextField)
    reactingBGView.addSubview(timePickerStackView)
    reactingBGView.addSubview(timeWrapView)
    
    // View order
    view.bringSubviewToFront(reactingBGView)
    reactingBGView.bringSubviewToFront(timeWrapView)
  }
  
  
  func setAppearance() {
    // MARK: - ReactingBGView
    
    reactingBGView.layer.cornerRadius = 25
    timeWrapView.layer.cornerRadius = 15
    
    
  }
  
  func setConstraints() {
    backgroundImgView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    reactingBGView.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(50)
      make.bottom.leading.trailing.equalToSuperview()
    }
    
    cornerBGView.snp.makeConstraints { make in
      make.height.equalTo(view.bounds.height/2)
      make.bottom.leading.trailing.equalToSuperview()
    }
    
    backButton.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(20)
      make.top.equalToSuperview().offset(25)
      make.height.width.equalTo(25)
    }
    
    searchTextField.snp.makeConstraints { make in
      make.centerY.equalTo(backButton)
      make.leading.equalTo(backButton.snp.trailing).offset(10)
      make.trailing.equalToSuperview().inset(20)
      
    }
    
    hourPickerView.snp.makeConstraints { make in
      make.width.equalTo(65)
    }
    
    minPickerView.snp.makeConstraints { make in
      make.width.equalTo(65)
    }
    
    ampmPickerView.snp.makeConstraints { make in
      make.width.equalTo(60)
    }
    
    timePickerStackView.addArrangedSubview(ampmPickerView)
    timePickerStackView.addArrangedSubview(hourPickerView)
    timePickerStackView.addArrangedSubview(timeDividerLabel)
    timePickerStackView.addArrangedSubview(minPickerView)
    timePickerStackView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(searchTextField.snp.bottom).offset(40)
    }
    
    timeWrapView.snp.makeConstraints { make in
      make.centerX.centerY.equalTo(timePickerStackView)
      make.height.equalTo(60)
      make.width.equalTo(220)
    }
    
    
    
    
  }
  
}

extension SearchViewController: UIPickerViewDelegate {
//  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//    if pickerView.tag == 0 {
//      return hours[row]
//    } else {
//      return mins[row]
//    }
//  }
  
  func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
    if pickerView.tag == 2 {
      return 60
    } else {
      return 60
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

    pickerView.subviews.forEach {
      $0.backgroundColor = .clear
    }
    
    if pickerView.tag == 2 {
      let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 60))
      let label = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 60))
      
      label.text = ampm[row]
      label.font = UIFont.systemFont(ofSize: 20, weight: .thin)
      label.textAlignment = .center
      view.addSubview(label)
      label.snp.makeConstraints { make in
        make.centerX.centerY.equalToSuperview()
      }
      
      return view
      
    } else {
      let view = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 60))
      let label = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 60))
      if pickerView.tag == 0 {
        label.text = hours[row]
        label.font = UIFont.systemFont(ofSize: 42, weight: .thin)
      } else {
        label.text = mins[row]
        label.font = UIFont.systemFont(ofSize: 42, weight: .thin)
      }
      label.textAlignment = .center
      view.addSubview(label)
      label.snp.makeConstraints { make in
        make.centerX.centerY.equalToSuperview()
      }
      
      return view
    }
  }
}

extension SearchViewController: UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if pickerView.tag == 0 {
      return hours.count
    } else if pickerView.tag == 1 {
      return mins.count
    } else {
      return ampm.count
    }
  }
}
