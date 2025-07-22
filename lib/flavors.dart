enum Flavor {
  di,
  api,
  production,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.di:
        return 'Empowered Man DI';
      case Flavor.api:
        return 'Empowered Man API';
      case Flavor.production:
        return 'Empowered Man';
    }
  }

}
