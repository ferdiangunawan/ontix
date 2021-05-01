part of 'pages.dart';

class MovieDetailPage extends StatelessWidget {
 final Movie movie;
  MovieDetailPage(this.movie);
  @override
  Widget build(BuildContext context) {
    MovieDetail movieDetail;
    List<Credit> credits;
    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(GoToMainPage());
        return;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          //warna StatusBar
          Container(
            color: accentColorGreenDark,
          ),
          //warna bg
          SafeArea(
            bottom: false,
            //bisa juga properti minimum: const EdgeInsets.all(16.0),
            child: Container(
              color: Color(0xffF6F7F9),
            ),
          ),
          ListView(children: <Widget>[
            FutureBuilder(
                future: MovieServices.getDetails(movie),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    movieDetail = snapshot.data;
                  }
                  return Column(
                    children: [
                      Stack(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Container(
                                height: 270,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(imageBaseUrl +
                                            "w780" +
                                            movie.backdropPath ??
                                        movie.posterPath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              //overlay
                              Container(
                                height: 271,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(0, 1),
                                    end: Alignment(0, 0.6),
                                    colors: [Colors.white, Colors.transparent],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //Back Button
                          Container(
                            margin:
                                EdgeInsets.only(top: 20, left: defaultMargin),
                            padding: EdgeInsets.all(1),
                            child: GestureDetector(
                              onTap: () {
                                context.read<PageBloc>().add(GoToMainPage());
                              },
                              child:
                                  Icon(Icons.arrow_back, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      //Judul
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            defaultMargin, 16, defaultMargin, 6),
                        child: Text(
                          movie.title,
                          style: blackTextFont.copyWith(fontSize: 24),
                        ),
                      ),
                      //Genre and Language
                      (snapshot.hasData)
                          ? Text(movieDetail.genreAndLanguage,
                              style: greyTextFont.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w300))
                          : SizedBox(
                              height: 50,
                              width: 50,
                              child: SpinKitFadingCircle(
                                color: mainColor,
                              ),
                            ),
                      //Rating
                      RatingStars(
                          voteAverage: movie.voteAverage,
                          alignmentRow: MainAxisAlignment.center,
                          colorAngka: accentColorGreenDark),

                      SizedBox(height: 24),

                      //Credits
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin:
                              EdgeInsets.only(left: defaultMargin, bottom: 12),
                          child: Text(
                            "Cast and Crew",
                            style: blackTextFont.copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                      //Card cast and Crew
                      FutureBuilder(
                          future: MovieServices.getCredits(movie.id),
                          builder: (_, snapshot) {
                            if (snapshot.hasData) {
                              credits = snapshot.data;

                              return SizedBox(
                                height: 115,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: credits.length,
                                    itemBuilder: (_, index) => Container(
                                        margin: EdgeInsets.only(
                                            left: (index == 0)
                                                ? defaultMargin
                                                : 0,
                                            right: (index == credits.length - 1)
                                                ? defaultMargin
                                                : 16),
                                        child: CreditCard(credits[index]))),
                              );
                            } else {
                              return SpinKitFadingCircle(
                                  size: 50, color: accentColorGreenDark);
                            }
                          }),
                      //Storyline
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            defaultMargin, 24, defaultMargin, 8),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Storyline",
                              style: blackTextFont.copyWith(fontSize: 14)),
                        ),
                      ),

                      Container(
                          margin: EdgeInsets.fromLTRB(
                              defaultMargin, 0, defaultMargin, 30),
                          child: Text(movie.overview,
                              style: greyTextFont.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w400))),

                      //Button
                      Container(
                        height: 45,
                        width: 250,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: mainColor,
                              onPrimary: Colors.yellow,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: Text("Continue to Book",
                              style: whiteTextFont.copyWith(fontSize: 16)),
                          onPressed: () {
                            context
                                .read<PageBloc>()
                                .add(GoToSelectSchedulePage(movieDetail));
                          },
                        ),
                      ),
                      SizedBox(height: 100),
                    ],
                  );
                })
          ]),
        ]),
      ),
    );
  }
}
