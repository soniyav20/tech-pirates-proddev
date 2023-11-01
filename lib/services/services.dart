abstract class Services {
  Future<void> resetPass({String? email});
  Future<void> signin({String? mail, String? pass});
  Future<void> signout();
  Future<void> signup({String? name, String? mail, String? pass});
  Future<void> postMemory(String memory, double? latitude, double? logitude,
      String? address, String imageUrl);
}
