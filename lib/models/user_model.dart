class UserModel{
  final String email;
  final String username;
  final String userId;

  UserModel({required this.email, required this.username, required this.userId});

  factory UserModel.fromFirestore(Map<String, dynamic> data){
    return UserModel(
      email: data["email"], 
      username: data["username"],
      userId: data['userId'],
      );
  }

}