import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

import RxSwift

let imageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 128.0, height: 128.0))
imageView.backgroundColor = .white
imageView.layer.cornerRadius = 5
PlaygroundPage.current.liveView = imageView

let swift = UIImage(named: "swift")!
let swiftImageData = swift.pngData()!
let rx = UIImage(named: "rx")!
let rxImageData = rx.pngData()!
let disposeBag = DisposeBag()

let imageDataSubject = PublishSubject<Data>()

let scheduler = ConcurrentDispatchQueueScheduler(qos: .background)

let myQueue = DispatchQueue(label: "com.leex.myConcurrentQueue", qos: .background, attributes: .concurrent)
let scheduler2 = SerialDispatchQueueScheduler(queue: myQueue, internalSerialQueueName: "com.leex.myConcurrentQueue")

let operationQueue = OperationQueue()
operationQueue.qualityOfService = .background
let scheduler3 = OperationQueueScheduler(operationQueue: operationQueue)

imageDataSubject
    .observeOn(scheduler3)
    .map{ UIImage(data: $0) }
    .observeOn(MainScheduler.instance)
    .subscribe(onNext: { (image) in
        imageView.image = image
    })
    .disposed(by: disposeBag)

imageDataSubject.onNext(rxImageData)
imageDataSubject.onNext(swiftImageData)
