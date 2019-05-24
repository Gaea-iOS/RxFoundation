//
//  UIViewController+Rx.swift
//  RxAppState
//
//  Created by 王小涛 on 2019/5/20.
//

import RxSwift
import RxCocoa

extension RxSwift.Reactive where Base: UIViewController {

    public var viewDidLoad: Observable<Void> {
        return methodInvoked(#selector(UIViewController.viewDidLoad))
            .map { _ in return }
    }

    public var viewDidLayoutSubviews: Observable<Void> {
        return methodInvoked(#selector(UIViewController.viewDidLayoutSubviews))
            .map { _ in return }
    }

    public var viewWillAppear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewWillAppear))
            .map { $0.first as? Bool ?? false }
    }

    public var viewDidAppear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewDidAppear))
            .map { $0.first as? Bool ?? false }
    }

    public var viewWillDisappear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewWillDisappear))
            .map { $0.first as? Bool ?? false }
    }

    public var viewDidDisappear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewDidDisappear))
            .map { $0.first as? Bool ?? false }
    }
}
