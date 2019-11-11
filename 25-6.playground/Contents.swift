/**
* 25-6 呼び出しの抽出とオーバライド
*
* 局所的な原因でテストが書けない、、、なんてとき
*
* 俺はこう思ったっす -> オーバライドでモックするというの、理由なく毛嫌いしていたけど、、、気にする必要ない？？
*/

class SomeClazz {

    func someTestWantedFunc() {

        //...........

        // こいつだけの依存関係のせいでテストが書けない、、、
        let _ = HogeClazz.getHoge()

        //...........
    }
}

class HogeClazz {
    static func getHoge() -> String {
        return ""
    }
}

//-----------------------------------------------------------

class SomeClazz2 {

    func someTestWantedFunc() {

        //...........

        // こいつだけの依存関係のせいでテストが書けない、、、
        let _ = extractedFunc()

        //...........
    }

    func extractedFunc() -> String {
        return HogeClazz.getHoge()
    }
}

class MockedSomeClazz2: SomeClazz2 {

    override func extractedFunc() -> String {
        return "some words as you like."
    }
}
