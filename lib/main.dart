import 'package:chat_flutter/data/user_dao.dart';
import 'package:chat_flutter/ui/login.dart';
import 'package:flutter/material.dart';
import 'ui/message_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import '../data/message_dao.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserDao(),
            lazy: false,
          ),
          Provider(
            create: (_) => MessageDao(),
            lazy: false,
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Chat',
          theme: ThemeData(primaryColor: const Color(0xFF3D814A)),
          home: Consumer<UserDao>(
            builder: (context, userDao, child) {
              if (userDao.isLoggedIn()) {
                return const MessageList();
              } else {
                return const Login();
              }
            },
          ),
        ));
  }
}
