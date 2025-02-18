import 'package:movies_app/core/constants/app_assets.dart';

class OnboardingModel {
  final String imagePath;
  final String title;
  final String description;
  final String btnTitle;

  OnboardingModel(
      {required this.imagePath,
      required this.title,
      required this.description,
      this.btnTitle = "Next"});

  static List<OnboardingModel> onboardingList = [
    OnboardingModel(
        imagePath: AppAssets.onboardOne,
        title: "Find Your Next \nFavorite Movie Here",
        description:
            "Get access to a huge library of movies \nto suit all tastes. You will surely like it.",
        btnTitle: "Explore Now"),
    OnboardingModel(
        imagePath: AppAssets.onboardTwo,
        title: "Discover Movies",
        description:
            "Explore a vast collection of movies in all \nqualities and genres. Find your next \nfavorite film with ease.",
        btnTitle: "Next"),
    OnboardingModel(
        imagePath: AppAssets.onboardThree,
        title: "Explore All Genres",
        description:
            "Discover movies from every genre, in all \navailable qualities. Find something \nnew and exciting to watch every day.",
        btnTitle: "Next"),
    OnboardingModel(
        imagePath: AppAssets.onboardFour,
        title: "Create Watchlists",
        description:
            "Save movies to your watchlist to keep \ntrack of what you want to watch next. \nEnjoy films in various qualities and \ngenres.",
        btnTitle: "Next"),
    OnboardingModel(
        imagePath: AppAssets.onboardFive,
        title: "Rate, Review, and Learn",
        description:
            "Share your thoughts on the movies \nyou've watched. Dive deep into film \ndetails and help others discover great \nmovies with your reviews.",
        btnTitle: "Next"),
    OnboardingModel(
        imagePath: AppAssets.onboardSix,
        title: "Start Watching Now",
        description: "",
        btnTitle: "Finish")
  ];
}
