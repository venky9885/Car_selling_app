class SliderModel {
  String title;
  String desc;
  String imageAssetPath;

  SliderModel({this.title, this.desc});

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  sliderModel.setTitle('CarsFin');
  sliderModel
      .setDesc('Welcome to CarsFin. Best place for buying and selling Cars');
  sliderModel.setImageAssetPath('assets/images/logo.png');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.setTitle('Finance');
  sliderModel.setDesc('We provide Car Finance services.');
  sliderModel.setImageAssetPath('assets/images/land_rover_0.png');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.setTitle('Search');
  sliderModel.setDesc('Search among thousand of Cars. The choice is yours.');
  sliderModel.setImageAssetPath('assets/images/search.png');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.setTitle('Sell Car');
  sliderModel.setDesc('Sell you Car in just few Clicks ');
  sliderModel.setImageAssetPath('assets/images/sell.png');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.setTitle('Support');
  sliderModel.setDesc('24x7 help and support from team CarsFin');
  sliderModel.setImageAssetPath('assets/images/support.png');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
