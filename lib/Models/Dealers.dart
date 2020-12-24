class Dealer {
  String name;
  int offers;
  String image;
  Dealer({
    this.name,
    this.image,
    this.offers,
  });
}

List<Dealer> getDealerList() {
  return <Dealer>[
    Dealer(
      name: "Hertz",
      offers: 174,
      image: "assets/images/hertz.png",
    ),
    Dealer(
      name: "Avis",
      offers: 126,
      image: "assets/images/avis.png",
    ),
    Dealer(
      name: "Tesla",
      offers: 89,
      image: "assets/images/tesla.jpg",
    ),
  ];
}
