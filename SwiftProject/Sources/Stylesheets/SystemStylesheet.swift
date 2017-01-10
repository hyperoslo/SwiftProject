import UIKit
import Fashion
import Hue

struct SystemStylesheet: Stylesheet {

  func define() {
    UIApplication.shared.statusBarStyle = .default

    share { (window: UIWindow) in
      window.backgroundColor = UIColor.white
    }

    share { (navigationBar: UINavigationBar) in
      navigationBar.isTranslucent = false
      navigationBar.barTintColor = UIColor.white
      navigationBar.tintColor = UIColor.blue
    }

    share { (tableView: UITableView) in
      tableView.tableFooterView = UIView(frame: CGRect.zero)
      tableView.separatorStyle = .none
      tableView.separatorInset = UIEdgeInsets.zero
    }

    share { (cell: UITableViewCell) in
      let selectionView = UIView()
      selectionView.backgroundColor = UIColor.lightText
      cell.selectedBackgroundView = selectionView
    }

    share { (textView: UITextView) in
      textView.tintColor = UIColor.blue
    }

    share { (textField: UITextField) in
      textField.tintColor = UIColor.blue
    }
    
    share { (label: UILabel) in
      label.adjustsFontSizeToFitWidth = true
    }
  }
}
