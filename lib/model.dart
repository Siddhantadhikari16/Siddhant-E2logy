class Store {
  final String dealID;
  final String promoCode;
  final String title;
  final String image;
  final String description;
  final String toc;
  final String dealCategoryID;
  final String discount;
  final String currencySymbol;
  final String validityStart;
  final String validityEnd;
  final String dealType;
  final String isFav;
  final String memberTier;
  final String storeID;
  final String storeName;
  final String towerNumber;
  final String categName;

  Store({
    required this.dealID,
    required this.promoCode,
    required this.title,
    required this.image,
    required this.description,
    required this.toc,
    required this.dealCategoryID,
    required this.discount,
    required this.currencySymbol,
    required this.validityStart,
    required this.validityEnd,
    required this.dealType,
    required this.isFav,
    required this.memberTier,
    required this.storeID,
    required this.storeName,
    required this.towerNumber,
    required this.categName,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      dealID: json['DealID'],
      promoCode: json['PromoCode'],
      title: json['Title'],
      image: json['Image'],
      description: json['Description'],
      toc: json['TOC'],
      dealCategoryID: json['DealCategoryID'],
      discount: json['Discount'],
      currencySymbol: json['CurrencySymbol'],
      validityStart: json['ValidityStart'],
      validityEnd: json['ValidityEnd'],
      dealType: json['DealType'],
      isFav: json['isFav'],
      memberTier: json['MemberTier'],
      storeID: json['StoreID'],
      storeName: json['StoreName'],
      towerNumber: json['TowerNumber'],
      categName: json['CategName'],
    );
  }
}
