//
//  LoginViewModel.swift
//  Pods-RxFoundationExtension_Example
//
//  Created by 王小涛 on 2019/4/18.
//

import Foundation

protocol Validator {
    func validate() -> Bool
}


class PhoneValidator: Validator {

    private let phone: String

    init(phone: String) {
        self.phone = phone
    }

    func validate() -> Bool {
        if phone.isEmpty {
            return false
        }
        return true
    }
}

import RxSwift

protocol ObservableConvertible {
    func toObservable() -> Observable<Self>
}

extension ObservableConvertible {
    func toObservable() -> Observable<Self> {
        return Observable.just(self)
    }
}
