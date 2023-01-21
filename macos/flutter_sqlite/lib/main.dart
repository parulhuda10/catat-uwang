import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqlite/dataaccess/person-dataacces.dart';
import 'package:flutter_sqlite/model/personal.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

void main(List<String> args) {
  return runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final PersonDataAccess pda = PersonDataAccess();
  List<Person> list = <Person>[].obs;
  final nameController = TextEditingController();
  final cityController = TextEditingController();
  var isNew = false;
  var id = -1;
  
  loadData() async {
    var data = await pda.getAll();
    list.clear();
    list.addAll(data);
  }

  showBottomSheet(){
    return SingleChildScrollView(
      child: Container(
        height: 280,
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name"),
            TextField(controller: nameController ,),
            SizedBox(height: 10,),
            Text("City"),
            TextField(controller: cityController ,),
            SizedBox(height: 10,),
            SizedBox(
              width: Size.infinite.width,
              child: ElevatedButton(
                onPressed: () async{
                  if (isNew){
                    await pda.insert(Person(
                      name: nameController.text, 
                      city: cityController.text));                     
                  } else {
                    await pda.update(Person(
                      id: id,
                      name: nameController.text, 
                      city: cityController.text));                    
                  }
                  Get.back();
                  loadData();
                }, child: Text("Save")),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    loadData();

    return GetMaterialApp(
      title: "Flutter SQLiter",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter SQLiter"),),
        body: Obx(() => ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index){
            final item = list[index];
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              confirmDismiss: (direction) async {
                return await Get.dialog(
                  AlertDialog(content: (Container(
                    height: 150,
                    child: Column(
                      children: [
                        const Text("Are You Sure?"),
                        const SizedBox(
                          height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Get.back(result: true);
                          }, 
                        child: Text("Delete"))
                      ],
                    ),
                  )),)
                );
              },
              onDismissed: (direction) async{
                await pda.deleteById(item.id!);
                loadData();
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.delete, color: Colors.white,),
              ),
              child: TextButton(
                onPressed: () {
                  id = item.id!;
                  isNew = false;
                  nameController.text = item.name;
                  cityController.text = item.city;
                  Get.bottomSheet(showBottomSheet());
                },
                child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.only(top: 10),
                height: 54,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12))
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  const Icon(Icons.person),
                  const SizedBox(width: 10),
                  Column( 
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name, 
                        style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.w600),),
                      SizedBox(
                        height: 4,
                      ),
                      Text(item.city, 
                        style: TextStyle(fontSize: 12,
                        fontWeight: FontWeight.w600),),
                    ],
                  )
                ],
                ),
          ),
              ),
            );
          }
        ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () async {
                isNew = true;
                nameController.clear();
                cityController.clear();
                Get.bottomSheet(showBottomSheet());
                FocusScope.of(context).requestFocus();
              },
              child: Icon(Icons.add),
              ),
              SizedBox(
                height: 10,
              )
          ],
        ),
      ),     
    );
  }
}