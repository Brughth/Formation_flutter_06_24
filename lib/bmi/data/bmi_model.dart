import 'bmi_detail_model.dart';

class BmiModels {
  final String? gender;
  final double height;
  final int weight;
  final int age;

  double get heightInMeter => height / 100;

  double get index => weight / (heightInMeter * heightInMeter);

  BmiDetailModel get status {
    if (index < 18.5) {
      return BmiDetailModel(
        status: "Poids insuffisant",
        description:
            "Un IMC inférieur à 18,5 indique un poids insuffisant, ce qui peut entraîner des problèmes de santé tels que la malnutrition, un système immunitaire affaibli et un risque accru de fractures.",
        advice:
            "Se concentrer sur l'augmentation de l'apport calorique en consommant des aliments riches en nutriments pour prendre du poids sain. Consulter un professionnel de la santé pour déterminer l'apport calorique et les objectifs de prise de poids appropriés. S'engager dans des exercices de renforcement musculaire réguliers pour augmenter la masse musculaire.",
        image: "assets/images/underweight.png",
      );
    } else if (index >= 18.5 && index <= 24.9) {
      return BmiDetailModel(
        status: "Poids normal",
        description:
            "Un IMC compris entre 18,5 et 24,9 est considéré comme un poids normal, associé à un risque plus faible de problèmes de santé liés au poids.",
        advice:
            "Maintenir une alimentation équilibrée et une activité physique régulière pour maintenir un poids sain. Intégrer une variété d'aliments riches en nutriments provenant de tous les groupes alimentaires dans votre alimentation. Viser au moins 30 minutes d'exercice d'intensité modérée la plupart des jours de la semaine.",
        image: "assets/images/normalweight.png",
      );
    } else if (index >= 25 && index <= 29.9) {
      return BmiDetailModel(
        status: "Surpoids",
        description:
            "Un IMC compris entre 25,0 et 29,9 entre dans la catégorie du surpoids, augmentant le risque de développer des problèmes de santé tels que l'hypertension artérielle, le diabète de type 2 et certains types de cancer.",
        advice:
            "Mettre en œuvre un plan de perte de poids graduel en réduisant l'apport calorique et en augmentant l'activité physique. Prioriser les aliments entiers et non transformés dans votre alimentation et limiter les aliments transformés, les boissons sucrées et les graisses saturées excessives et malsaines. S'engager dans une activité physique régulière, visant au moins 150 minutes d'exercice d'intensité modérée par semaine.",
        image: "assets/images/overweight.png",
      );
    } else if (index >= 30 && index <= 34.9) {
      return BmiDetailModel(
        status: "Obésité de classe I",
        description:
            "L'obésité de classe I, avec un IMC compris entre 30,0 et 34,9, augmente considérablement le risque de diverses préoccupations de santé, notamment les maladies cardiaques, les accidents vasculaires cérébraux, les problèmes articulaires et l'apnée du sommeil.",
        advice:
            "Consulter un professionnel de la santé ou un diététicien agréé pour élaborer un plan de gestion du poids personnalisé. Faire des changements alimentaires importants, en se concentrant sur la consommation d'aliments riches en nutriments et en limitant les aliments transformés, les boissons sucrées et les graisses malsaines. S'engager dans une activité physique régulière, en augmentant progressivement l'intensité et la durée des séances d'entraînement.",
        image: "assets/images/obesity1.png",
      );
    } else if (index >= 35 && index <= 39.9) {
      return BmiDetailModel(
        status: "Obésité de classe II",
        description:
            "L'obésité de classe II, caractérisée par un IMC compris entre 35,0 et 39,9, présente un risque encore plus grand de complications graves, telles que le diabète de type 2, les maladies cardiaques et certains types de cancer.",
        advice:
            "Consulter un professionnel de la santé pour discuter d'un plan de gestion du poids complet, qui peut inclure des modifications du mode de vie, des interventions médicales ou une chirurgie bariatrique. Mettre en œuvre des changements alimentaires importants, en se concentrant sur les aliments entiers et non transformés et en limitant les aliments transformés, les boissons sucrées et les graisses malsaines. S'engager dans une activité physique régulière sous la supervision d'un professionnel de la santé ou d'un entraîneur personnel certifié.",
        image: "assets/images/obesity2.png",
      );
    } else {
      return BmiDetailModel(
        status: "Obésité de classe III",
        description:
            "L'obésité de classe III, avec un IMC de 40,0 ou plus, est associée au risque le plus élevé de problèmes de santé graves, notamment le décès prématuré, les maladies cardiaques, les accidents vasculaires cérébraux et des problèmes respiratoires.",
        advice:
            "Consulter un professionnel de la santé pour discuter d'un plan de gestion du poids complet, qui peut inclure",
        image: "assets/images/obesity2.png",
      );
    }
  }

  BmiModels({
    this.gender,
    required this.height,
    required this.weight,
    required this.age,
  });
}
