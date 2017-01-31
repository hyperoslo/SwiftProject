import Compass
import Sugar

struct CompassConfigurator: Configurable {

  func configure() {
    Navigator.scheme = Application.executable.replacingOccurrences(of: " ", with: "-").lowercased()
  }
}
