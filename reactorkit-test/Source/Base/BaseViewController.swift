//
//  BaseViewController.swift
//  reactorkit-test
//
//  Created by 김부성 on 2021/07/26.
//

import UIKit

import RxSwift
import RxCocoa

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Initializing
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Rx
    
    var disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.makeConstraints()
        // Do any additional setup after loading the view.
    }
    
    func setupLayout() {
        // layout
    }
    
    func makeConstraints() {
        // constraints
    }
    
    func setupLocalization() {
        // localization
    }

}
