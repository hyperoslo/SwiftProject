import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  // MARK: - App lifecycle

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    #if DEBUG
    Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle")?.load()
    #endif
    loadInitialState()
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(didInject),
                                           name: NSNotification.Name(rawValue: "INJECTION_BUNDLE_NOTIFICATION"),
                                           object: nil)
    return true
  }

  // MARK: - Initial state

  private func loadInitialState() {
    let window = UIWindow(frame: UIScreen.main.bounds)
    let controller = UIViewController()
    window.rootViewController = controller
    window.makeKeyAndVisible()
    self.window = window
  }

  // MARK: - Injection

  @objc func didInject() {
    loadInitialState()
  }
}
