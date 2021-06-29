import 'package:flutter/material.dart';

class AppPreferences {
  static void showSnackBar(String value, GlobalKey<ScaffoldState> scaffold) {
    scaffold.currentState.showSnackBar(new SnackBar(content: new Text(value)));
  }
}

/*

   loadFav() async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.clear();

    String checkCalls = prefs.getString("fav2") ?? null;

    if (checkCalls != null) {
      favList = (json.decode(checkCalls) as List)
          .map((call) => CatContentModel.fromJson(call))
          .toList();
      setState(() {
        fuck = true;
      });
    } else {
      setState(() {
        favList = [];
      });
    }
    // print(checkCalls.toString());
  }

  removeProduct(int index) async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.clear();

    List<CatContentModel> favList = [];
    String checkCalls = prefs.getString("fav2") ?? null;

    if (checkCalls != null) {
      favList = (json.decode(checkCalls) as List)
          .map((call) => CatContentModel.fromJson(call))
          .toList();
    }

    var existingCall = favList.firstWhere(
        (favCall) => favCall.id == favList[index].id,
        orElse: () => null);
    // print("exit call = " + existingCall.toString());
    if (favList[index].isFavorite) {
      if (existingCall == null) {
        favList.add(favList[index]);
      } else {
        if (existingCall != null) {
          favList.removeWhere((favCall) => favCall.id == favList[index].id);
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 0),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    animation = CurvedAnimation(
                        parent: animation, curve: Curves.elasticInOut);
                    return ScaleTransition(
                      alignment: Alignment.center,
                      scale: animation,
                      child: child,
                    );
                  },
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return FavoriteScreen2();
                  }));
        }
      }
    }

    String encodeCalls = json.encode(
      favList.map<Map<String, dynamic>>((call) => call.toMap(call)).toList(),
    );
    // print(encodeCalls);
    prefs.setString("fav2", encodeCalls);
  }

  checkFav() async {
    prefs = await SharedPreferences.getInstance();
    String prebString = "fav";
    // prefs.clear();
    if (Data.currentCatUrl != "1") prebString += Data.currentCatUrl;

    checkCalls = prefs.getString(prebString) ?? null;

    if (checkCalls != null) {
      favList = (json.decode(checkCalls) as List)
          .map((call) => CatContentModel.fromJson(call))
          .toList();
      loadFav();
    } else {
      favList = [];
      setState(() {
        fuck = true;
      });
    }
  }

  saveProduct(int index) async {
    final prefs = await SharedPreferences.getInstance();
    String prebString = "fav";
    // prefs.clear();
    if (Data.currentCatUrl != "1") prebString += Data.currentCatUrl;

    List<CatContentModel> favList2 = <CatContentModel>[];
    String checkCalls2 = (prefs.getString(prebString) ?? null);

    if (checkCalls2 != null) {
      favList2 = (json.decode(checkCalls2) as List)
          .map((call) => CatContentModel.fromJson(call))
          .toList();
    }

    var existingCall = favList2.firstWhere(
        (favCall) => favCall.id == Data.catContentItems[index].id,
        orElse: () => null);

    if (Data.catContentItems[index].isFavorite) {
      if (existingCall == null) {
        favList2.add(Data.catContentItems[index]);
      }
    } else {
      if (existingCall != null) {
        favList2.removeWhere(
            (favCall) => favCall.id == Data.catContentItems[index].id);
      }
    }

    String encodeCalls = json.encode(
      favList2.map<Map<String, dynamic>>((call) => call.toMap(call)).toList(),
    );
    // print(encodeCalls);
    prefs.setString(prebString, encodeCalls);

    checkCalls = prefs.getString(prebString) ?? null;

    if (checkCalls != null) {
      favList = (json.decode(checkCalls) as List)
          .map((call) => CatContentModel.fromJson(call))
          .toList();
    }
  }

  void loadFav() {
    int i = 0;

    while (isFav != true) {
      // print("lenght " +
      //     Data.catContentItems.length.toString() +
      //     " j " +
      //     i.toString());
      if (i < Data.catContentItems.length) {
        var existingCall = favList.firstWhere(
            (favCall) => favCall.id == Data.catContentItems[i].id,
            orElse: () => null);

        if (existingCall != null) {
          Data.catContentItems[i].isFavorite = true;
        }
      } else {
        isFav = true;
        // print("is fav = true");
      }
      i++;
    }
    setState(() {
      fuck = true;
    });
  }

*/
