// import 'package:sharp_sharp/core/constants/app_assets.dart';
// import 'package:sharp_sharp/core/constants/app_colors.dart';
// import 'package:sharp_sharp/core/models/tab_item.dart';
// import 'package:sharp_sharp/core/navigation/route_names.dart';
// import 'package:sharp_sharp/features/home/domain/entity/restaurant_model.dart';
// import 'package:sharp_sharp/features/home/domain/entity/service_model.dart';
//
// class AppData {
//
//   static final List<ServiceVendorModel> serviceVendorImages = [
//     ServiceVendorModel(image: AppAssets.hotelImg, color: AppColors.otpResend),
//     ServiceVendorModel(image: AppAssets.carRentals, color: AppColors.yellow100),
//     ServiceVendorModel(image: AppAssets.maintenanceService, color: AppColors.rose),
//     ServiceVendorModel(image: AppAssets.barbingService, color: AppColors.blue200),
//
//
//   ];
//   static final List<TabItem> homeTabs = [
//     TabItem(iconPath: AppAssets.offer, label: "Offers"),
//     TabItem(iconPath: AppAssets.favorite, label: "Favorites"),
//     TabItem(
//         iconPath: AppAssets.delivery,
//         label: "Delivery time",
//         iconPath2: AppAssets.arrowDown),
//     TabItem(iconPath: AppAssets.rating, label: "Ratings"),
//     //TabItem(iconPath: AppAssets.rating, label: "Settings"),
//   ];
//
//   static final List<TabItem> restaurantTabs = [
//     TabItem(label: "All"),
//     TabItem(iconPath: AppAssets.favorite, label: "Favorites"),
//     TabItem(
//         iconPath: AppAssets.delivery,
//         label: "Delivery time",
//         iconPath2: AppAssets.arrowDown),
//     TabItem(iconPath: AppAssets.rating, label: "Under 30min"),
//     TabItem(iconPath: AppAssets.rating, label: "Ratings"),
//   ];
//
//   static final List<TabItem> supermarketTabs = [
//     TabItem(label: "All"),
//     TabItem(iconPath: AppAssets.favorite, label: "Favorites"),
//     TabItem(label: "Snacks"),
//     TabItem(label: "Bakery"),
//     TabItem(label: "Drinks"),
//     TabItem(label: "Coffee"),
//   ];
//
//   static final List<TabItem> pharmacyTabs = [
//     TabItem(label: "All"),
//     TabItem(label: "Favorites"),
//     TabItem(label: "Drugs"),
//     TabItem(label: "Supplements"),
//     TabItem(label: "Medical Devices"),
//   ];
//
//   static final List<TabItem> carRentalsTabs = [
//     TabItem(label: "All"),
//     TabItem(label: "Airport pickup"),
//     TabItem(label: "Escort services"),
//     TabItem(label: "Luxury car rentals"),
//     TabItem(label: "One-way car rentals"),
//     TabItem(label: "One-way car rentals"),
//     TabItem(label: "SUV/Van rentals"),
//     TabItem(label: "Ratings"),
//   ];
//
//   static final List<TabItem> maintenanceTabs = [
//     TabItem(label: "All"),
//     TabItem(label: "Electrical"),
//     TabItem(label: "Plumbing"),
//     TabItem(label: "Location"),
//     TabItem(label: "Ratings"),
//   ];
//   static final List<TabItem> barbingServiceTabs = [
//     TabItem(label: "All"),
//     TabItem(label: "Location"),
//     TabItem(label: "Ratings"),
//   ];
//
//   static final List<TabItem> hotelTabs = [
//     TabItem(label: "All"),
//     TabItem(label: "Airbnb"),
//     TabItem(label: "Hotel"),
//     TabItem(label: "Location"),
//     TabItem(label: "Ratings"),
//   ];
//
//   static final List<ServiceModel> services = [
//     const ServiceModel(
//         name: 'Restaurant',
//         routeName: RouteNames.restaurant,
//         image: AppAssets.restaurant,
//         color: AppColors.primaryColor,
//         textColor: AppColors.white),
//     const ServiceModel(
//         name: 'Supermarket',
//         routeName: RouteNames.supermarket,
//         image: AppAssets.supermarket,
//         color: AppColors.amber,
//         textColor: AppColors.primaryColor),
//     const ServiceModel(
//         name: 'Pharmacies',
//         routeName: RouteNames.pharmacy,
//         image: AppAssets.pharmacy,
//         color: AppColors.rose,
//         textColor: AppColors.black),
//     const ServiceModel(
//         name: 'Services',
//         routeName: RouteNames.services,
//         image: AppAssets.service,
//         color: AppColors.blue300,
//         textColor: AppColors.shadowColor1),
//   ];
//   static final List<ServiceModel> services2 = [
//     const ServiceModel(
//         name: 'Airbnb/Hotel Reservation',
//         routeName: RouteNames.hotel,
//         image: AppAssets.hotel,
//         color: AppColors.primaryColor,
//         textColor: AppColors.white),
//     const ServiceModel(
//         name: 'Car Rentals',
//         routeName: RouteNames.carRental,
//         image: AppAssets.carRental,
//         color: AppColors.amber,
//         textColor: AppColors.primaryColor),
//     const ServiceModel(
//         name: 'Maintenance services',
//         routeName: RouteNames.maintenance,
//         image: AppAssets.maintenance,
//         color: AppColors.rose,
//         textColor: AppColors.black),
//     const ServiceModel(
//         name: 'Barbing Service',
//         routeName: RouteNames.barbing,
//         image: AppAssets.barbing,
//         color: AppColors.blue300,
//         textColor: AppColors.shadowColor1),
//   ];
//
//   static final List<ImageItem> items = [
//     ImageItem(
//       imagePath: AppAssets.republic,
//       title: 'Chicken Republic - Ventura Mall',
//       subtitle: 'Snacks, Fast food, Western, Chicken & duck, Local dishes',
//       rating: 4.5,
//       smallImage: AppAssets.delivery,
//       smallText: 'From #800',
//     ),
//     ImageItem(
//       imagePath: AppAssets.republic,
//       title: 'Chicken Republic - Ventura Mall',
//       subtitle: 'Snacks, Fast food, Western, Chicken & duck, Local dishes',
//       rating: 4.0,
//       smallImage: AppAssets.delivery,
//       smallText: 'From #800',
//     ),
//     ImageItem(
//       imagePath: AppAssets.republic,
//       title: 'Chicken Republic - Ventura Mall',
//       subtitle: 'Snacks, Fast food, Western, Chicken & duck, Local dishes',
//       rating: 4.8,
//       smallImage: AppAssets.delivery,
//       smallText: 'From #800',
//     ),
//     // Add more items as needed
//   ];
//
//   static final List<ImageItem> restaurantItems = [
//     ImageItem(
//       imagePath: AppAssets.restaurantImg,
//       title: 'Chicken Republic - Ventura Mall',
//       subtitle: 'Snacks, Fast food, Western, Chicken & duck, Local dishes',
//       rating: 4.5,
//       smallImage: AppAssets.delivery,
//       smallText: 'From #800',
//     ),
//     ImageItem(
//       imagePath: AppAssets.restaurantImg,
//       title: 'Chicken Republic - Ventura Mall',
//       subtitle: 'Snacks, Fast food, Western, Chicken & duck, Local dishes',
//       rating: 4.0,
//       smallImage: AppAssets.delivery,
//       smallText: 'From #800',
//     ),
//     ImageItem(
//       imagePath: AppAssets.restaurantImg,
//       title: 'Chicken Republic - Ventura Mall',
//       subtitle: 'Snacks, Fast food, Western, Chicken & duck, Local dishes',
//       rating: 4.8,
//       smallImage: AppAssets.delivery,
//       smallText: 'From #800',
//     ),
//
//     ImageItem(
//       imagePath: AppAssets.restaurantImg,
//       title: 'Chicken Republic - Ventura Mall',
//       subtitle: 'Snacks, Fast food, Western, Chicken & duck, Local dishes',
//       rating: 4.5,
//       smallImage: AppAssets.delivery,
//       smallText: 'From #800',
//     ),
//     ImageItem(
//       imagePath: AppAssets.restaurantImg,
//       title: 'Chicken Republic - Ventura Mall',
//       subtitle: 'Snacks, Fast food, Western, Chicken & duck, Local dishes',
//       rating: 4.0,
//       smallImage: AppAssets.delivery,
//       smallText: 'From #800',
//     ),
//     // Add more items as needed
//   ];
//
//   static final List<ImageItem> supermarketItems = [
//     ImageItem(
//       imagePath: AppAssets.supermarketImg,
//       title: 'Chicken Republic - Ventura Mall',
//       subtitle: 'Snacks, Fast food, Western, Chicken & duck, Local dishes',
//       rating: 4.5,
//       smallImage: AppAssets.delivery,
//       smallText: 'From #800',
//     ),
//     ImageItem(
//       imagePath: AppAssets.supermarketImg,
//       title: 'Chicken Republic - Ventura Mall',
//       subtitle: 'Snacks, Fast food, Western, Chicken & duck, Local dishes',
//       rating: 4.0,
//       smallImage: AppAssets.delivery,
//       smallText: 'From #800',
//     ),
//     ImageItem(
//       imagePath: AppAssets.supermarketImg,
//       title: 'Chicken Republic - Ventura Mall',
//       subtitle: 'Snacks, Fast food, Western, Chicken & duck, Local dishes',
//       rating: 4.8,
//       smallImage: AppAssets.delivery,
//       smallText: 'From #800',
//     ),
//     ImageItem(
//       imagePath: AppAssets.supermarketImg,
//       title: 'Chicken Republic - Ventura Mall',
//       subtitle: 'Snacks, Fast food, Western, Chicken & duck, Local dishes',
//       rating: 4.5,
//       smallImage: AppAssets.delivery,
//       smallText: 'From #800',
//     ),
//     ImageItem(
//       imagePath: AppAssets.supermarketImg,
//       title: 'Chicken Republic - Ventura Mall',
//       subtitle: 'Snacks, Fast food, Western, Chicken & duck, Local dishes',
//       rating: 4.0,
//       smallImage: AppAssets.delivery,
//       smallText: 'From #800',
//     ),
//     // Add more items as needed
//   ];
//
//   static final List<ImageItem> pharmacyItems = [
//     ImageItem(
//       imagePath: AppAssets.pharmacyImg,
//       title: 'Chicken Republic - Ventura Mall',
//       subtitle: 'Snacks, Fast food, Western, Chicken & duck, Local dishes',
//       rating: 4.5,
//       smallImage: AppAssets.delivery,
//       smallText: 'From #800',
//     ),
//     ImageItem(
//       imagePath: AppAssets.pharmacyImg,
//       title: 'Chicken Republic - Ventura Mall',
//       subtitle: 'Snacks, Fast food, Western, Chicken & duck, Local dishes',
//       rating: 4.0,
//       smallImage: AppAssets.delivery,
//       smallText: 'From #800',
//     ),
//     ImageItem(
//       imagePath: AppAssets.pharmacyImg,
//       title: 'Chicken Republic - Ventura Mall',
//       subtitle: 'Snacks, Fast food, Western, Chicken & duck, Local dishes',
//       rating: 4.8,
//       smallImage: AppAssets.delivery,
//       smallText: 'From #800',
//     ),
//     // Add more items as needed
//   ];
//
//   static final List<TabItem> restaurantRatings = [
//     TabItem(label: "All"),
//     TabItem(iconPath: AppAssets.rating, label: "5.0 (200)"),
//     TabItem(iconPath: AppAssets.rating, label: "4.0 (200)"),
//     TabItem(iconPath: AppAssets.rating, label: "3.0 (200)"),
//     TabItem(iconPath: AppAssets.rating, label: "2.0 (200)"),
//     TabItem(iconPath: AppAssets.rating, label: "1.0 (200)"),
//   ];
//
//   static final List<TabItem> pharmacyRatings = [
//     TabItem(label: "All"),
//     TabItem(iconPath: AppAssets.rating, label: "5.0 (200)"),
//     TabItem(iconPath: AppAssets.rating, label: "4.0 (200)"),
//     TabItem(iconPath: AppAssets.rating, label: "3.0 (200)"),
//     TabItem(iconPath: AppAssets.rating, label: "2.0 (200)"),
//     TabItem(iconPath: AppAssets.rating, label: "1.0 (200)"),
//   ];
//
//   static final List<TabItem> supermarketRatings = [
//     TabItem(label: "All"),
//     TabItem(iconPath: AppAssets.rating, label: "5.0 (200)"),
//     TabItem(iconPath: AppAssets.rating, label: "4.0 (200)"),
//     TabItem(iconPath: AppAssets.rating, label: "3.0 (200)"),
//     TabItem(iconPath: AppAssets.rating, label: "2.0 (200)"),
//     TabItem(iconPath: AppAssets.rating, label: "1.0 (200)"),
//   ];
//
//   static final List<String> note = [
//     'First note to SharpSharp for instructions regarding how my order should be treated or how my meals should be',
//     'Second note to SharpSharp for instructions regarding how my order should be treated or how my meals should be'
//   ];
//
//
//   static final mockTransactions = [
//     {
//       'image': AppAssets.car,
//       'title': 'First Class Barbing Salon',
//       'location': 'Lagos, Nigeria',
//       'date': '04-04-2025',
//       'id': '1234567890',
//       'status': 'COMPLETE',
//     },
//     {
//       'image': AppAssets.car,
//       'title': 'SafeRide Escort Services',
//       'location': 'Lagos, Nigeria',
//       'date': '04-04-2025',
//       'id': '0987654321',
//       'status': 'IN-COMPLETE',
//     },
//   ];
//
//   static final List<TabItem> transactionTabs = [
//     TabItem(label: "All"),
//     TabItem(label: "Car services"),
//     TabItem(label: "Barbing service"),
//     TabItem(label: "Booking service"),
//     TabItem(label: "Maintenance services"),
//   ];
// }
