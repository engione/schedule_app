import 'package:flutter/material.dart';


class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.controller
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(6),
      width: screenWidth * 0.70,
      height: screenHeight * 0.07,
      decoration: const BoxDecoration(
        color:  Color.fromARGB(255, 240, 240, 240),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow:[ BoxShadow(
          color: Color.fromRGBO(0, 0, 0, .25),
          blurRadius: 2,
          offset: Offset(0, 2)
        )]
      ),
      child: TextField(
        
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Номер группы',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}