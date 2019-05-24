//
//  RxImagePickerDelegateProxy.swift
//  Pods-RxFoundationExtension_Example
//
//  Created by 王小涛 on 2019/1/9.
//

import UIKit
import RxSwift
import RxCocoa

class RxUIImagePickerControllerDelegateProxy: DelegateProxy<UIImagePickerController, UIImagePickerControllerDelegate & UINavigationControllerDelegate>, DelegateProxyType, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    init(imagePickerController: ParentObject) {
        super.init(parentObject: imagePickerController,
                   delegateProxy: RxUIImagePickerControllerDelegateProxy.self)
    }

    static func registerKnownImplementations() {
        self.register { RxUIImagePickerControllerDelegateProxy(imagePickerController: $0) }
    }

    static func currentDelegate(for object: UIImagePickerController) -> (UIImagePickerControllerDelegate & UINavigationControllerDelegate)? {
        return object.delegate
    }

    static func setCurrentDelegate(_ delegate: (UIImagePickerControllerDelegate & UINavigationControllerDelegate)?, to object: UIImagePickerController) {
        object.delegate = delegate
    }
}
