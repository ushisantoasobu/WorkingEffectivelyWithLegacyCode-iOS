/**
* 25-5 静的メソッドの公開
*
*
* テスト対象のクラスがインスタンス化しづらいとき、、、
* staticメソッドに切り出せるもの（インスタンス変数・メソッドを参照していない）は切り出してテストを書く
*/

class SomeClazz {

    // ここのテストを書きたい、でもインスタンス化するのが難しかったりする...
    func someValidate(packet: SomePackt) -> Bool {
        if packet.getOriginator() == "MIA"
            || packet.getLength() > 100
            || !packet.hasValidCheckSum() {
            return false
        }

        return true
    }
}

class SomePackt {

    // 本のメソッドそのまま持ってきた

    func getOriginator() -> String {
        return ""
    }

    func getLength() -> Int {
        return 0
    }

    func hasValidCheckSum() -> Bool {
        return false
    }
}

//-------------------------------------------------

extension SomeClazz {
    static func someValidate(packet: SomePackt) -> Bool {
        if packet.getOriginator() == "MIA"
            || packet.getLength() > 100
            || !packet.hasValidCheckSum() {
            return false
        }

        return true
    }
}

let packet = SomePackt()
let boolean = SomeClazz.someValidate(packet: packet)
