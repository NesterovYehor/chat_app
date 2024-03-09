class UserModel{
  final String email;
  final String username;

  UserModel({required this.email, required this.username});

  factory UserModel.fromFirestore(Map<String, dynamic> data){
    return UserModel(
      email: data["email"], 
      username: data["username"]
      );
  }

}