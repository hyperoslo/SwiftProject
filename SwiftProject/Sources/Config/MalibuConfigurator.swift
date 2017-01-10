import Malibu

public struct MalibuConfigurator: Configurable {

  public func configure() {
    Malibu.mode = .partial
    Malibu.logger.level = .verbose

    // let networking = Networking(baseUrl: "url")
    // Malibu.register("notification", networking: networking)
  }
}
