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
  
  lazy var firstBackgroundLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "출발 장소와"
    label.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 28.0)
    label.textColor = UIColor.white
    label.alpha = 0.0
    return label
  }()
  
  lazy var secondBackgroundLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "시간을 선택하세요."
    label.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 28.0)
    label.textColor = UIColor.white
    label.alpha = 0.0
    return label
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
    stackView.alpha = 0.0
    stackView.isHidden = true
    
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
    view.alpha = 0.0
    view.isHidden = true
    return view
  }()
  
  
  lazy var nextButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("다음", for: .normal)
    button.setTitleColor(UIColor.white, for: .normal)
    button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 16.0)
    button.backgroundColor = UIColor(displayP3Red: 175/255.0, green: 170/255.0, blue: 226/255.0, alpha: 1)
    button.alpha = 0.0
    button.isHidden = true
    return button
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
  
  
  
  
  func showTimeSelection() {
    
    reactingBGView.snp.remakeConstraints { make in
      make.height.equalTo(380)
      make.bottom.leading.trailing.equalToSuperview()
    }
    
    UIView.animate(withDuration: 0.3) {
      self.timePickerStackView.isHidden = false
      self.timePickerStackView.alpha = 1.0
      self.timeWrapView.isHidden = false
      self.timeWrapView.alpha = 1.0
      self.nextButton.isHidden = false
      self.nextButton.alpha = 1.0

      self.view.layoutIfNeeded()
    } completion: { done in
      UIView.animate(withDuration: 0.3) {
        self.firstBackgroundLabel.alpha = 1.0
        self.secondBackgroundLabel.alpha = 1.0
        self.view.layoutIfNeeded()
      }
    }
  }
  
  func hideTimeSelection() {

    reactingBGView.snp.remakeConstraints { make in
      make.top.equalToSuperview().offset(50)
      make.bottom.leading.trailing.equalToSuperview()
    }
    
    
    UIView.animate(withDuration: 0.3) {
      self.timePickerStackView.alpha = 0.0
      self.timeWrapView.alpha = 0.0
      self.nextButton.alpha = 0.0
      self.firstBackgroundLabel.alpha = 0.0
      self.secondBackgroundLabel.alpha = 0.0
      self.view.layoutIfNeeded()
    } completion: { done in
      self.timePickerStackView.isHidden = true
      self.timeWrapView.isHidden = true
      self.nextButton.isHidden = true

    }
    

  }
  
  
  
  // MARK: - Delegates
  
  func setDelegates() {
    
    searchTextField.delegate = self
    
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
    view.addSubview(firstBackgroundLabel)
    view.addSubview(secondBackgroundLabel)
    
    // reactingBGView
    reactingBGView.addSubview(backButton)
    reactingBGView.addSubview(searchTextField)
    reactingBGView.addSubview(timePickerStackView)
    reactingBGView.addSubview(timeWrapView)
    reactingBGView.addSubview(nextButton)
    
    
    // View order
    view.bringSubviewToFront(reactingBGView)
    reactingBGView.bringSubviewToFront(timePickerStackView)
  }
  
  
  func setAppearance() {
    // MARK: - ReactingBGView
    
    reactingBGView.layer.cornerRadius = 25
    timeWrapView.layer.cornerRadius = 15
    nextButton.layer.cornerRadius = 10
    
    
    
  }
  
  func setConstraints() {
    backgroundImgView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    secondBackgroundLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(20)
      make.bottom.equalTo(reactingBGView.snp.top).offset(-20)
    }
    
    firstBackgroundLabel.snp.makeConstraints { make in
      make.leading.equalTo(secondBackgroundLabel)
      make.bottom.equalTo(secondBackgroundLabel.snp.top)
    }
    
    reactingBGView.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(50)
      make.bottom.leading.trailing.equalToSuperview()
    }
    
    cornerBGView.snp.makeConstraints { make in
      make.height.equalTo(100)
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
      make.width.equalTo(60)
    }
    
    minPickerView.snp.makeConstraints { make in
      make.width.equalTo(60)
    }
    
    ampmPickerView.snp.makeConstraints { make in
      make.width.equalTo(50)
    }
    
    timePickerStackView.addArrangedSubview(ampmPickerView)
    timePickerStackView.addArrangedSubview(hourPickerView)
    timePickerStackView.addArrangedSubview(timeDividerLabel)
    timePickerStackView.addArrangedSubview(minPickerView)
    timePickerStackView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(searchTextField.snp.bottom).offset(20)
    }
    
    timeWrapView.snp.makeConstraints { make in
      make.centerX.centerY.equalTo(timePickerStackView)
      make.height.equalTo(60)
      make.width.equalTo(220)
    }
    
    nextButton.snp.makeConstraints { make in
      make.width.equalTo(85)
      make.height.equalTo(45)
      make.top.equalTo(timePickerStackView.snp.bottom).offset(20)
      make.trailing.equalToSuperview().inset(20)
    }
    
    
  }
  
}


extension SearchViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    showTimeSelection()
    return true
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    hideTimeSelection()
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
      let view = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
      let label = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
      if pickerView.tag == 0 {
        label.text = hours[row]
        label.font = UIFont.systemFont(ofSize: 34, weight: .thin)
      } else {
        label.text = mins[row]
        label.font = UIFont.systemFont(ofSize: 34, weight: .thin)
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
