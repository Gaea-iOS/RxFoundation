//
//  UIImagePickerController+Rx.swift
//  Pods-RxFoundationExtension_Example
//
//  Created by 王小涛 on 2019/1/9.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIImagePickerController {

    var pickerDelegate: DelegateProxy<UIImagePickerController, UIImagePickerControllerDelegate & UINavigationControllerDelegate> {
        return RxUIImagePickerControllerDelegateProxy.proxy(for: base)
    }

    public var didCancel: Observable<UIImagePickerController> {
        return pickerDelegate
            .methodInvoked(#selector(UIImagePickerControllerDelegate.imagePickerControllerDidCancel(_:)))
            .map { try castOrThrow(UIImagePickerController.self, $0[0]) }
    }

    public var didFinishPickingMediaWithInfo: Observable<(UIImagePickerController, [UIImagePickerController.InfoKey : Any])> {
        return pickerDelegate
            .methodInvoked(#selector(UIImagePickerControllerDelegate.imagePickerController(_:didFinishPickingMediaWithInfo:)))
            .map {
                let picker = try castOrThrow(UIImagePickerController.self, $0[0])
                let info = try castOrThrow([UIImagePickerController.InfoKey : Any].self, $0[1])
                return (picker, info)
        }
    }
}

fileprivate func castOrThrow<T>(_ resultType: T.Type, _ object: Any) throws -> T {
    guard let returnValue = object as? T else {
        throw RxCocoaError.castingError(object: object, targetType: resultType)
    }
    return returnValue
}
