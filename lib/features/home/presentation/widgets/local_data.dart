class LocalData {
  String image;
  String name;

  LocalData({required this.image, required this.name});

  static List<LocalData> products = [
    LocalData(
      image: 'assets/images/cover/cover2.png',
      name: 'Women collection',
    ),
    LocalData(image: 'assets/images/cover/cover3.png', name: 'Men collection'),

    LocalData(image: 'assets/images/cover/cover1.png', name: 'Kids collection'),
  ];

  static List<String> banners = [
    'assets/images/banners/promo-banner-1.png',
    'assets/images/banners/promo-banner-2.png',
    'assets/images/banners/promo-banner-3.png',
  ];
}
