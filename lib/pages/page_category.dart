import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_uwang/model/categories.dart';
import 'package:flutter_uwang/model/database.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool isExpense = true;
  int type = 2;
  final AppDb database = AppDb();
  TextEditingController categoryNameController = TextEditingController();

  Future insert(String name, int type) async {
    DateTime now = DateTime.now();
    final row = await database.into(database.categories).insert(
        CategoriesCompanion.insert(
            name: name, type: type, creating: now, updating: now));
    print('Masuk:' + row.toString());
  }

  Future update(int categoryId, String newName) async {
    return await database.updateCategoryRepo(categoryId, newName);
  }

  Future<List<Category>> getAllCategory(int type) async {
    return await database.getAllCategoryRepo(type);
  }

  void openMessage(Category? category) {
    if (category != null) {
      categoryNameController.text = category.name;
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Center(
                  child: Column(
                children: [
                  Text(
                    (isExpense) ? "Add Expense" : "Add Income",
                    style: GoogleFonts.montserrat(
                        fontSize: 18,
                        color: (isExpense) ? Colors.red : Colors.green),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: categoryNameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Name"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (category == null) {
                          insert(
                              categoryNameController.text, isExpense ? 2 : 1);
                        } else {
                          update(category.id, categoryNameController.text);
                        }
                        Navigator.of(context, rootNavigator: true)
                            .pop('dialog');
                        setState(() {});
                        categoryNameController.clear();
                      },
                      child: Text("Save"))
                ],
              )),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Switch(
                  value: isExpense,
                  onChanged: (bool value) {
                    setState(() {
                      isExpense = value;
                      type = value ? 2 : 1;
                    });
                  },
                  inactiveTrackColor: Colors.green[200],
                  inactiveThumbColor: Colors.green,
                  activeColor: Colors.red,
                ),
                IconButton(
                    onPressed: () {
                      openMessage(null);
                    },
                    icon: Icon(Icons.add))
              ],
            ),
          ),
          FutureBuilder<List<Category>>(
              future: getAllCategory(type),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    if (snapshot.data!.length > 0) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Card(
                                elevation: 10,
                                child: ListTile(
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            database.deleteCategoryRepo(
                                                snapshot.data![index].id);
                                            setState(() {});
                                          },
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () {
                                            openMessage(snapshot.data![index]);
                                          },
                                        )
                                      ],
                                    ),
                                    leading: Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: (isExpense)
                                            ? Icon(Icons.upload,
                                                color: Colors.redAccent[400])
                                            : Icon(
                                                Icons.download,
                                                color: Colors.greenAccent[400],
                                              )),
                                    title: Text(snapshot.data![index].name)),
                              ),
                            );
                          });
                    } else {
                      return Center(
                        child: Text("Tida ada data"),
                      );
                    }
                  } else {
                    return Center(
                      child: Text("Tida ada data"),
                    );
                  }
                }
              }),
        ],
      ),
    );
  }
}
