//
//  BaseViewController.swift
//  reactorkit-test
//
//  Created by 김부성 on 2021/07/26.
//

import UIKit

import RxSwift
import RxCocoa
import Then
import SnapKit

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    let activityIndicatorView = UIActivityIndicatorView(style: .large).then {
        $0.color = .systemBlue
    }
    
    // MARK: - Initializing
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        activityIndicatorView.stopAnimating()
    }
    
    // MARK: - Rx
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.makeConstraints()
        
        view.backgroundColor = .systemBackground
        
        self.view.addSubview(self.activityIndicatorView)
        
        self.activityIndicatorView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
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
