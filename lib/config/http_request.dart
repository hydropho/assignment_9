import 'dart:convert';

import 'package:http/http.dart' as http;

// Local address, this is not static change it manually.
String _localAddress = "http://192.168.96.71:8081/api";

Future<http.Response> getAllProduct() async {
  var result = await http.get(Uri.parse("$_localAddress/getAllProduct"));

  return result;
}

Future<http.Response> getSelectedProduct(int id) async {
  var result =
      await http.get(Uri.parse("$_localAddress/getSelectedProduct/$id"));

  return result;
}

Future<http.Response> insertProduct({
  required String name,
  required int price,
  required int quantity,
}) async {
  // Take product data from parameter
  var product = <String, Object>{
    'name': name,
    'price': price,
    'quantity': quantity,
  };

  var result = await http.post(
    Uri.parse("$_localAddress/insertProduct"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(product),
  );

  return result;
}

Future<http.Response> updateProduct({
  required int id,
  required String name,
  required int price,
  required int quantity,
}) async {
  // Take product data from parameter
  var product = <String, Object>{
    'name': name,
    'price': price,
    'quantity': quantity,
  };

  var result = await http.put(
    Uri.parse("$_localAddress/updateProduct/$id"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(product),
  );

  return result;
}

Future<http.Response> deleteProduct(int id) async {
  var result = await http.delete(Uri.parse("$_localAddress/deleteProduct/$id"));

  return result;
}


// class NetworkingHttpApp extends StatefulWidget {
//   const NetworkingHttpApp({super.key});

//   @override
//   State<NetworkingHttpApp> createState() => _NetworkingHttpAppState();
// }

// class _NetworkingHttpAppState extends State<NetworkingHttpApp> {
//   final data = getAllProduct();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'JSON Data',
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           elevation: 0,
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.person,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//           backgroundColor: Colors.transparent,
//           systemOverlayStyle: const SystemUiOverlayStyle(
//             statusBarColor: Colors.transparent,
//             statusBarIconBrightness: Brightness.dark,
//           ),
//         ),
//         body: FutureBuilder<http.Response>(
//           future: getAllProduct(),
//           builder: (context, snapshot) {
//             // print(decoded);
//             if (snapshot.hasData) {
//               List<dynamic> decoded = jsonDecode(snapshot.data!.body);
//               return ListView.builder(
//                 itemCount: decoded.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(decoded[index]['name']),
//                     subtitle: Text('${decoded[index]['price']}'),
//                     onTap: () {},
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.edit),
//                           onPressed: () {
//                             // updateData(decoded[index]['id']);
//                           },
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.delete),
//                           onPressed: () {
//                             setState(() {
//                               deleteProduct(decoded[index]['id']);
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               postData();
//             });
//           },
//           child: const Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }
