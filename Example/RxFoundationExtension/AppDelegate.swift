//
//  AppDelegate.swift
//  RxFoundationExtension
//
//  Created by wangxiaotao on 01/09/2019.
//  Copyright (c) 2019 wangxiaotao. All rights reserved.
//

import UIKit
import RxFoundationExtension
import RxSwift
import RxCocoa

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private let subject = PublishSubject<Int>()

    private let disposeBag = DisposeBag()

    private let lock = NSRecursiveLock()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        RxImagePickerDelegateProxy.register { RxImagePickerDelegateProxy(imagePicker: $0) }

//        RxUIImagePickerControllerDelegateProxy.register { RxUIImagePickerControllerDelegateProxy(imagePickerController: $0)
//        }

//        Observable<Int>.interval(1, scheduler: MainScheduler.instance)
//            .bind(to: subject)
//            .disposed(by: disposeBag)
//
//        Observable<Int>.interval(2, scheduler: MainScheduler.instance)
//            .bind(to: subject)
//            .disposed(by: disposeBag)
//
//        subject
//            .subscribe(onNext: {
//                print($0)
//            })
//            .disposed(by: disposeBag)

//        print("1")
//        DispatchQueue.main.sync {
//            print("2")
//        }
//        print("3")


        return true
    }

    func nslock() {
        lock.lock()
        print("lock")
    }

    func unlock() {
        lock.unlock()
        print("unlock")
    }



    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

