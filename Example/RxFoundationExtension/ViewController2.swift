//
//  ViewController2.swift
//  RxFoundationExtension_Example
//
//  Created by 王小涛 on 2019/1/9.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxFoundationExtension

class ViewController2: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imageView: UIImageView!

    private let disposeBag = DisposeBag()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)



//            DefaultPrompt.shared.prompt(title: "haha", message: "hoho", cancelAction: "cancel", actions: ["comfirm"])
//            .do(onNext: { action in
//                print("action = \(action)")
//            }, onCompleted: {
//                print("onCompleted")
//            })
//            .bind(to: button.rx.title())
//            .disposed(by: disposeBag)

//        let a = button.rx.tap.flatMapLatest { _ in
//            //            Default
//            DefaultPrompt.shared.prompt(title: "haha", message: "hoho", cancelAction: "cancel", actions: ["comfirm"])
//            }.share()
//
//            a.debug()
//            .do(onNext: { action in
//                print("action = \(action)")
//            }, onCompleted: {
//                print("onCompleted")
//            })
//            .bind(to: button.rx.title())
//            .disposed(by: disposeBag)


                button.rx.tap
                    .flatMapLatest { [unowned self] _ in
                        return UIImagePickerController.rx.create(withParent: self) { picker in
                                picker.sourceType = .photoLibrary
                                picker.allowsEditing = false
                            }
                            .debug()
                            .flatMap { $0.rx.didFinishPickingMediaWithInfo }
                            .take(1)
                    }
                    .map {
                        return $0.1[UIImagePickerController.InfoKey.originalImage] as? UIImage
                    }
                    .bind(to: imageView.rx.image)
                    .disposed(by: disposeBag)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


