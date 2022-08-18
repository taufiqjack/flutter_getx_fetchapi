import 'package:flutter/material.dart';
import 'package:flutter_getx_fetchapi/ui/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DataController dataController = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Testing Get X'),
          centerTitle: true,
          leading: const Icon(Icons.menu),
        ),
        body: Obx(
          () => dataController.isDataLoad.value
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: dataController.contactModel!.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                            child: Text(
                                '${dataController.contactModel!.data![index].firstName}')));
                  },
                ),
        ));
  }
}
