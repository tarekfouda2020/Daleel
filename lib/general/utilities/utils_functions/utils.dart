part of 'UtilsImports.dart';

class Utils {
  static Future<void> manipulateSplashData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await GeneralRepository(context).getCategories();
    UserRepository(context).getSettings(false);
    var strUser = prefs.get("user");
    if (strUser != null) {
      UserModel data = UserModel.fromMap(json.decode("$strUser"));
      GlobalState.instance.set("token", data.token);
      changeLanguage(data.lang ?? "ar", context);
      setCurrentUserData(data, context);
    } else {
      changeLanguage("ar", context);
      context.router.push(LoginRoute());
    }
  }

  static void setCurrentUserData(UserModel model, BuildContext context) async {
    context.read<UserCubit>().onUpdateUserData(model);
    AutoRouter.of(context).push(HomeRoute());
  }

  static Future<void> saveUserData(UserModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", json.encode(model.toMap()));
  }

  static void changeLanguage(String lang, BuildContext context) {
    context.read<LangCubit>().onUpdateLanguage(lang);
  }

  static UserModel getSavedUser({required BuildContext context}) {
    return context.read<UserCubit>().state.model;
  }

  static Future<String?> getDeviceId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("deviceId");
  }

  static Future<void> setDeviceId(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("deviceId", token);
  }

  static void clearSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static void launchURL({required String url}) async {
    if (!url.toString().startsWith("https")) {
      url = "https://" + url;
    }
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      LoadingDialog.showToastNotification("من فضلك تآكد من الرابط");
    }
  }

  static void launchWhatsApp(phone) async {
    String message = 'Welcome';
    var _whatsAppUrl = "https://api.whatsapp.com/send?phone=$phone&text=$message";
    print(_whatsAppUrl);
    await launch(_whatsAppUrl);
  }

  static void launchYoutube({required String url}) async {
    if (Platform.isIOS) {
      if (await canLaunch('$url')) {
        await launch('$url', forceSafariVC: false);
      } else {
        if (await canLaunch('$url')) {
          await launch('$url');
        } else {
          throw 'Could not launch $url';
        }
      }
    } else {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  static void callPhone({phone}) async {
    await launch("tel:$phone");
  }

  static void sendMail(mail) async {
    await launch("mailto:$mail");
  }

  static void shareApp(url) {
    LoadingDialog.showLoadingDialog();
    Share.share(url).whenComplete(() {
      EasyLoading.dismiss();
    });
  }

  static Future<File?> getImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);

    if (result != null) {
      List<File> files = result.paths.map((path) => File("$path")).toList();
      return files.first;
    } else {
      return null;
    }
  }

  static Future<List<File>> getImages() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);

    if (result != null) {
      List<File> files = result.paths.map((path) => File("$path")).toList();
      return files;
    } else {
      return [];
    }
  }

  static Future<File?> getVideo() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.video);

    if (result != null) {
      List<File> files = result.paths.map((path) => File("$path")).toList();
      return files.first;
    } else {
      return null;
    }
  }

  static void copToClipboard(
      {required String text, required GlobalKey<ScaffoldState> scaffold}) {
    if (text.trim().isEmpty) {
      LoadingDialog.showToastNotification("لا يوجد بيانات للنسخ");
      return;
    } else {
      Clipboard.setData(ClipboardData(text: "$text")).then((value) {
        LoadingDialog.showToastNotification("تم النسخ بنجاح");
      });
    }
  }

  static Future<bool> askForPermission(Location location) async {
    var permission = await location.hasPermission();
    if (permission == PermissionStatus.deniedForever) {
      return false;
    } else if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission == PermissionStatus.denied ||
          permission == PermissionStatus.deniedForever) {
        return false;
      }
    }
    return true;
  }

  static Future<LocationData> getCurrentLocation() async {
    final location = new Location();
    bool permission = await askForPermission(location);
    LocationData? current;
    if (permission) {
      current = await location.getLocation();
    }
    return current ?? LocationData.fromMap({"latitude": 0, "longitude": 0});
  }

  static Future<String> getAddress(LatLng latLng, BuildContext context) async {
    final coordinates = new Coordinates(latLng.latitude, latLng.longitude);
    List<Address> addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");
    return first.addressLine;
  }

  static void navigateToLocationAddress(
      BuildContext context, LocationCubit locCubit) async {
    // FocusScope.of(context).requestFocus(FocusNode());
    // LoadingDialog.showLoadingDialog();
    // var current = await Utils.getCurrentLocation();
    // LocationModel locationModel = locCubit.state.model;
    // locationModel =
    //     LocationModel("${current.latitude}", "${current.longitude}", "");
    // double lat = double.parse(locationModel.lat);
    // double lng = double.parse(locationModel.lng);
    // String address = await getAddress(LatLng(lat, lng), context);
    // locationModel.address = address;
    // locCubit.onLocationUpdated(locationModel);
    // EasyLoading.dismiss();
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (cxt) => BlocProvider.value(
          value: locCubit,
          child: LocationAddress(),
        ),
      ),
    );
  }

  static void navigateToMapWithDirection(
      {required String lat, required String lng, required String title}) async {
    final availableMaps = await MapLauncher.installedMaps;
    LocationData loc = await getCurrentLocation();
    if (availableMaps.length > 0) {
      await availableMaps.first.showDirections(
        destinationTitle: title,
        origin: Coords(loc.latitude!, loc.longitude!),
        destination: Coords(double.parse(lat), double.parse(lng)),
      );
    } else {
      LoadingDialog.showSimpleToast("قم بتحميل خريطة جوجل");
    }
  }

  static String convertDigitsToLatin(String s) {
    var sb = new StringBuffer();
    for (int i = 0; i < s.length; i++) {
      switch (s[i]) {
        //Arabic digits
        case '\u0660':
          sb.write('0');
          break;
        case '\u0661':
          sb.write('1');
          break;
        case '\u0662':
          sb.write('2');
          break;
        case '\u0663':
          sb.write('3');
          break;
        case '\u0664':
          sb.write('4');
          break;
        case '\u0665':
          sb.write('5');
          break;
        case '\u0666':
          sb.write('6');
          break;
        case '\u0667':
          sb.write('7');
          break;
        case '\u0668':
          sb.write('8');
          break;
        case '\u0669':
          sb.write('9');
          break;
        default:
          sb.write(s[i]);
          break;
      }
    }
    return sb.toString();
  }
}
