class SchoolUser {
  final String schoolId;
  final String schoolName;
  final String email;
  final String mobile;
  final String token;
  final String username;
  final String address;
  final String city;
  final String state;
  final String pincode;
  final bool isActive;

  const SchoolUser({
    required this.schoolId,
    required this.schoolName,
    required this.email,
    required this.mobile,
    required this.token,
    required this.username,
    required this.address,
    required this.city,
    required this.state,
    required this.pincode,
    required this.isActive,
  });

  /// Factory constructor to map API JSON → SchoolUser
  factory SchoolUser.fromJson(Map<String, dynamic> json) {
    final data = json['session_data'] ?? json;

    return SchoolUser(
      schoolId: data['school_id']?.toString() ?? '',
      schoolName: data['school_name']?.toString() ?? '',
      email: data['email']?.toString() ?? '',
      mobile: data['mobile']?.toString() ?? '',
      username: data['username']?.toString() ?? '',
      address: data['address']?.toString() ?? '',
      city: data['city']?.toString() ?? '',
      state: data['state']?.toString() ?? '',
      pincode: data['pincode']?.toString() ?? '',
      token: json['token']?.toString() ?? '',
      isActive: (data['status']?.toString() ?? '1') == '1',
    );
  }

  /// Convert model → JSON (useful for caching later)
  Map<String, dynamic> toJson() {
    return {
      'school_id': schoolId,
      'school_name': schoolName,
      'email': email,
      'mobile': mobile,
      'username': username,
      'address': address,
      'city': city,
      'state': state,
      'pincode': pincode,
      'token': token,
      'is_active': isActive,
    };
  }
}
