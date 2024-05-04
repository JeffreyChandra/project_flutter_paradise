import 'package:e_commerce/checkout.dart';
import 'package:e_commerce/edit_password.dart';
import 'package:e_commerce/edit_profile.dart';
import 'package:e_commerce/home.dart';
import 'package:e_commerce/loginPage.dart';
import 'package:e_commerce/product_details.dart';
import 'package:e_commerce/provider_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:local_auth/local_auth.dart';
import 'package:e_commerce/widget/face_api.dart' as FaceApi hide Image;
import 'dart:convert';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await LocalAuthentication().authenticate(
        localizedReason: 'Please authenticate to enable biometric login',
      );
    } catch (e) {
      print(e);
    }
    if (!mounted) return;

    if (authenticated) {
      Provider.of<ProfileProvider>(context, listen: false).enableBiometric(0, true);
    }
  }

  bool _isBiometricAvailable = false;
  bool _isBiometricSupportedButNotEnabled = false;

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics = false;
    bool isDeviceSupported = false;
    try {
      canCheckBiometrics = await LocalAuthentication().canCheckBiometrics;
      isDeviceSupported = await LocalAuthentication().isDeviceSupported();
    } catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _isBiometricAvailable = canCheckBiometrics && isDeviceSupported;
      _isBiometricSupportedButNotEnabled = !canCheckBiometrics && isDeviceSupported;
    });
  }

  bool _isFaceSDKInitialized = false;

  Future<void> initPlatformState() async {
    var onInitialized = (json) {
      print(json);
      var response = jsonDecode(json);
      if (!response["success"]) {
        print("Init failed: ");
        print(json);
      } else {
        print("Init complete");
        setState(() {
          _isFaceSDKInitialized = true;
        });
      }
    };
    initialize(onInitialized);
  }

  Future<void> initialize(onInit(dynamic response)) async {
    var licenseData = await loadAssetIfExists("assets/regula.license");
    if (licenseData != null) {
      print('saya disini');
      var config = FaceApi.InitializationConfiguration();
      config.license = base64Encode(licenseData.buffer.asUint8List());
      FaceApi.FaceSDK.initializeWithConfig(config.toJson()).then(onInit);
    } else {
      FaceApi.FaceSDK.initialize().then(onInit);
    }
  }

  Future<ByteData?> loadAssetIfExists(String path) async {
    try {
      return await rootBundle.load(path);
    } catch (_) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _checkBiometrics();
    initPlatformState();
    const EventChannel('flutter_face_api/event/video_encoder_completion')
        .receiveBroadcastStream()
        .listen((event) {
      var completion = FaceApi.VideoEncoderCompletion.fromJson(json.decode(event))!;
      print("VideoEncoderCompletion:");
      print("    success:  ${completion.success}");
      print("    transactionId:  ${completion.transactionId}");
    });
    const EventChannel('flutter_face_api/event/onCustomButtonTappedEvent')
        .receiveBroadcastStream()
        .listen((event) {
      print("Pressed button with id: $event");
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    String username = profileProvider.account.isNotEmpty ? profileProvider.account[0].name : '';

    return Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Container(
              color: Color(0xFFDBDBDB),
              height: 1.0,
            ),
          ),
          title: Text('Profile'),
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF31323d),
          ),
          titleSpacing: 12,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                width: 1,
                                color: Color(0xFFDBDBDB),
                              )
                          )
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfile()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage("assets/images/pp-placeholder.webp"),
                                    radius: 30,
                                  ),
                                  SizedBox(width: 24),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        username,
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF31323d),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text('Edit profile',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF31323d),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 12),
                                child: Icon(Icons.navigate_next, color: Color(0xFFB1B1B1))
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditPassword()));
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  width: 1,
                                  color: Color(0xFFDBDBDB),
                                )
                            )
                        ),
                        padding: EdgeInsets.all(12),
                        child: Text("Change Password",
                          style: TextStyle(
                            color: Color(0xFF31323d),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      )
                  ),
                  InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  width: 1,
                                  color: Color(0xFFDBDBDB),
                                )
                            )
                        ),
                        padding: EdgeInsets.all(12),
                        child: Text("Orders",
                          style: TextStyle(
                            color: Color(0xFF31323d),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      )
                  ),
                  InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  width: 1,
                                  color: Color(0xFFDBDBDB),
                                )
                            )
                        ),
                        padding: EdgeInsets.all(12),
                        child: Text("Wishlist",
                          style: TextStyle(
                            color: Color(0xFF31323d),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      )
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: Color(0xFFDBDBDB),
                            )
                        )
                    ),
                    child: SwitchListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                      title: Text('Enable Biometric Login', style: TextStyle(
                        color: _isBiometricAvailable ? Color(0xFF31323d) : Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),),
                      value: profileProvider.account.isNotEmpty ? profileProvider.account[0].isBiometricEnabled : false,
                      subtitle: !_isBiometricAvailable ? Text('Device not supported', style: TextStyle(fontSize: 12),) :
                      _isBiometricSupportedButNotEnabled ? Text('Please enable biometrics from device settings', style: TextStyle(fontSize: 12),) : null,
                      onChanged: _isBiometricAvailable ? (bool value) {
                        if (value) {
                          _authenticate();
                        } else {
                          Provider.of<ProfileProvider>(context, listen: false).enableBiometric(0, false);
                        }
                      } : null,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: Color(0xFFDBDBDB),
                            )
                        )
                    ),
                    child: SwitchListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                      title: Text('Enable Face Unlock', style: TextStyle(
                        color: Color(0xFF31323d),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),),
                      value: profileProvider.account.isNotEmpty ? profileProvider.account[0].isFaceUnlockEnabled : false,
                      onChanged: _isFaceSDKInitialized? (bool value) {
                        if (value) {
                          FaceApi.FaceSDK.presentFaceCaptureActivity().then((result) {
                            print('Result : ${result}');
                            var response =
                            FaceApi.FaceCaptureResponse.fromJson(json.decode(result))!;
                            if (response.image != null && response.image!.bitmap != null)
                              Provider.of<ProfileProvider>(context, listen: false).enableFaceUnlock(0, true);
                              Provider.of<ProfileProvider>(context, listen: false).addFaceData(0, base64Decode(
                                  response.image!.bitmap!.replaceAll("\n", "")), FaceApi.ImageType.LIVE);
                          });
                        } else {
                          Provider.of<ProfileProvider>(context, listen: false).enableFaceUnlock(0, false);
                        }
                      } : null,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Checkout()));
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  width: 1,
                                  color: Color(0xFFDBDBDB),
                                )
                            )
                        ),
                        padding: EdgeInsets.all(12),
                        child: Text("Checkout (temp)",
                          style: TextStyle(
                            color: Color(0xFF31323d),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      )
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  width: 1,
                                  color: Color(0xFFDBDBDB),
                                )
                            )
                        ),
                        padding: EdgeInsets.all(12),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Log Out",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                              Icon(Icons.logout, color: Colors.red, size: 16)
                            ]
                        ),
                      )
                  )
                ]
            ),
          ),
        )
    );
  }
}