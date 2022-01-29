//eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzIzMjMwNGE0MzgwYmQwNzEzMDMxMTJmZTRiNzRkNzE1OWRlMzkyNWZjYzg4NWU3MzhmODg0YjQ1NDBjNDZlYzkyM2Q3ZTY0NGIxOGIzOGMiLCJpYXQiOjE2NDM0MzgzNTIsIm5iZiI6MTY0MzQzODM1MiwiZXhwIjoxNjc0OTc0MzUyLCJzdWIiOiI0NDgiLCJzY29wZXMiOltdfQ.GZhoBe4-IV2luNmGmmZk8A4tzI47t0VyHGjKYAwDJJycq0mkavI_CLL8JP9YiNBF9FIrMC-Ac19lRcrIWPoh48MMdALe9HyzjHee6ut-iZLJegEHmzMiJTz9q-z98WS5LUhpnky9p1IH7b0ae34wbs3gqlP_-CCfojDK9hsDmbNStmpdfeL8PcXszYn-gI5fT-pAmbzVg-DAKuTjnEeUJMcmsPknH0VhX8sF5hvHrr5MbE2DVrya40evA9OUvg-le5tdkXQGIRgK6Kua7vngbQgjzGiIq8rHv8_KjZ1CI2yvt0_HbYINnxydjDIhbMPlppP28ObDIi4g0XSJF-YGFu--_R7eWzSnlla-gasqHA27o952nG9f7GUqj1exEVn73dmFGNkGbaPItahKoKkU2uwRqNBwTLcjCU3lB01s64R3c_yAT1eBDTH-_9xeRo8UNsz2NsytTU37Xr5gxzcZjvGdQRaznsmFbJ1s-YH40_iP3ZcpnYF1knOa6Ad7TCTe7h05tyWeQbiDO0iz5dTLz33mU72iWIG2I6TPOHqVEP9YK9Fp_Nje2n3Jx48Cf2DnAFHGc_VRjtZoNNastSZtwnfHNEjBVDevsr7eEdu8S55zsqt6Nuqa5cyGN_ERJPi0QfNTWbM8zMtXA420SuumLZK7zqHXlLx6v-WA9BlOPik
import 'package:flutter/widgets.dart';

class User{
  int? id;
  String? name = '';
  String? email = '';
  String? token = '';

  User({this.id, this.name, this.email, this.token});

  factory User.fromJson(Map json){
    return User(token: json['token']);
  }

  factory User.fromJson2(Map json){
    return User(id: json['id'], name: json['name'],email: json['email']);
  }
}