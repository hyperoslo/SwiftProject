import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var mainController: MainController?

  var configurators: [Configurable] = [
    MalibuConfigurator()
  ]

  // MARK: - Initialization

  override init() {
    super.init()
  }

  // MARK: - App lifecycle

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    configurators.forEach {
      $0.configure()
    }

    mainController = MainController()

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = mainController
    window?.makeKeyAndVisible()

    return true
  }
}
