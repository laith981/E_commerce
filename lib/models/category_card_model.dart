class CategoreCardModel {
  const CategoreCardModel(
      {required this.id,
      required this.imageUrl,
      required this.categoreTitel,
      required this.quantity,
      this.rightTextAlign = false,
      this.lightTextColor = true});
  final String id;
  final String imageUrl;
  final String categoreTitel;
  final int quantity;
  final bool lightTextColor;
  final bool rightTextAlign;
}

List<CategoreCardModel> categoreCardData = const [
  CategoreCardModel(
    id: "1",
    imageUrl:
        "https://www.shutterstock.com/image-photo/sustainable-shopping-banner-different-kind-600nw-2270373573.jpg",
    categoreTitel: "New Arrivals",
    quantity: 208,
    lightTextColor: false,
  ),
  CategoreCardModel(
      id: "2",
      imageUrl:
          "https://img.freepik.com/premium-photo/woman-with-shopping-bags-red-background-with-space-text-generative-ai_527096-27882.jpg",
      categoreTitel: "Clothes",
      quantity: 358,
      rightTextAlign: true,
      lightTextColor: false),
  CategoreCardModel(
      id: "3",
      imageUrl:
          "https://img.freepik.com/free-photo/young-woman-beige-autumn-outfit-waving-her-hand-posing-with-smile-pink-background_197531-17646.jpg",
      categoreTitel: "Bags",
      quantity: 160,
      lightTextColor: false),
  CategoreCardModel(
      id: "4",
      imageUrl:
          "https://thumbs.dreamstime.com/b/happy-kids-sportswear-working-out-dumbbells-isolated-blue-banner-stock-image-happy-kids-sportswear-working-out-221257702.jpg",
      categoreTitel: "Children's clothing",
      quantity: 230,
      rightTextAlign: true,
      lightTextColor: false),
  CategoreCardModel(
      id: "5",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTubzhSa3h_THaHiiBggXwsFz3lmmDGTowrw&usqp=CAU",
      categoreTitel: "Electronic",
      quantity: 300,
      lightTextColor: false),
  CategoreCardModel(
      id: "6",
      imageUrl: "https://www.shutterstock.com/image-photo/man-holding-stylish-gray-sneakers-260nw-1717110277.jpg",
      categoreTitel: "Shoes",
      quantity: 125,
      rightTextAlign: true),
  CategoreCardModel(
      id: "7",
      imageUrl:
          "https://static.vecteezy.com/system/resources/thumbnails/027/215/100/small/young-man-with-curly-hair-shopping-carrying-bags-on-neutral-background-new-collection-or-sales-mockup-free-photo.jpg",
      categoreTitel: "Formal wear",
      quantity: 341,
      lightTextColor: false),
  CategoreCardModel(
      id: "8",
      imageUrl: "https://as2.ftcdn.net/v2/jpg/04/14/72/97/1000_F_414729734_fSyKI5OFxr8EnGZXgD97dUOWyYOszMYU.jpg",
      categoreTitel: "Makeup",
      quantity: 400,
      rightTextAlign: true,
      lightTextColor: false),
];
