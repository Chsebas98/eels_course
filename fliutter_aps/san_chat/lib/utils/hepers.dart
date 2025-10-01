enum ConfigDevice { smallPhone, mediumPhone, largePhone, tablet }

class Helpers {
  static ConfigDevice getConfigDevice(double width) {
    if (width < 360) {
      return ConfigDevice.smallPhone;
    } else if (width < 480) {
      return ConfigDevice.mediumPhone;
    } else if (width < 720) {
      return ConfigDevice.largePhone;
    } else {
      return ConfigDevice.tablet;
    }
  }
}
