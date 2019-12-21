import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

import RxSwift

//exampleOf(description: "just") {
//    let observable = Observable.just("Hello, world!")
//
//    observable.subscribe { (event: Event<String>) in
//        print(event.element ?? "No element")
//        print(event.isCompleted)
//        print(event.isStopEvent)
//    }
//
//    observable.subscribe(onNext: {
//        print($0)
//    })
//}

//exampleOf(description: "of") {    
//    let observable = Observable.of(1, 2, 3)
//
//    let disposeBag = DisposeBag()
//
//    let subscription: Disposable = observable
//        .subscribe(onNext: {
//            print($0)
//        }, onError: { (error) in
//            print(error)
//        }, onCompleted: {
//            print("completed")
//        }, onDisposed: {
//            print("disposed")
//        })
//    subscription.disposed(by: disposeBag)
//
//}

//exampleOf(description: "PublishSubject") {
//    let subject = PublishSubject<String>()
//
//    subject.subscribe{
//        print($0)
//    }
//
//    subject.onNext("Hello")
////    subject.onCompleted()
//    subject.onNext("World!")
//
//    print("\nCreate New Subject\n")
//    let newSubject = subject.subscribe(onNext: {
//        print("New subcription: \($0)")
//    })
//    subject.onNext("What's up?")
//    newSubject.dispose()
//    subject.onNext("Still there?")
//}

//exampleOf(description: "BehaviorSubject") {
//    let subject = BehaviorSubject(value: "a")
//
//    let firstSubcription = subject.subscribe(onNext: {
//        print("\(#line). First Subcription : \($0)")
//    })
//
//    subject.onNext("b")
//
//    let secondSubscription = subject.subscribe(onNext: {
//        print("\(#line). Second Subcription : \($0)")
//    })
//
//}

//exampleOf(description: "ReplaySubject") {
//    let subject = ReplaySubject<Int>.create(bufferSize: 3)
//
//    subject.onNext(1)
//    subject.onNext(2)
//    subject.onNext(3)
//    subject.onNext(4)
//
//    subject.subscribe(onNext: {
//        print("Recent on next: \($0)")
//    })
//}

//exampleOf(description: "Variable") {
////    let disposeBag = DisposeBag()
////    let variable = Variable("A")
////
////    let observable = variable.asObservable()
////
////    let firstSubcription = observable.subscribe(onNext: {
////        print("Variable: \($0)")
////    })
////
////    variable.value = "C"
////    firstSubcription.disposed(by: disposeBag)
////
////    let secondSubciption = observable.subscribe(onNext: {
////        print("Recent Variable: \($0)")
////    })
////    secondSubciption.disposed(by: disposeBag)
//
//    // 1
//    let variable = Variable("Initial value")
//    let disposeBag = DisposeBag()
//
//    // 2
//    variable.value = "New initial value"
//
//    // 3
//    variable.asObservable()
//        .subscribe {
//            print("1/ \($0)")
//        }
//        .disposed(by: disposeBag)
//
//    // 1
//    variable.value = "1"
//    // 2
//    variable.asObservable()
//        .subscribe {
//            print("2/ \($0)")
//        }
//        .disposed(by: disposeBag)
//    // 3
//    variable.value = "2"
//}

//exampleOf(description: "map") {
//    Observable.of(1, 2, 3)
//        .map{ $0 * $0 }
//        .subscribe(onNext: { print($0) })
//        .dispose()
//}

//exampleOf(description: "flatMap & flatMapLastest") {
//    let disposeBag = DisposeBag()
//
//    struct Player {
//        var score: Variable<Int>
//    }
//
//    let scott = Player(score: Variable(80))
//    let lori = Player(score: Variable(90))
//    var player = Variable(scott)
//
//    player.asObservable()
//        .flatMapLatest({ $0.score .asObservable()})
//        .subscribe(onNext: { print($0) })
//        .disposed(by: disposeBag)
//
//    player.value.score.value = 85
//    scott.score.value = 88
//
//    player.value = lori
//    scott.score.value = 95
//    lori.score.value = 100
//    player.value.score.value = 105
//}


