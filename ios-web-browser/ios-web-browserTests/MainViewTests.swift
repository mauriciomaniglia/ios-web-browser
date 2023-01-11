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

    func test_textFieldShouldReturn_whenTextIsEmptyDoNotSendText() {
        let delegate = MainViewDelegateSpy()
        let sut = MainView()
        sut.delegate = delegate

        let textField = UITextField()
        textField.text = ""

        _ = sut.textFieldShouldReturn(textField)

        XCTAssertEqual(delegate.receivedMessages, [])
    }

    func test_updateViewState_updatesViewElementsCorrectly() {
        let sut = MainView()

        sut.updateViewState(canGoBack: false, canGoForward: false, isWebViewHidden: false)

        XCTAssertEqual(sut.bottomNavigationView.backButton.isEnabled, false)
        XCTAssertEqual(sut.bottomNavigationView.forwardButton.isEnabled, false)
        XCTAssertEqual(sut.webView.isHidden, false)

        sut.updateViewState(canGoBack: true, canGoForward: true, isWebViewHidden: true)

        XCTAssertEqual(sut.bottomNavigationView.backButton.isEnabled, true)
        XCTAssertEqual(sut.bottomNavigationView.forwardButton.isEnabled, true)
        XCTAssertEqual(sut.webView.isHidden, true)
    }
    
    // MARK: - Helpers
    
    private class MainViewDelegateSpy: MainViewProtocol {
        enum Message: Equatable {
            case sendText(_ text: String)
            case didTapBackButton
            case didTapForwardButton
        }

        var receivedMessages = [Message]()

        func sendText(_ text: String) {
            receivedMessages.append(.sendText(text))
        }

        func didTapBackButton() {
            receivedMessages.append(.didTapBackButton)
        }

        func didTapForwardButton() {
            receivedMessages.append(.didTapForwardButton)
        }
    }
}
