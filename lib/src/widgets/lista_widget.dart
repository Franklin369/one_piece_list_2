import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "../pages/datail_page.dart";
class Listapersonajes extends StatefulWidget {
  const Listapersonajes({super.key});

  @override
  State<Listapersonajes> createState() => _ListapersonajesState();
}

class _ListapersonajesState extends State<Listapersonajes> {
  double widthpantalla = 0;
  final tituloStyletext = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    widthpantalla = MediaQuery.of(context).size.width - 50;

    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Text(
            "Portadas",
            style: tituloStyletext,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              bloquesPortada("p1.jpg", "titulo: ", "2018"),
              SizedBox(
                width: widthpantalla * .03,
              ),
              bloquesPortada("p2.jpg", "titulo: ", "2022"),
              SizedBox(
                width: widthpantalla * .03,
              ),
              bloquesPortada("p3.jpg", "titulo: ", "2023")
            ],
          ),
          const Divider(
            thickness: 1,
            color: Color.fromARGB(255, 62, 62, 62),
          ),
          const SizedBox(
            height: 20,
          ),
          bloquePersonajes("Brook",  0xff4913C4, "o1"),
          bloquePersonajes("Luffy",0xffF82A2D, "o2"),
          bloquePersonajes("Portgas D. Ace", 0xffFFCB28, "o3"),
          bloquePersonajes("Boa Hancock", 0xffFE4649, "o4"),
          bloquePersonajes("Boa Hancock", 0xffDF1C6A, "o5"),
          bloquePersonajes("Roronoa Zoro", 0xff21E295, "o6"),
        ],
      ),
    );
  }

  Widget bloquePersonajes(String nombre, int color, String imagen) {
    return GestureDetector(
      onTap: ()=>{
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) => DetallePage(color: color,image: "assets/$imagen.png",nombre: nombre,)))
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromARGB(66, 43, 43, 43)),
        height: 65,
        child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      offset: const Offset(0, 5),
                      spreadRadius: 0.0,
                      blurStyle: BlurStyle.normal,
                      color: Color(color),
                    )
                  ], borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(8),
                  child: Hero(tag: color,child: Image.asset("assets/$imagen.png")),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  nombre,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                )
              ],
            ),
         IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_rounded,color: Colors.grey,))
          ],
        ),
      ),
    );
  }

  Widget bloquesPortada(String image, String titulo, String subtitulo) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            "assets/$image",
            width: widthpantalla * .31,
            height: 110,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        RichText(
            text: TextSpan(
                text: titulo,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
                children: [
              TextSpan(
                  text: subtitulo,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontSize: 12))
            ]))
      ],
    );
  }
}
