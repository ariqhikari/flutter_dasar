import 'package:flutter/material.dart';
import 'package:my_first_flutter/ui/widgets/movie_box.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(initialPage: 0, viewportFraction: 0.6);
    List<String> urls = [
      "https://upload.wikimedia.org/wikipedia/en/3/3c/JumanjiTheNextLevelTeaserPoster.jpg",
      "http://www.impawards.com/2018/posters/black_panther_ver21_xlg.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/81%2BQBMFfHlL._AC_SL1500_.jpg",
      "https://m.media-amazon.com/images/M/MV5BMjMwNDkxMTgzOF5BMl5BanBnXkFtZTgwNTkwNTQ3NjM@._V1_UX182_CR0,0,182,268_AL_.jpg"
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Widget Slider"),
      ),
      body: PageView.builder(
        controller: controller,
        itemCount: urls.length,
        itemBuilder: (context, index) => Center(
          child: MovieBox(urls[index]),
        ),
      ),
    );
  }
}
