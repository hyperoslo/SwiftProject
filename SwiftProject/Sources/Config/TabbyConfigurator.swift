import UIKit
import Hue
import Tabby

struct TabbyConfigurator: Configurable {

  func configure() {
    Tabby.Constant.Dimension.height = 48
    Tabby.Constant.Dimension.Icon.width = 20
    Tabby.Constant.Dimension.Icon.height = 20
    Tabby.Constant.Dimension.Indicator.height = 1
    Tabby.Constant.Dimension.Indicator.width = 48

    Tabby.Constant.Behavior.labelVisibility = .visible

    Tabby.Constant.Color.background = UIColor(hex:"FFFFFF")
    Tabby.Constant.Color.selected = UIColor.blue
    Tabby.Constant.Color.separator = UIColor.black
    Tabby.Constant.Color.enabled = UIColor.lightText
    Tabby.Constant.Color.disabled = UIColor.lightText.alpha(0.5)
    
    Tabby.Constant.Font.title = UIFont.systemFont(ofSize: 12)
  }
}
