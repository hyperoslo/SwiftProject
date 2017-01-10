import Fashion

struct MainStylesheet: Stylesheet {

  enum Key: String, Fashion.StringConvertible {
    case title
    case button

    var string: String {
      return rawValue.styleKey(prefix: MainStylesheet.self)
    }
  }

  func define() {
    register(Key.title) { (label: UILabel) in
      label.textColor = UIColor.black
    }

    register(Key.button) { (button: UIButton) in
      button.backgroundColor = UIColor.blue
    }
  }
}
