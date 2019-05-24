//
//  dismissViewController.swift
//  Pods-RxFoundationExtension_Example
//
//  Created by 王小涛 on 2019/1/9.
//

import UIKit

public func dismiss(viewController: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
    if viewController.isBeingDismissed || viewController.isBeingPresented {
        DispatchQueue.main.async {
            dismiss(viewController: viewController, animated: animated, completion: completion)
        }
        return
    }
    if let _ = viewController.presentingViewController {
        viewController.dismiss(animated: animated, completion: completion)
    }
}

public func present(viewController: UIViewController, parent: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
    if viewController.isBeingDismissed || viewController.isBeingPresented {
        DispatchQueue.main.async {
            present(viewController: viewController, parent: parent, animated: animated)
        }
    }
    if parent.presentedViewController == nil {
        parent.present(viewController, animated: animated, completion: completion)
    }
}
