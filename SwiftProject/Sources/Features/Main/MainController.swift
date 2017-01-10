import UIKit
import Tabby

class MainController: TabbyController {

  convenience init() {
    self.init(items: [])

    // Controllers
    let firstController = UIViewController()
    firstController.title = "First".uppercased()

    let secondController = UIViewController()
    secondController.title = "Second".uppercased()

    // Tab bar
    items = [
      TabbyBarItem(
        controller: UINavigationController(rootViewController: firstController),
        image: ""),
      TabbyBarItem(
        controller: UINavigationController(rootViewController: secondController),
        image: "")
    ]

    view.backgroundColor = UIColor.white
    setIndex = 0
  }
}
