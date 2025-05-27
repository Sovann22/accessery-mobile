class AppImages {
  // Base paths
  static const String _basePath = 'assets/images';
  static const String _productsPath = '$_basePath/products';
  static const String _categoriesPath = '$_basePath/categories';
  static const String _brandsPath = '$_basePath/brands';
  static const String _iconsPath = 'assets/icons';

  // App Logo and Branding
  static const String appLogo = '$_basePath/app_logo.png';
  static const String splashLogo = '$_basePath/splash_logo.png';
  static const String placeholder = '$_basePath/placeholder.png';
  static const String noImage = '$_basePath/no_image.png';

  // Category Images
  static const String casesCategory = '$_categoriesPath/cases_category.png';
  static const String chargersCategory =
      '$_categoriesPath/chargers_category.png';
  static const String headphonesCategory =
      '$_categoriesPath/headphones_category.png';
  static const String screenProtectorsCategory =
      '$_categoriesPath/screen_protectors.png';
  static const String cablesCategory = '$_categoriesPath/cables.png';
  static const String standsCategory = '$_categoriesPath/stands.png';

  // Product Images
  static const String phoneCase1 = '$_productsPath/phone_case_1.jpg';
  static const String phoneCase2 = '$_productsPath/phone_case_2.jpg';
  static const String wirelessCharger = '$_productsPath/wireless_charger.jpg';
  static const String headphones = '$_productsPath/headphones.jpg';
  static const String cable = '$_productsPath/cable.jpg';
  static const String premiumLeatherCase1 =
      '$_productsPath/premium_leather_case_1.jpg';
  static const String premiumLeatherCase2 =
      '$_productsPath/premium_leather_case_2.jpg';
  static const String premiumLeatherCase3 =
      '$_productsPath/premium_leather_case_3.jpg';
  static const String clearCase = '$_productsPath/clear_case.jpg';
  static const String ruggedCase = '$_productsPath/rugged_case.jpg';
  static const String usbcCharger = '$_productsPath/usbc_charger.jpg';
  static const String powerBank = '$_productsPath/power_bank.jpg';
  static const String noiseEarbuds1 = '$_productsPath/noise_earbuds_1.jpg';
  static const String noiseEarbuds2 = '$_productsPath/noise_earbuds_2.jpg';
  static const String noiseEarbuds3 = '$_productsPath/noise_earbuds_3.jpg';
  static const String overEarHeadphones =
      '$_productsPath/over_ear_headphones.jpg';
  static const String sportsEarbuds = '$_productsPath/sports_earbuds.jpg';
  static const String temperedGlass = '$_productsPath/tempered_glass.jpg';
  static const String privacyScreen = '$_productsPath/privacy_screen.jpg';
  static const String usbcLightningCable =
      '$_productsPath/usbc_lightning_cable.jpg';
  static const String magneticCable = '$_productsPath/magnetic_cable.jpg';
  static const String phoneStand = '$_productsPath/phone_stand.jpg';
  static const String carMount = '$_productsPath/car_mount.jpg';

  // Brand Logos
  static const String luxeCaseLogo = '$_brandsPath/luxecase_logo.png';
  static const String powerTechLogo = '$_brandsPath/powertech_logo.png';
  static const String soundMaxLogo = '$_brandsPath/soundmax_logo.png';
  static const String appleLogo = '$_brandsPath/apple_logo.png';
  static const String samsungLogo = '$_brandsPath/samsung_logo.png';

  // Icons
  static const String cartIcon = '$_iconsPath/cart_icon.png';
  static const String favoriteIcon = '$_iconsPath/favorite.png';
  static const String searchIcon = '$_iconsPath/search.png';
  static const String heartIcon = '$_iconsPath/heart_icon.png';

  // Helper method to get product images by ID
  static List<String> getProductImages(String productId) {
    switch (productId) {
      case '1': // Premium Leather Case
        return [premiumLeatherCase1, premiumLeatherCase2, premiumLeatherCase3];
      case '2': // Fast Wireless Charger
        return [wirelessCharger];
      case '3': // Noise-Cancelling Earbuds
        return [noiseEarbuds1, noiseEarbuds2, noiseEarbuds3];
      case '4': // Clear Protective Case
        return [clearCase];
      case '5': // Rugged Armor Case
        return [ruggedCase];
      case '6': // USB-C Fast Charger
        return [usbcCharger];
      case '7': // Portable Power Bank
        return [powerBank];
      case '8': // Wireless Over-Ear Headphones
        return [overEarHeadphones];
      case '9': // Sports Earbuds
        return [sportsEarbuds];
      case '10': // Tempered Glass Screen Protector
        return [temperedGlass];
      case '11': // Privacy Screen Protector
        return [privacyScreen];
      case '12': // USB-C to Lightning Cable
        return [usbcLightningCable];
      case '13': // Magnetic Charging Cable
        return [magneticCable];
      case '14': // Adjustable Phone Stand
        return [phoneStand];
      case '15': // Car Phone Mount
        return [carMount];
      default:
        return [placeholder];
    }
  }

  // Helper method to get category images
  static String getCategoryImage(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'cases':
        return casesCategory;
      case 'chargers':
        return chargersCategory;
      case 'headphones':
        return headphonesCategory;
      case 'screen protectors':
        return screenProtectorsCategory;
      case 'cables':
        return cablesCategory;
      case 'stands':
        return standsCategory;
      default:
        return placeholder;
    }
  }

  // Helper method to get brand logos
  static String getBrandLogo(String brandName) {
    switch (brandName.toLowerCase()) {
      case 'luxecase':
        return luxeCaseLogo;
      case 'powertech':
        return powerTechLogo;
      case 'soundmax':
        return soundMaxLogo;
      case 'apple':
        return appleLogo;
      case 'samsung':
        return samsungLogo;
      default:
        return placeholder;
    }
  }
}
