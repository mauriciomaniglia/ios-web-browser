import XCTest
import ios_web_browser
import core_web_browser

class WindowViewTests: XCTestCase {
    func test_textFieldShouldReturn_sendsText() {
        let delegate = MainViewDelegateSpy()
        let sut = WindowView()
        sut.delegate = delegate
                
        let textField = UITextField()
        textField.text = "http://some-website.com"
        
        _ = sut.textFieldShouldReturn(textField)
        
        XCTAssertEqual(delegate.receivedMessages, [.didRequestSearch("http://some-website.com")])
    }

    func test_textFieldShouldReturn_whenTextIsEmptyDoNotSendText() {
        let delegate = MainViewDelegateSpy()
        let sut = WindowView()
        sut.delegate = delegate

        let textField = UITextField()
        textField.text = ""

        _ = sut.textFieldShouldReturn(textField)

        XCTAssertEqual(delegate.receivedMessages, [])
    }
    
    // MARK: - Helpers
    
    private class MainViewDelegateSpy: WindowViewContract {
        enum Message: Equatable {
            case didRequestSearch(_ text: String)
            case didStartTyping
            case didEndTyping
            case didTapBackButton
            case didTapForwardButton
        }

        var receivedMessages = [Message]()

        func didRequestSearch(_ text: String) {
            receivedMessages.append(.didRequestSearch(text))
        }

        func didStartTyping() {
            receivedMessages.append(.didStartTyping)
        }

        func didEndTyping() {
            receivedMessages.append(.didEndTyping)
        }

        func didTapBackButton() {
            receivedMessages.append(.didTapBackButton)
        }

        func didTapForwardButton() {
            receivedMessages.append(.didTapForwardButton)
        }
    }
}
