import XCTest
import ios_web_browser

class MainViewTests: XCTestCase {
    func test_textFieldShouldReturn_sendsText() {
        let delegate = MainViewDelegateSpy()
        let sut = MainView()
        sut.delegate = delegate
                
        let textField = UITextField()
        textField.text = "http://some-website.com"
        
        _ = sut.textFieldShouldReturn(textField)
        
        XCTAssertEqual(delegate.receivedMessages, [.sendText("http://some-website.com")])
    }
    
    // MARK: - Helpers
    
    private class MainViewDelegateSpy: MainViewProtocol {
        enum Message: Equatable {
            case sendText(_ text: String)
        }

        var receivedMessages = [Message]()
        
        func sendText(_ text: String) {
            receivedMessages.append(.sendText(text))
        }
    }
}
