import 'package:flutter/material.dart';
class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:13,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,size: 19,
                      color: Colors.black87,
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  InkWell(
                    child: const Text("Save",style: TextStyle(
                        fontSize: 14,fontWeight: FontWeight.w400
                    ),
                    ),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              const Padding(
                padding:  EdgeInsets.symmetric(
                    vertical:8.0,horizontal: 10
                ),
                child: Text(
                  "Edit personal information",
                  style: TextStyle(color:Colors.black,
                      fontSize: 30,fontWeight: FontWeight.w500
                  ),
                ),
              ),
              const SizedBox(height: 25,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding:  EdgeInsets.fromLTRB(10,8,10,0),
                    child: Text("First name",
                      style: TextStyle(color:Colors.black,
                          fontSize: 15,fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.black87),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.cancel,size: 18,),
                            onPressed: (){},
                          )
                      ),
                      controller: TextEditingController(
                          text: ""
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  const Padding(
                    padding:  EdgeInsets.fromLTRB(10,8,10,0),
                    child: Text("Last name",style: TextStyle(color:Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),
                  ),
                  Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.black87),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.cancel,size: 18,),
                            onPressed: (){},
                          )
                      ),
                      controller: TextEditingController(
                          text: ""
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25,),
              InkWell(
                onTap: (){

                },
                child: GestureDetector(
                  onTap: (){
                    _askedToLead();
                  },
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.fromLTRB(10,8,10,0),
                        child: Text("Sex",style: TextStyle(
                            color:Colors.black,fontSize: 15,
                            fontWeight: FontWeight.w400
                        ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: 12,vertical: 2
                        ),
                        child: Text("Male",
                          style: TextStyle(
                              color:Colors.black,
                              fontSize: 17,fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25,),
              InkWell(
                onTap: (){
                  _selectDate(context);
                },
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.fromLTRB(10,8,10,0),
                      child: Text("Date of birth",
                        style: TextStyle(color:Colors.black,
                            fontSize: 15,fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10),
                      child: Text("15- 08 - 1995"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding:  EdgeInsets.fromLTRB(10,8,10,0),
                    child: Text("Phone number",
                      style: TextStyle(color:Colors.black,
                          fontSize: 15,fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.black87),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.cancel,size: 18,),
                            onPressed: (){},
                          )
                      ),
                      controller: TextEditingController(
                          text: "+63"
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 1),
        lastDate: DateTime(DateTime.now().year+1));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      }
      );
  }

  Future<void> _askedToLead() async {
    switch (await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Sex'),
            children: [
              SimpleDialogOption(
                onPressed: () { Navigator.pop(
                    context, "Male");
                },
                child: const Text('Male'),
              ),
              SimpleDialogOption(
                onPressed: () { Navigator.pop(
                    context, "Female");
                },
                child: const Text('Female'),
              ),
            ],
          );
        }
    )) {
      case "Male":
      // Let's go.
      // ...
        break;
      case "Female":
      // ...
        break;
    }
  }
}