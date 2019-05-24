//
//  ObservableType+Extension.swift
//  Pods-RxFoundationExtension_Example
//
//  Created by 王小涛 on 2019/4/15.
//

import Foundation
import RxSwift
import RxCocoa

extension ObservableType {

    func catchErrorJustComplete() -> Observable<E> {
        return catchError { _ in
            return Observable.empty()
        }
    }

    func asDriverOnErrorJustComplete() -> Driver<E> {
        return asDriver { error in
            return Driver.empty()
        }
    }

    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
}
