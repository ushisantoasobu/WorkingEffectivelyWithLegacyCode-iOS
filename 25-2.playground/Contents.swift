/**
 * 25-2 メソッドオブジェクトの取り出し
 *
 * hogehoge
 */

class SomeBigClazz: SomeProtocol {

    /* ここを別のクラスとして抽出する
    func someBigFunc(a: Int, b: String, c: Bool) {

        print(a)
        print(b)
        print(c)

        //...........

        let hoge = hoge()
        print(hoge)
 */

    // 結果、処理を別のクラスに移譲する
    func someBigFunc(a: Int, b: String, c: Bool) {
        let extractedClazz = ExtractedClazz(bigClazz: self, a: a, b: b, c: c)
        return extractedClazz.someBigFunc()
    }

    func hoge() -> String {
        return "hoge"
    }
}

//-----------------------------------------------------------

class ExtractedClazz {

    let bigClazz: SomeProtocol
    let a: Int
    let b: String
    let c: Bool

    init(bigClazz: SomeProtocol,
         a: Int,
         b: String,
         c: Bool) {
        self.bigClazz = bigClazz
        self.a = a
        self.b = b
        self.c = c
    }

    func someBigFunc() {

        print(a)
        print(b)
        print(c)

        let hoge = bigClazz.hoge()
        print(hoge)
    }
}

protocol SomeProtocol {
    func hoge() -> String
}

class MockedBigClazz: SomeProtocol {
    func hoge() -> String {
        return "some for test"
    }
}

let test = ExtractedClazz(bigClazz: MockedBigClazz(), a: 1, b: "aaa", c: true)
test.someBigFunc()