//exampleOf(description: "scan") {
//    let disposeBag = DisposeBag()
//    let dartScore = PublishSubject<Int>()
//
//    dartScore
//        .buffer(timeSpan: 0.0, count: 3, scheduler: MainScheduler.instance)
//        .map{$0.reduce(0, +) }
//        .scan(501) { (intermediate, newValue) in
//            let result = intermediate - newValue
//            return result == 0 || result > 1 ? result : intermediate
//        }
//        .do(onNext: {
//            if $0 == 0 {
//                dartScore.onCompleted()
//            }
//        })
//        .subscribe { print($0.isCompleted ? $0 : $0.element!) }
//        .disposed(by: disposeBag)
//
//    dartScore.onNext(13)
//    dartScore.onNext(60)
//    dartScore.onNext(50)
//    dartScore.onNext(0)
//    dartScore.onNext(0)
//    dartScore.onNext(378)
//
//}

//exampleOf(description: "filter") {
//    let disposeBag = DisposeBag()
//    let numbers = Observable.generate(initialState: 1, condition: { $0 < 101 }, iterate: { $0 + 1 })
//    numbers.filter { number in
//        guard number > 1 else { return false }
//        var isPrime = true
//
//        (2..<number).forEach{
//            if number % $0 == 0 {
//                isPrime = false
//            }
//        }
//
//        return isPrime
//    }
//    .toArray()
//    .subscribe{ print($0) }
//    .disposed(by: disposeBag)
//}

//exampleOf(description: "distinctUntilChanged") {
//    let disposeBag = DisposeBag()
//
//    let searchString = Variable("")
//
//    searchString
//        .asObservable()
//        .map{ $0.lowercased() }
//        .distinctUntilChanged()
//        .subscribe{ print($0) }
//        .disposed(by: disposeBag)
//
//    searchString.value = "A"
//    searchString.value = "B"
//    searchString.value = "B"
//    searchString.value = "B"
//    searchString.value = "C"
//    searchString.value = "B"
//    searchString.value = "C"
//    searchString.value = "B"
//}

//exampleOf(description: "takeWhile") {
//    let disposeBag = DisposeBag()
//    let numbers = Observable.from([1, 2, 3, 4, 3, 2, 1])
//
//    numbers
//        .takeWhile{ $0 < 4 }
//        .subscribe(onNext: { print($0) })
//        .disposed(by: disposeBag)
//}

//exampleOf(description: "startWith") {
//    let disposeBag = DisposeBag()
//
//    Observable.from(["1", "2", "3"])
//        .startWith("A")
//        .startWith("B")
//        .startWith("C" ,"D")
//        .subscribe(onNext: { print($0) })
//        .disposed(by: disposeBag)
//}

//exampleOf(description: "merge") {
//    let disposeBag = DisposeBag()
//
//    let subject1 = PublishSubject<String>()
//    let subject2 = PublishSubject<String>()
//
//    Observable.of(subject1, subject2)
//        .merge()
//        .subscribe(onNext: { print($0) })
//        .disposed(by: disposeBag)
//
//    subject1.onNext("A")
//    subject1.onNext("B")
//
//    subject2.onNext("1")
//    subject2.onNext("2")
//
//    subject1.onNext("C")
//    subject2.onNext("3")
//}

//exampleOf(description: "zip") {
//    let disposeBag = DisposeBag()
//
//    let strSubject = PublishSubject<String>()
//    let intSubject = PublishSubject<Int>()
//
//    Observable.zip(strSubject, intSubject) { (strElement, intElement) in
//        "\(strElement) \(intElement)"
//    }
//    .subscribe{ print($0.element ?? "") }
//    .disposed(by: disposeBag)
//
//    strSubject.onNext("A")
//    strSubject.onNext("B")
//
//    intSubject.onNext(1)
//    intSubject.onNext(2)
//    intSubject.onNext(3)
//
//    strSubject.onNext("C")
//}

//exampleOf(description: "doOnNext") {
//    let disposeBag = DisposeBag()
//
//    let fahrenheitTemps = Observable.from([-40, 0, 32, 70, 212])
//
//    fahrenheitTemps
//        .do(onNext: { (_) in
//            //            print(temp * temp)
//        })
//        .do(onNext: { (temp) in
//            print("\(temp)ºF = ", terminator: "")
//        })
//        .map{ Double($0 - 32) * 5/9.0 }
//        .subscribe(onNext: { (temp) in
//            print(String(format: "%.1fºC", temp))
//        })
//        .disposed(by: disposeBag)
//
//}
