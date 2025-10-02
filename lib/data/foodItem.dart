class FoodItem{
    String? imageName;
    String? name;
    String? shortDescription;
    String? longDescription;
    double? price;
    int? rating;
    int? stars;

    FoodItem({
      this.imageName, 
      this.name,
      this.shortDescription,
      this.longDescription,
      this.price,
      this.rating,
      this.stars,
    });
}

List<FoodItem> foodItems = [
  FoodItem(
    imageName: 'asset/grafiken/cupcake_cat.png',
    name: 'Mogli’s Cup',
    shortDescription: 'Strawberry ice cream',
    longDescription: 'Lorem ipsum dolor sit amet consectetur. Non feugiat imperdiet a vel sit at amet. Mi accumsan feugiat magna aliquam feugiat ac et. Pulvinar hendrerit id arcu at sed etiam semper mi hendrerit. Id aliquet quis quam.',
    price: 8.99,
    rating: 200,
    stars: 4
  ),
  FoodItem(
    imageName: 'asset/grafiken/icecream.png',
    name: 'Balu’s Cup',
    shortDescription: 'Pistachio ice cream',
    longDescription: 'Lorem ipsum dolor sit amet consectetur. Non feugiat imperdiet a vel sit at amet. Mi accumsan feugiat magna aliquam feugiat ac et. Pulvinar hendrerit id arcu at sed etiam semper mi hendrerit. Id aliquet quis quam.',
    price: 8.99,
    rating: 165,
    stars: 4
  ),
  FoodItem(
    imageName: 'asset/grafiken/icecream.png',
    name: 'Smiling David',
    shortDescription: 'Coffee ice cream',
    longDescription: 'Lorem ipsum dolor sit amet consectetur. Non feugiat imperdiet a vel sit at amet. Mi accumsan feugiat magna aliquam feugiat ac et. Pulvinar hendrerit id arcu at sed etiam semper mi hendrerit. Id aliquet quis quam.',
    price: 3.99,
    rating: 310,
    stars: 4
  ),
  FoodItem(
    imageName: 'asset/grafiken/icecream.png',
    name: 'Kai in a Cone',
    shortDescription: 'Vanilla ice cream',
    longDescription: 'Lorem ipsum dolor sit amet consectetur. Non feugiat imperdiet a vel sit at amet. Mi accumsan feugiat magna aliquam feugiat ac et. Pulvinar hendrerit id arcu at sed etiam semper mi hendrerit. Id aliquet quis quam.',
    price: 3.99,
    rating: 290,
    stars: 4
  ),
];
