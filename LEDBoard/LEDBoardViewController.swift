//
//  BoardViewController.swift
//  LEDBoard
//
//  Created by 이중원 on 2022/07/06.
//

import UIKit

class LEDBoardViewController: UIViewController {
    
    //userTextField 프로퍼티
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textColorButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet var buttonList: [UIButton]!
    
    @IBOutlet weak var topView: UIView!
    
    
    //viewDidLoad 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designTextField()
        designButton(sendButton, buttonTitle: "전송", HighlightedTitle: "빨리보내!", .yellow)
        designButton(textColorButton, buttonTitle: "텍스트변경", HighlightedTitle: "바꾸는중..", .white)
    }
    
    
    func designTextField() {
        userTextField!.placeholder = "내용을 작성해주세요"
        userTextField!.text = "안녕하세요"
        userTextField!.keyboardType = .emailAddress
        userTextField.font = .systemFont(ofSize: 15)
        userTextField.borderStyle = .none
        userTextField.textColor = .blue
    }
    
    // buttonOutletVariableName: 외부 매개변수, Argument Label -> 생략 가능
    // buttonName: 내부 매개변수, Parameter Name
    // _ : 와일드 카드 식별자
    func designButton(_ buttonName: UIButton, buttonTitle: String, HighlightedTitle: String, _ bgColor: UIColor) {
        buttonName.setTitle(buttonTitle, for: .normal)
        buttonName.setTitle(HighlightedTitle, for: .highlighted)
        buttonName.backgroundColor = bgColor
        buttonName.layer.cornerRadius = 8
        buttonName.layer.borderColor = UIColor.black.cgColor
        buttonName.layer.borderWidth = 3
        buttonName.setTitleColor(.red, for: .normal)
        buttonName.setTitleColor(.blue, for: .highlighted)
    }
    
    func studyOutletCollection() {
        //1. 반복문
        let buttonArray: [UIButton] = [sendButton, textColorButton]
        
        for button in buttonArray {
            button.backgroundColor = .blue
            button.layer.cornerRadius = 2
        }
        
        //2. 아웃렛 컬렉션
        for button in buttonList {
            button.backgroundColor = .white
            button.layer.cornerRadius = 5
        }
    }
    
    
    @IBAction func sendButtonClicked(_ sender: UIButton) {
        
        resultLabel.text = userTextField.text
        
    }
    
    @IBAction func textChangeButtonClicked(_ sender: Any) {
        
        
        
    }
    
    
    @IBAction func returnKeyClicked(_ sender: Any) {
        
        if(view.endEditing(false)){
            view.endEditing(true)
        }
    
    }
    
    
    //연결관계를 다 끊어보고 Any로 연결하기
    @IBAction func keyboardDismiss(_ sender: Any) {
        
        view.endEditing(true)
        
    }
    
    @IBAction func isHiddenTapGesture(_ sender: Any) {
        
        if topView.isHidden == false {
            topView.isHidden = true
        } else {
            topView.isHidden = false
        }
        
    }
}
