//
//  UIImagePickerController+RxCreate.swift
//  Pods-RxFoundationExtension_Example
//
//  Created by 王小涛 on 2019/1/9.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIImagePickerController {

    public static func create(withParent parent: UIViewController?, animated: Bool = true, configure: @escaping (UIImagePickerController) throws -> Void = { _ in }) -> Observable<UIImagePickerController> {

        return Observable.create { [weak parent] observer in
            let controller = UIImagePickerController()

            let dismissDisposable = controller.rx
                .didCancel
                .subscribe(onNext: { picker in
                    observer.onCompleted()
                })

            do {
                try configure(controller)
            }
            catch let error {
                observer.onError(error)
                return Disposables.create()
            }

            guard let parent = parent else {
                observer.onCompleted()
                return Disposables.create()
            }

            RxFoundationExtension.present(viewController: controller, parent: parent, animated: true)
            observer.onNext(controller)

            return Disposables.create(dismissDisposable, Disposables.create {
                dismiss(viewController: controller, animated: animated)
            })
        }
    }
}
