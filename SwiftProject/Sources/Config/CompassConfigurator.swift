import Compass
import Sugar

struct CompassConfigurator: Configurable {

  func configure() {
    Compass.scheme = Application.executable.replacingOccurrences(of: " ", with: "-").lowercased()
  }
}
