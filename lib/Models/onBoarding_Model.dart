class BoardingModel {
  final String image;
  final String title;
  final String subtitle;
  final bool isShow;
  final double rate;

  BoardingModel(
      {required this.title,
      required this.image,
      required this.subtitle,
      required this.isShow,
      required this.rate});
}

List<BoardingModel> boarding = [
  BoardingModel(
      title: "What is Cancerapy?",
      image: "Images/cancer1.jpg",
      isShow: false,
      rate: 0.35,
      subtitle:
          "Cancerapy is a set of cancers to be diagnosed each, from three cancers available Skin, Breast, and Colorectal cancer. Using Computer Vision with CNN. "),
  BoardingModel(
      title: "Diagnosis Limits",
      isShow: false,
      rate: 0.65,
      image: "Images/cancer2.jpg",
      subtitle:
          "The AI Model tends to accomplish a great confidence decision about the image uploaded to be classified."),
  BoardingModel(
      title: "No Payments Requiered",
      isShow: true,
      rate: 1,
      image: "Images/cancer3.jpg",
      subtitle:
          "You don't have to pay anything for the services presented, From three categories choose your aimed one and upload the image and the results came in one second"),
];
