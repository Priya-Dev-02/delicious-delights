import 'package:flutter/material.dart';
import 'package:receipe_app/constant.dart';
import 'package:receipe_app/video_player_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class DetailsScreen extends StatefulWidget {
  final String name, image, calories, time, reci, price, videoUrl;
  final List<String> ingredients;
  DetailsScreen(this.name, this.image, this.calories, this.time, this.reci,
      this.price, this.ingredients, this.videoUrl);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();

}

class _DetailsScreenState extends State<DetailsScreen> {
  void _playVideo(BuildContext context, String videoUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPlayerScreen(videoUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KLightColor,
      bottomNavigationBar: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          height: 58.0,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 32.0),
          decoration: BoxDecoration(
            color: KOrangeColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28.0),
              topRight: Radius.circular(28.0),
            ),
          ),
          child: Text(
            "Back",
            style: TextStyle(
                fontSize: 24.0,
                fontFamily: "OpenSans-Regular",
                color: KLightColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: 64.0,
            left: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 28.0),
                  decoration: BoxDecoration(
                      color: KOrangeColor,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: IconButton(
                    icon: Icon(
                      Icons.star,
                      color: KLightColor,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                  widget.name,
                  style: TextStyle(fontSize: 36.0, fontFamily: "OpenSans-Bold"),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "\₹",
                      style: TextStyle(fontSize: 25.0, color: KOrangeColor),
                    ),
                    TextSpan(
                      text: widget.price,
                      style: TextStyle(fontSize: 25.0, color: KOrangeColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Calories",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontFamily: "OpenSans-Bold",
                            ),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            widget.calories,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "OpenSans-Bold",
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 36.0,
                          ),
                          Text(
                            "Time",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontFamily: "OpenSans-Bold",
                            ),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            widget.time,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "OpenSans-Bold",
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 36.0,
                          ),
                          Text(
                            "Total Serve",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontFamily: "OpenSans-Bold",
                            ),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            "2 Serving",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "OpenSans-Bold",
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      widget.image,
                      height: 250.0,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                "Ingredients:",
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  widget.ingredients.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: KOrangeColor,
                        ),
                        SizedBox(width: 8.0),
                        Flexible(
                          child: Text(
                            widget.ingredients[index],
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                "Recipe:",
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 28.0, bottom: 28.0),
                child: Text(
                  widget.reci,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              Center(child: SizedBox(height: 32.0)),
              ElevatedButton(
                onPressed: () {
                  _playVideo(context, widget.videoUrl);
                },
                child: Text('Watch Video Tutorial'),
              ),

              ],
          ),
        ),
      ),
    );
  }
}
