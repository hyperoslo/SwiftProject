import UIKit
import Fabric
import Crashlytics
import Sugar

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var mainController: MainController?

  var configurators: [Configurable] = [
    FashionConfigurator(),
    CompassConfigurator(),
    SpotsConfigurator(),
    MalibuConfigurator(),
    AftermathConfigurator()
  ]

  // MARK: - Initialization

  override init() {
    super.init()
  }

  // MARK: - App lifecycle

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    if !Simulator.isRunning && !UnitTesting.isRunning {
      Fabric.with([Crashlytics.self])
    }

    App.delegate = self

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

// MARK: - Routing

extension AppDelegate {

  func application(_ app: UIApplication, open url: URL,
                   options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
    return handle(url: url)
  }

  @discardableResult func handle(url: URL, fragments: [String: Any] = [:]) -> Bool {
    // Navigation
    return true
  }
}
