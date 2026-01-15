class NatureTile {
  String image;
  String name;
  String location;
  bool isfavorite;

  NatureTile(
    {
      required this.image,
      required this.location,
      required this.name,
      this.isfavorite = false
    }
  );
}

List<NatureTile> natures = [
  NatureTile(
    image: 'assets/images/nature13.jpeg',
    name: 'Mountain Peak',
    location: 'Swiss Alps',
  ),
  NatureTile(
    image: 'assets/images/nature14.jpeg',
    name: 'Forest River',
    location: 'Amazon Rainforest',
  ),
  NatureTile(
    image: 'assets/images/nature15.jpeg',
    name: 'Tropical Beach',
    location: 'Bali, Indonesia',
  ),
  NatureTile(
    image: 'assets/images/nature4.jpeg',
    name: 'Autumn Valley',
    location: 'Canada',
  ),
  NatureTile(
    image: 'assets/images/nature4.jpeg',
    name: 'Autumn Valley',
    location: 'Canada',
  ),
  NatureTile(
    image: 'assets/images/nature4.jpeg',
    name: 'Autumn Valley',
    location: 'Canada',
  ),
];