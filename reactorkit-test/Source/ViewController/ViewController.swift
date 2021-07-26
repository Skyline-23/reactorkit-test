//
//  ViewController.swift
//  reactorkit-test
//
//  Created by 김부성 on 2021/07/25.
//

import UIKit

import ReactorKit

class ViewController: BaseViewController, View {
    
    typealias Reactor = ViewControllerReactor
    
    // MARK: - UI
    let increaseButton = UIButton().then {
        $0.setTitle("+", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
    }
    
    let decreaseButton = UIButton().then {
        $0.setTitle("-", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
    }
    
    let label = UILabel().then {
        $0.text = "0"
        $0.textAlignment = .center
    }
    
    // MARK: - Initializing
    init(reactor: Reactor) {
        defer { self.reactor = reactor }
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func setupLayout() {
        self.view.addSubview(increaseButton)
        self.view.addSubview(decreaseButton)
        self.view.addSubview(label)
    }
    
    override func makeConstraints() {
        self.label.snp.makeConstraints {
            $0.center.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        self.increaseButton.snp.makeConstraints {
            $0.centerY.equalTo(self.view.safeAreaLayoutGuide)
            $0.right.equalTo(self.view.safeAreaLayoutGuide).offset(-32)
        }
        
        self.decreaseButton.snp.makeConstraints {
            $0.centerY.equalTo(self.view.safeAreaLayoutGuide)
            $0.left.equalTo(self.view.safeAreaLayoutGuide).offset(32)
        }
        
        
    }

    func bind(reactor: ViewControllerReactor) {
        
        // MARK: - Action
        self.increaseButton.rx.tap
            .map { Reactor.Action.increase }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        self.decreaseButton.rx.tap
            .map { Reactor.Action.decrease }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        // MARK: - State
        reactor.state
            .map { $0.value }
            .distinctUntilChanged()
            .map { "\($0)" }
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state
            .map { $0.isLoading }
            .distinctUntilChanged()
            .bind(to: self.activityIndicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
    }

}

