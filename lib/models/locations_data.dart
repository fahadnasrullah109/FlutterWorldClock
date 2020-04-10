class Location {
  String locationName;
  String locationSubUrl;
  String flag;

  Location({this.locationName, this.locationSubUrl, this.flag});
}

class LocationsData {
  List<Location> list = [
    Location(locationName: "Karachi", locationSubUrl: "Asia/Karachi", flag: ""),
    Location(locationName: "London", locationSubUrl: "Europe/London", flag: ""),
    Location(locationName: "Berlin", locationSubUrl: "Europe/Berlin", flag: ""),
    Location(locationName: "New York", locationSubUrl: "America/New_York", flag: ""),
    Location(locationName: "Rome", locationSubUrl: "Europe/Rome", flag: ""),
    Location(locationName: "Istanbul", locationSubUrl: "Europe/Istanbul", flag: ""),
    Location(locationName: "Amsterdam", locationSubUrl: "Europe/Amsterdam", flag: ""),
    Location(locationName: "Tokyo", locationSubUrl: "Asia/Tokyo", flag: ""),
    Location(locationName: "Kuala Lumpur", locationSubUrl: "Asia/Kuala_Lumpur", flag: ""),
    Location(locationName: "Dubai", locationSubUrl: "Asia/Dubai", flag: ""),
    Location(locationName: "Riyadh", locationSubUrl: "Asia/Riyadh", flag: ""),
    Location(locationName: "Melbourne", locationSubUrl: "Australia/Melbourne", flag: ""),
    Location(locationName: "Sydney", locationSubUrl: "Australia/Sydney", flag: ""),
    Location(locationName: "Los Angeles", locationSubUrl: "America/Los_Angeles", flag: ""),
    Location(locationName: "Havana", locationSubUrl: "America/Havana", flag: "")
  ];
}