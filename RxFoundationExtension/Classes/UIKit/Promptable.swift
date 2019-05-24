//
//  UIAlertController+RxCreate.swift
//  Pods-RxFoundationExtension_Example
//
//  Created by 王小涛 on 2019/1/9.
//

import Foundation
import RxSwift

public protocol Promptable {
    func prompt<Action: CustomStringConvertible>(title: String?, message: String?, cancelAction: Action, actions: [Action]) -> Observable<Action>
}

