import 'package:demo_http/helpers/user_data_helper.dart';
import 'package:demo_http/models/user_data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserData> _allUserList = [];

  bool _isLoading = true;
  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future<void> _getData() async {
    _allUserList = await UserDataHelper().getAllUserData();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('http demo'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _allUserList.length,
              itemBuilder: ((ctx, index) => Text(
                    _allUserList[index].title!,
                  )),
            ),
    );
  }
}
