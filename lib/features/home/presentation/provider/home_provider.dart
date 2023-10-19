import 'package:bike/features/home/data/bike.dart';
import 'package:bike/shared/utils/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationIndexProvider =
    StateNotifierProvider<NavigationIndexNotifier, int>(
  (ref) {
    final bikes = ref.watch(bikeProvider.notifier);
    return NavigationIndexNotifier(bikes);
  },
);

class NavigationIndexNotifier extends StateNotifier<int> {
  NavigationIndexNotifier(BikeListNotifier bikeList)
      : bike = bikeList,
        super(1);
  final BikeListNotifier bike;
  // ignore: use_setters_to_change_properties
  void navigateTo(int index) {
    state = index;
    switch (index) {
      case 0:
        bike.getCurrentNewArrival();
      case 2:
        bike.getCurrentBestSale();
      default:
        bike.getCurrentPopular();
    }
  }
}

final bikeProvider = StateNotifierProvider<BikeListNotifier, List<List<Bike>>>(
  (ref) => BikeListNotifier(),
);

List<Bike> get initialState {
  final list = [
    Bike(
      name: 'AeroX',
      image: '$imageAsset/1.png',
      price: 3999,
      rating: 4.5,
      description:
          "The AeroX 155 is a sporty and stylish scooter with aggressive looks and performance. It's powered by a 155cc liquid-cooled engine, capable of reaching a top speed of 100 mph. It weighs 130 kg, offering a nimble and responsive ride.",
      topSpeed: 100,
      engine: 155,
      weight: 130,
    ),
    Bike(
      name: 'BladeRunner',
      image: '$imageAsset/2.png',
      price: 8499,
      rating: 4.7,
      description:
          "The BladeRunner 650 is a versatile middleweight naked bike. It's equipped with a 649cc parallel-twin engine, delivering a top speed of 130 mph. With a weight of 190 kg, it offers a balanced and comfortable ride.",
      topSpeed: 130,
      engine: 649,
      weight: 190,
    ),
    Bike(
      name: 'FuryCruiser',
      image: '$imageAsset/3.png',
      price: 11999,
      rating: 4.9,
      description:
          'The FuryCruiser 800 is a heavyweight cruiser built for long-haul journeys. It boasts an 800cc V-twin engine, providing a top speed of 120 mph. Despite its bulk at 300 kg, it delivers a smooth and comfortable ride.',
      topSpeed: 120,
      engine: 800,
      weight: 300,
    ),
    Bike(
      name: 'ThunderBolt',
      image: '$imageAsset/4.png',
      price: 4499,
      rating: 4.3,
      description:
          "The ThunderBolt 250 is a budget-friendly entry-level bike. Its 250cc engine allows for a top speed of 80 mph, and with a weight of 150 kg, it's easy to handle and maneuver, perfect, ,for new riders.",
      topSpeed: 80,
      engine: 250,
      weight: 150,
    ),
    Bike(
      name: 'StealthRunner',
      image: '$imageAsset/5.png',
      price: 14999,
      rating: 4.8,
      description:
          'The StealthRunner 1000 is a high-performance sportbike. Its 1,000cc inline-four engine enables it to reach a top speed of 190 mph. Despite weighing 210 kg, its agility and power make it a thrill-seeker’s dream.',
      topSpeed: 190,
      engine: 1000,
      weight: 210,
    ),
    Bike(
      name: 'CruiserX',
      image: '$imageAsset/6.png',
      price: 10499,
      rating: 4.6,
      description:
          'The CruiserX 750 is a midsize cruiser with a relaxed riding style. It features a 750cc V-twin engine, allowing for a top speed of 110 mph. Weighing 275 kg, it offers a stable and comfortable cruise.',
      topSpeed: 110,
      engine: 750,
      weight: 275,
    ),
    Bike(
      name: 'RazorEdge',
      image: '$imageAsset/7.png',
      price: 6799,
      rating: 4.4,
      description:
          'The RazorEdge 400 is a sharp and nimble sportbike. Its 400cc parallel-twin engine provides a top speed of 120 mph. Weighing just 160 kg, it offers excellent handling and responsiveness.',
      topSpeed: 120,
      engine: 400,
      weight: 160,
    ),
    Bike(
      name: 'AdventurePro',
      image: '$imageAsset/8.png',
      price: 16499,
      rating: 4.9,
      description:
          "The AdventurePro 1200 is a premium adventure tourer designed for off-road expeditions. Equipped with a 1,200cc engine, it can reach a top speed of 130 mph. Despite its size at 230 kg, it's a capable and rugged performer.",
      topSpeed: 130,
      engine: 1200,
      weight: 230,
    ),
    Bike(
      name: 'CafeRider',
      image: '$imageAsset/9.png',
      price: 8799,
      rating: 4.7,
      description:
          'The CafeRider 650 is a retro-inspired cafe racer with a 650cc parallel-twin engine, providing a top speed of 115 mph. Weighing 185 kg, it offers a blend of classic aesthetics and modern performance.',
      topSpeed: 115,
      engine: 650,
      weight: 185,
    ),
    Bike(
      name: 'SprintKing',
      image: '$imageAsset/10.png',
      price: 5199,
      rating: 4.2,
      description:
          "The SprintKing 300 is a lightweight and nimble sportbike, powered by a 300cc single-cylinder engine with a top speed of 100 mph. Weighing 145 kg, it's an ideal choice, ,for agile urban rides.",
      topSpeed: 100,
      engine: 300,
      weight: 145,
    ),
    Bike(
      name: 'CruiserClassic',
      image: '$imageAsset/11.png',
      price: 13999,
      rating: 4.8,
      description:
          'The CruiserClassic 1100 is a big and bold cruiser, boasting an 1,100cc V-twin engine that delivers a top speed of 120 mph. Despite its substantial 320 kg weight, it offers a smooth and luxurious ride.',
      topSpeed: 120,
      engine: 1100,
      weight: 320,
    ),
    Bike(
      name: 'StreetSprinter',
      image: '$imageAsset/12.png',
      price: 3299,
      rating: 4,
      description:
          "The StreetSprinter 150 is an affordable and compact street bike. With a 150cc single-cylinder engine, it reaches a top speed of 75 mph. Weighing just 125 kg, it's an economical and agile choice, ,for daily commuting.",
      topSpeed: 75,
      engine: 150,
      weight: 125,
    ),
  ]..shuffle();
  return list;
}

class BikeListNotifier extends StateNotifier<List<List<Bike>>> {
  BikeListNotifier() : super([[], initialState, []]);

  Future<void> getCurrentNewArrival() async {
    state[0] = initialState;
  }

  Future<void> getCurrentPopular() async {
    state[1] = initialState;
  }

  Future<void> getCurrentBestSale() async {
    state[2] = initialState;
  }
}
