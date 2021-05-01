part of 'pages.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //Header
        Container(
          decoration: BoxDecoration(
            color: accentColorGreenDark,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 30),
          child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
            if (userState is UserLoaded) {
              if (imageFileToUpload != null) {
                uploadImage(imageFileToUpload).then((downloadUrl) {
                  imageFileToUpload = null;
                  BlocProvider.of<UserBloc>(context)
                      .add(UpdateData(profileImage: downloadUrl));
                });
              }
              return Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xff428688), width: 1)),
                    child: Stack(
                      children: <Widget>[
                        SpinKitFadingCircle(
                          color: Colors.yellowAccent,
                          size: 50,
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<PageBloc>()
                                .add(GoToProfileDetailPage());
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: (userState.users.profilePicture == "")
                                    ? AssetImage("assets/user_pic.png")
                                    : NetworkImage(
                                        userState.users.profilePicture),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              2 * defaultMargin -
                              78,
                          child: Text(userState.users.name,
                              style: whiteTextFont.copyWith(fontSize: 19),
                              maxLines: 1,
                              overflow: TextOverflow.clip),
                        ),
                        Text(
                            NumberFormat.currency(
                                    locale: "id_ID",
                                    decimalDigits: 0,
                                    symbol: "IDR ")
                                .format(userState.users.balance),
                            style: yellowNumberFont.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400))
                      ])
                ],
              );
            } else {
              return SpinKitFadingCircle(
                color: mainColor,
                size: 50,
              );
            }
          }),
        ),
        //note: Now Playing
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
          child: Text("Now Playing",
              style: blackTextFont.copyWith(
                  fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 140,
          child: BlocBuilder<MovieBloc, MovieState>(builder: (_, movieState) {
            if (movieState is MovieLoaded) {
              List<Movie> movies = movieState.movies.sublist(0, 10);
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (_, index) => Container(
                        margin: EdgeInsets.only(
                            left: (index == 0) ? defaultMargin : 0,
                            right: (index == movies.length - 1)
                                ? defaultMargin
                                : 16), //16 itu jarak antar card
                        child: MovieCard(
                          movies[index],
                          onTap: () {
                            context
                                .read<PageBloc>()
                                .add(GoToMovieDetailPage(movies[index]));
                          },
                        ),
                      ));
            } else {
              return SpinKitFadingCircle(color: mainColor, size: 50);
            }
          }),
        ),
        // note: Browse Movie
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
          child: Text("Browse Movie",
              style: blackTextFont.copyWith(
                  fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
          if (userState is UserLoaded) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    userState.users.selectedGenres.length,
                    (index) =>
                        BrowseButton(userState.users.selectedGenres[index])),
              ),
            );
          } else {
            return SpinKitFadingCircle(
              size: 60,
              color: mainColor,
            );
          }
        }),
        //note: Coming Soon
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
          child: Text("Coming Soon",
              style: blackTextFont.copyWith(
                  fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 140,
          child: BlocBuilder<MovieBloc, MovieState>(builder: (_, movieState) {
            if (movieState is MovieLoaded) {
              List<Movie> movies = movieState.movies.sublist(10);
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (_, index) => Container(
                        margin: EdgeInsets.only(
                            left: (index == 0) ? defaultMargin : 0,
                            right: (index == movies.length - 1)
                                ? defaultMargin
                                : 16), //16 itu jarak antar card
                        child: ComingSoonCard(movies[index]),
                      ));
            } else {
              return SpinKitFadingCircle(color: mainColor, size: 50);
            }
          }),
        ),
        //note: Get Lucky Day
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
          child: Text("Get Lucky Day",
              style: blackTextFont.copyWith(
                  fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        Column(
          children: dummyPromos
              .map((e) => Padding(
                    padding: EdgeInsets.fromLTRB(
                        defaultMargin, 0, defaultMargin, 16),
                    child: PromoCard(e),
                  ))
              .toList(),
        ),
        SizedBox(height: 100)
      ],
    );
  }
}
