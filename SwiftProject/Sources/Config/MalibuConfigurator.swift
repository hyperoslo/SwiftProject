import Malibu

public struct MalibuConfigurator: Configurable {

  public func configure() {
    Malibu.logger.level = .verbose

    App.networkingProvider = NetworkingProvider(base: Networking<APIService>())
  }
}
