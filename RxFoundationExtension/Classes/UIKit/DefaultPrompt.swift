//
//  DefaultPrompt.swift
//  Pods-RxFoundationExtension_Example
//
//  Created by 王小涛 on 2019/1/10.
//

import UIKit
import RxSwift
import RxCocoa

public class DefaultPrompt: Promptable {
    public static let shared = DefaultPrompt()
    private init() {}

    public func prompt<Action: CustomStringConvertible>(title: String?, message: String?, cancelAction: Action, actions: [Action]) -> Observable<Action> {

        return Observable.create { observer in
            let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)

            controller.addAction(UIAlertAction(title: cancelAction.description, style: .cancel, handler: {_ in
                observer.onNext(cancelAction)
            }))

            actions
                .map { action in
                    UIAlertAction(title: action.description, style: .default, handler: { _ in
                        observer.onNext(action)
                    })
                }.forEach {
                    controller.addAction($0)
            }

            guard let parent = UIApplication.shared.keyWindow?.rootViewController else {
                observer.onCompleted()
                return Disposables.create()
            }

            present(viewController: controller, parent: parent, animated: true)

            return Disposables.create {
                dismiss(viewController: controller, animated: true)
            }
        }
    }
}

