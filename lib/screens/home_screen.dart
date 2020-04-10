import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:worldclockapp/models/locations_data.dart';
import 'package:worldclockapp/models/world_clock_model.dart';
import 'package:worldclockapp/network/services.dart';
import 'choose_location_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WorldClock mWorldClockObj;
  bool isLoading = true;
  Location location = new LocationsData().list[0];

  fetchTimeFromNetwork() async {
    setState(() {
      isLoading = true;
    });
    WorldClock worldClockObj = await Services().getTime(location);
    setState(() {
      if (worldClockObj != null) {
        mWorldClockObj = worldClockObj;
      } else {
        print("Api Failed ...");
      }
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchTimeFromNetwork();
  }

  @override
  Widget build(BuildContext context) {

    navigateAndDisplayLocationsSelection(BuildContext context) async {
      location = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChooseLocationScreen()),
      );
      if(location != null) {
        fetchTimeFromNetwork();
      }
    }

    String getFormattedTime(DateTime time){
      return DateFormat.jm().format(time).toString();
    }

    String getImageAsset(WorldClock clock){
      if(clock == null){
        return 'assets/image_sun.png';
      }
      DateTime time = clock.dateTime;
      if(time.hour > 6 && time.hour < 20){
        return 'assets/image_sun.png';
      }
      return 'assets/image_moon.png';
    }

    Color getBackgroundColor(WorldClock clock){
      if(clock == null){
        return Colors.blue;
      }
      DateTime time = clock.dateTime;
      if(time.hour > 6 && time.hour < 20){
        return Colors.blue;
      }
      return Colors.black;
    }


    return Scaffold(
      backgroundColor: getBackgroundColor(mWorldClockObj),
      floatingActionButton: Visibility(
        visible: !isLoading,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: (){
            navigateAndDisplayLocationsSelection(context);
          },
          child: Icon(
            Icons.edit_location,
            color: getBackgroundColor(mWorldClockObj),
          ),
        ),
      ),
      body: isLoading
          ? Container(
              color: Colors.blue,
              child: Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
              ),
            )
          : SafeArea(
            child: Container(
                color: getBackgroundColor(mWorldClockObj),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(getImageAsset(mWorldClockObj),
                      width: 100,
                      height: 100),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                mWorldClockObj.timeZone,
                                style: TextStyle(
                                    fontFamily: 'ComicNeue',
                                    fontSize: 30.0,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                getFormattedTime(mWorldClockObj.dateTime),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'ComicNeue',
                                    fontSize: 60.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                mWorldClockObj.utcOffset,
                                style: TextStyle(
                                    fontFamily: 'ComicNeue',
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
          ),
    );
  }
}
