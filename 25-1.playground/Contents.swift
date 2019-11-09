/**
 * 25-1 パラメータの適合
 *
 * 俺はこう思ったっす -> 抽象レイヤでラッパするイメージ？？
 */

import UIKit

// 何かモックするのが難しい or 不可能なもの
class SomeUnMockableHttpRequest {
    func getValues() -> [String]? {
        return []
    }

    func a() {}
    func b() {}
    func c() {}
    func d() {}
    func e() {}
    func f() {}
}

// -----------------------------------

class Before {

    func populate(request: SomeUnMockableHttpRequest) {
        let values = request.getValues()

        if let values = values, !values.isEmpty {
            //...
        }
    }
}

// -----------------------------------

class After {

    func populate(request: SomeUnMockableHttpRequest) {
        let values = request.getValues()

        if let values = values, !values.isEmpty {
            //...
        }
    }
}

protocol SomeProtocol {
    func getValues() -> [String]?
}

class MockedSome: SomeProtocol {

    let values: [String]

    init(values: [String]) {
        self.values = values
    }

    func getValues() -> [String]? {
        return self.values
    }
}

class ProductionSome: SomeProtocol {

    let request: SomeUnMockableHttpRequest

    init(request: SomeUnMockableHttpRequest) {
        self.request = request
    }

    func getValues() -> [String]? {
        return self.request.getValues()
    }
}
