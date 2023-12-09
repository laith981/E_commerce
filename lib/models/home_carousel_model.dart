class HomeCarouselModel{
 const HomeCarouselModel({required this.id, required this.imageUrl});
  final String imageUrl;
  final String id;
}
List<HomeCarouselModel> carouselList=[
  const HomeCarouselModel(id: "1", imageUrl: "https://marketplace.canva.com/EAFMdLQAxDU/1/0/1600w/canva-white-and-gray-modern-real-estate-modern-home-banner-NpQukS8X1oo.jpg"),
  const HomeCarouselModel(id: "2", imageUrl: "https://edit.org/photos/img/blog/mbp-template-banner-online-store-free.jpg-840.jpg"),
  const HomeCarouselModel(id: "3", imageUrl: "https://e0.pxfuel.com/wallpapers/606/84/desktop-wallpaper-ecommerce-website-design-company-noida-e-commerce-banner-design-e-commerce.jpg"),

];