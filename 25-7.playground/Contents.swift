/**
 25-7 Factory Methodの抽出とオーバライド

 1つ前の「呼び出しの抽出とオーバライド」とかなり似ている？
 */

class SomeClazz {

    let someManager: SomeManager

    init() {
        // イニシャライザに依存関係がある
        let store = SomeStore()
        self.someManager = SomeManager(store: store)
    }
}

class SomeManager {

    let store: SomeStore

    init(store: SomeStore) {
        self.store = store
    }
}
class SomeStore { /**/ }

// ---------------------------------------------------

class SomeClazz2 {

    // MEMO: ここ、このパターンだと optional になってしまう？？
    var someManager: SomeManagerProtocol? = nil

    init() {
        // イニシャライザに依存関係がある
        self.someManager = self.getSomeManager()
    }

    func getSomeManager() -> SomeManagerProtocol {
        let store = SomeStore()
        return SomeManager(store: store)
    }
}

class MockedSomeClazz2: SomeClazz2 {
    override func getSomeManager() -> SomeManagerProtocol {
        return MockedSomeManager()
    }
}

protocol SomeManagerProtocol {}

extension SomeManager: SomeManagerProtocol {}

class MockedSomeManager: SomeManagerProtocol {}
