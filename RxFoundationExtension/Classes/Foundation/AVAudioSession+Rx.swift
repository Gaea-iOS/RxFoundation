//
//  AVAudioSession+Rx.swift
//  RxFoundationExtension
//
//  Created by 王小涛 on 2019/5/21.
//

import RxSwift
import RxCocoa
import AVFoundation
import Photos

extension Reactive where Base: AVAudioSession {

    func requestRecordPermission() -> Observable<Bool> {
        return Observable<Bool>.create { [unowned base] observer in
            switch base.recordPermission {
            case .granted:
                observer.onNext(true)
                observer.onCompleted()
            case .denied:
                observer.onNext(false)
                observer.onCompleted()
            case .undetermined:
                base.requestRecordPermission { allow in
                    observer.onNext(allow)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
}

extension Reactive where Base: PHPhotoLibrary {

    static func requestAuthorization() -> Observable<PHAuthorizationStatus> {

        return Observable<PHAuthorizationStatus>.create { observer in

            let status = PHPhotoLibrary.authorizationStatus()
            switch status {
            case .authorized, .denied, .restricted:
                observer.onNext(status)
                observer.onCompleted()
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization{
                    observer.onNext($0)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
}
