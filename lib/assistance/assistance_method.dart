

import 'package:geolocator/geolocator.dart';
import 'package:users/assistance/request_assistance.dart';
import 'package:users/modeles/direction.dart';
const GOOGLE_API_KEY = "AIzaSyDNZMjI6BykptQrTCZJiPX2iEwBmd9UZUU";

class AssistanceMethod {

static Future<String>searchAddressGeoGraphicordinater(Position position,context) async {
String apiurl =  'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$GOOGLE_API_KEY';
String humanReadableAddress = "";

var requestResponse = await RequestAssistance.receiveRequest(apiurl);
if (requestResponse!= 'erroe occured'){
   humanReadableAddress = requestResponse["results"][0]["formatted_address"];

   Direction userPickupAddress = Direction();
   userPickupAddress.locationLatitude = position.latitude as String?;
   userPickupAddress.locationLongitude = position.longitude as String?;
   userPickupAddress.locationName = humanReadableAddress; 

}
return humanReadableAddress;
}


}










// static Future<String> getPlaceAddress(double lat, double lng) async {
// final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY';
// final response = await http.get(Uri.parse(url));
//
// if (response.statusCode == 200) {
// final jsonResponse = json.decode(response.body);
// if (jsonResponse['results'].isNotEmpty) {
// return jsonResponse['results'][0]['formatted_address'];
// } else {
// return 'No address found';
// }
// } else {
// throw Exception('Failed to load address');
// }
// }