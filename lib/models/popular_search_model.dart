class Tipe{
  final String hot="Hot";
  final String popular="Popular";
  final String newTipe="New";
}
class PopularSearchModel{
 const PopularSearchModel( {required this.id, required this.imageUrl, required this.name, required this.searchTimes,required this.tipe,});
 final String id;
 final String imageUrl;
 final String name;
 final String searchTimes;
 final String tipe;

}
List<PopularSearchModel>PopularSearchList=[
  PopularSearchModel(id: "1", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwf40Kdak_3OXQj0MoS8WjqTepJgOqvUH3ygOaOpTtDFfnyKB2uTv8p0BQEUpPnFQogM0&usqp=CAU", name: "Lunilo Hils jacet", searchTimes: "1.6k", tipe: Tipe().hot),
  PopularSearchModel(id: "2", imageUrl: "https://eu.stussy.com/cdn/shop/products/116601_WASB_1.jpg?v=1697049537", name: "Denim Jeans", searchTimes: "1k", tipe: Tipe().newTipe),
  PopularSearchModel(id: "3", imageUrl: "https://cdn-e.webinterpret.com/wi-ebay-pictures/EBAY/24/85/81/185842165191_12047853_images_3_23saka16_2000_uni_685__1.jpeg", name: "Redil Backpack", searchTimes: "1.23k", tipe: Tipe().popular),
  PopularSearchModel(id: "4", imageUrl: "https://snpi.dell.com/snp/images/products/large/en-us~AB591010/AB591010.jpg", name: "JBL Speakers", searchTimes: "1.1k", tipe: Tipe().newTipe)
];