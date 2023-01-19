import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:http_flutter/screens/home/components/body.dart';

import 'package:http_flutter/config/http_request.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // CollectionReference products = firestore.collection('products');

    var product = getAllProduct();
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Hydropho'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            // physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Product',
                      style: TextStyle(fontSize: 64),
                    ),
                    IconButton(
                        onPressed: (() => setState(() {})),
                        icon: const Icon(Icons.refresh))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // StreamBuilder(
                //   stream: products.snapshots(),
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       return ListView.builder(
                //         itemCount: snapshot.data!.docs.length,
                //         itemBuilder: (context, index) {
                //           var product =
                //               snapshot.data!.docs.elementAt(index).data;
                //           return ListTile();
                //         },
                //       );
                //     } else {
                //       return const CircularProgressIndicator();
                //     }
                //   },
                // ),
                FutureBuilder(
                  future: product,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        List<dynamic> decoded = jsonDecode(snapshot.data!.body);
                        if (decoded.isNotEmpty) {
                          return ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: decoded.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Slidable(
                                  key: Key('${decoded[index]['id']}'),
                                  endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SlidableAction(
                                        borderRadius: BorderRadius.circular(12),
                                        onPressed: (context) async {
                                          editProduct(
                                              context, decoded[index] as Map);
                                        },
                                        backgroundColor: Colors.orange,
                                        foregroundColor: Colors.white,
                                        icon: Icons.edit,
                                        label: 'Edit',
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SlidableAction(
                                        borderRadius: BorderRadius.circular(12),
                                        onPressed: (context) async {
                                          await deleteProduct(
                                              decoded[index]['id']);
                                          setState(() {});
                                        },
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                        label: 'Delete',
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).backgroundColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    // height: ,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                decoded[index]['name'],
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Rp. ${decoded[index]['price']}',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'x ${decoded[index]['quantity']}',
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: Text('There is no data available!'),
                          );
                        }
                      } else {
                        return const CircularProgressIndicator();
                      }
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          addProduct(context);
        },
      ),
    );
  }

  Future addProduct(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController quantityController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add Product'),
            content: SizedBox(
              height: 210,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Price is required';
                        }
                        return null;
                      },
                      controller: priceController,
                      decoration: const InputDecoration(
                        hintText: 'Price',
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Quantity is required';
                        }
                        return null;
                      },
                      controller: quantityController,
                      decoration: const InputDecoration(
                        hintText: 'Quantity',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    // Do function
                    await insertProduct(
                        name: nameController.text,
                        price: int.parse(priceController.text),
                        quantity: int.parse(quantityController.text));

                    // Set state
                    setState(() {});

                    // Clear input field
                    nameController.clear();
                    priceController.clear();
                    quantityController.clear();

                    Navigator.pop(context);
                  }
                },
                child: const Text('Add'),
              ),
            ],
          );
        });
  }

  Future editProduct(BuildContext context, Map data) {
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController quantityController = TextEditingController();
    nameController.text = data['name'].toString();
    priceController.text = data['price'].toString();
    quantityController.text = data['quantity'].toString();

    final formKey = GlobalKey<FormState>();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Edit Product'),
            content: SizedBox(
              height: 210,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Price is required';
                        }
                        return null;
                      },
                      controller: priceController,
                      decoration: const InputDecoration(
                        hintText: 'Price',
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Quantity is required';
                        }
                        return null;
                      },
                      controller: quantityController,
                      decoration: const InputDecoration(
                        hintText: 'Quantity ',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    // Do function
                    await updateProduct(
                        id: data['id'],
                        name: nameController.text,
                        price: int.parse(priceController.text),
                        quantity: int.parse(quantityController.text));

                    // Set state
                    setState(() {});

                    // Clear input field
                    nameController.clear();
                    priceController.clear();
                    quantityController.clear();

                    Navigator.pop(context);
                  }
                },
                child: const Text('Edit'),
              ),
            ],
          );
        });
  }
}
