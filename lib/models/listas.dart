import 'package:get/get.dart';
import 'package:my_gym_bro/models/models.dart';

class Listas extends GetxController {
  Listas();

  //creamos unas listas vacias
  List<EjercicioElement> ejerciciosList = [];

  List<EjercicioElement> ejerciciosRutinaList = [];

  List<String> musculoList = [];

  List<Pr> prList = [];

  List<Rutina> rutinasList = [];

  List<Rutina> getRutinasList() {
    print('entra a get list $rutinasList');
    return rutinasList;
  }

  void clear() {
    ejerciciosRutinaList.clear();
    musculoList.clear();
    prList.clear();
    rutinasList.clear();
  }

  setRutinasList(List<Rutina> rutinasList) => this.rutinasList = rutinasList;

  void addRutinaList(Rutina rutina) {
    rutinasList.add(rutina);
  }

  get getPrList => prList;

  setPrList(List<Pr> prList) => this.prList = prList;

  void addPrList(Pr pr) {
    prList.add(pr);
  }

  get getMusculoList => musculoList;

  setMusculoList(musculoList) => this.musculoList = musculoList;

  void addMusculoList(String musculo) {
    musculoList.add(musculo);
  }

  List<EjercicioElement> getListEjercicio() {
    return ejerciciosList;
  }

  setEjerciosList(List<EjercicioElement> list) {
    ejerciciosList = list;
  }

  void addEjercicioList(EjercicioElement ejercicio) {
    ejerciciosList.add(ejercicio);
  }

  get getListEjercicioRutina {
    return ejerciciosRutinaList;
  }

  setEjerciosRutinaList(List<EjercicioElement> list) {
    ejerciciosRutinaList = list;
  }

  void addEjercicioRutinaList(EjercicioElement ejercicio) {
    ejerciciosRutinaList.add(ejercicio);
  }

  void removeEjercicioRutinaList(EjercicioElement ejercicio) {
    ejerciciosRutinaList.remove(ejercicio);
  }

  // TODO: poner un future que lea la lista llamandolo en el main o en splash

}
