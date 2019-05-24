//
//  UIApplication+Rx.swift
//  RxAppState
//
//  Created by 王小涛 on 2019/5/17.
//

import RxSwift
import RxCocoa

extension RxSwift.Reactive where Base: UIApplication {

    /**
     Reactive wrapper for `delegate`.

     For more information take a look at `DelegateProxyType` protocol documentation.
     */
    public var delegate: DelegateProxy<UIApplication, UIApplicationDelegate> {
        return RxApplicationDelegateProxy.proxy(for: base)
    }

    public var applicationDidBecomeActive: Observable<()> {
        return delegate
            .methodInvoked(#selector(UIApplicationDelegate.applicationDidBecomeActive(_:)))
            .map { _ in () }
    }

    public var applicationWillResignActive: Observable<()> {
        return delegate
            .methodInvoked(#selector(UIApplicationDelegate.applicationWillResignActive(_:)))
            .map { _ in () }
    }


    public var applicationWillTerminate: Observable<()> {
        return delegate
            .methodInvoked(#selector(UIApplicationDelegate.applicationWillTerminate(_:)))
            .map { _ in () }
    }

    public var applicationWillEnterForeground: Observable<()> {
        return delegate
            .methodInvoked(#selector(UIApplicationDelegate.applicationWillEnterForeground(_:)))
            .map { _ in () }
    }

    public var applicationDidEnterBackground: Observable<()> {
        return delegate
            .methodInvoked(#selector(UIApplicationDelegate.applicationDidEnterBackground(_:)))
            .map { _ in () }
    }
}

