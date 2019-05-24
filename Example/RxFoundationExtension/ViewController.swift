//
//  ViewController.swift
//  RxFoundationExtension
//
//  Created by wangxiaotao on 01/09/2019.
//  Copyright (c) 2019 wangxiaotao. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxFoundationExtension

extension String: Error {}

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imageView: UIImageView!

    private let disposeBag = DisposeBag()

    private var i = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)

//        button.rx.tap
//            .do(onNext: { action in
//                let c = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
//                self.navigationController?.pushViewController(c, animated: true)
//                print("action = \(action)")
//            }, onCompleted: {
//                print("onCompleted")
//            })
//            .subscribe()
//            .disposed(by: disposeBag)



//        Observable<Int>.create { [unowned self] observer in
//            self.i = self.i + 1
//            if self.i < 2 {
//                observer.onError("fuck")
//            } else {
//                observer.onNext(self.i)
//            }
//            return Disposables.create()
//        }
//
        

        

//        button.rx.tap.flatMapLatest { _ in
//            //            Default
//            DefaultPrompt.shared.prompt(title: "haha", message: "hoho", cancelAction: "cancel", actions: ["comfirm"])
//            }
//            .debug()
//            .do(onNext: { action in
//                print("action = \(action)")
//            }, onCompleted: {
//                print("onCompleted")
//            })
//            .bind(to: button.rx.title())
//            .disposed(by: disposeBag)

//        button.rx.tap
//            .flatMapLatest { [weak self] _ in
//                return UIImagePickerController.rx.create(withParent: self) { picker in
//                    picker.sourceType = .photoLibrary
//                    picker.allowsEditing = false
//                    }
//                    .debug()
//                    .flatMap { $0.rx.didFinishPickingMediaWithInfo }
//                    .take(1)
//            }
//            .map {
//                return $0.1[UIImagePickerController.InfoKey.originalImage] as? UIImage
//            }
//            .bind(to: imageView.rx.image)
//            .disposed(by: disposeBag)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

