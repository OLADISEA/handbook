import 'package:go_router/go_router.dart';
import 'package:ui_chatbot/core/navigation/route_names.dart';

import '../../main.dart';

final GoRouter appRouter = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: RouteNames.splash,
  routes: [
    // GoRoute(
    //   path: RouteNames.splash,
    //   builder: (context, state) => const SplashScreen(),
    // ),
    // GoRoute(
    //   path: RouteNames.onBoarding,
    //   builder: (context, state) => const OnBoardingPage(),
    // ),
    // GoRoute(
    //   path: RouteNames.login,
    //   builder: (context, state) => const SignIn(),
    // ),
    // GoRoute(
    //   path: RouteNames.register,
    //   builder: (context, state) => const RegisterPage(),
    // ),
    // GoRoute(
    //   path: RouteNames.otp,
    //   builder: (context, state) => const VerifyOTPPage(),
    // ),
    //
    // // GoRoute(
    // //   path: RouteNames.home,
    // //   builder: (context, state) => BottomNavBarScreen(key: bottomNavKey),
    // // ),
    //
    // GoRoute(
    //   path: RouteNames.searchAddress,
    //   builder: (context, state) => const SearchAddressScreen(),
    // ),
    // ShellRoute(
    //   builder: (context, state, child) {
    //     return BottomNavBarScreen(key: bottomNavKey, child: child);
    //   },
    //   routes: [
    //     // The 4 tabs:
    //     GoRoute(
    //       name: 'explore',
    //       path: RouteNames.home,
    //       builder: (_, __) => const HomeScreen(),
    //     ),
    //     GoRoute(
    //       name: 'search',
    //       path: '/searchs',
    //       builder: (_, __) => const SearchPage(),
    //     ),
    //     GoRoute(
    //       name: 'cart',
    //       path: RouteNames.cart,
    //       builder: (context, state) {
    //         final extra = state.extra as Map<String, dynamic>?;
    //         final initialTab = extra != null ? extra['initialTab'] as int? : null;
    //         return CartPage(initialTab: initialTab);
    //       },
    //     ),
    //     GoRoute(
    //       name: 'profile',
    //       path: '/profile',
    //       builder: (_, __) => const ProfilePage(),
    //     ),
    //   ],
    // ),
    //
    // GoRoute(
    //   path: RouteNames.success,
    //   builder: (context, state) => const SuccessPage(),
    // ),
    // GoRoute(
    //   path: RouteNames.terms,
    //   builder: (context, state) => const TermsAndConditions(),
    // ),
    // GoRoute(
    //   path: RouteNames.privacy,
    //   builder: (context, state) => const PrivacyPolicy(),
    // ),
    // GoRoute(
    //   path: RouteNames.promo,
    //   builder: (context, state) {
    //     final args = state.extra as PromotionPageArgs;
    //     return PromotionPage(
    //       orders: args.orders,
    //       params: args.params,
    //       sendAsGift: args.sendAsGift,
    //     );
    //   },
    // ),
    //
    // GoRoute(
    //     path: RouteNames.featured,
    //     builder: (context, state) {
    //       return FeaturedScreen();
    //     }),
    //
    // GoRoute(
    //     path: RouteNames.restaurant,
    //     builder: (context, state) {
    //       final data = state.extra as VendorParams;
    //       return RestaurantPage(data: data);
    //     }),
    // GoRoute(
    //   path: RouteNames.supermarket,
    //   builder: (context, state) => const SupermarketPage(),
    // ),
    // GoRoute(
    //   path: RouteNames.pharmacy,
    //   builder: (context, state) => const PharmacyPage(),
    // ),
    // GoRoute(
    //   path: RouteNames.restaurantItems,
    //   builder: (context, state) {
    //     final args = state.extra as VendorArguments;
    //     return RestaurantItemsPage(
    //       vendorId: args.vendorId,
    //       vendor: args.vendor,
    //       packId: args.packId,
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.pharmacyItems,
    //   builder: (context, state) => PharmacyItemsPage(),
    // ),
    // GoRoute(
    //   path: RouteNames.supermarketItems,
    //   builder: (context, state) => SupermarketItemsPage(),
    // ),
    //
    // GoRoute(
    //   path: RouteNames.search,
    //   builder: (context, state) {
    //     final items = state.extra as List<Map<String, dynamic>>;
    //     return AppItemsSearch(allItems: items);
    //   },
    // ),
    //
    // GoRoute(
    //   path: RouteNames.searchService,
    //   builder: (context, state) {
    //     final vendorType = state.extra as ServiceTypeEntity;
    //     return SearchVendors(serviceType: vendorType);
    //   },
    // ),
    //
    // GoRoute(
    //   path: RouteNames.searchAllService,
    //   builder: (context, state) {
    //     final serviceTypesMap = state.extra as Map<int, ServiceTypeEntity>;
    //     return SearchAllVendors(serviceTypesMap: serviceTypesMap);
    //   },
    // ),
    //
    //
    // GoRoute(
    //   path: RouteNames.productSearch,
    //   builder: (context, state) {
    //     final args = state.extra as ProductSearchPageArgs;
    //     return ProductSearchPage(
    //         vendorId: args.vendorId,
    //         packId: args.packId,
    //         vendor: args.vendorEntity);
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.shopDetails,
    //   builder: (context, state) {
    //     final details = state.extra as Map<String, dynamic>;
    //     return ShopDetails(details: details);
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.restaurantRatings,
    //   builder: (context, state) {
    //     final args = state.extra as VendorRatingArguments;
    //     return RestaurantRatingsPage(args: args);
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.pharmacyRatings,
    //   builder: (context, state) {
    //     return const PharmacyRatingsPage();
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.supermarketRatings,
    //   builder: (context, state) {
    //     return const SupermarketRatingsPage();
    //   },
    // ),
    //
    // GoRoute(
    //   path: RouteNames.restaurantCheckOut,
    //   builder: (context, state) {
    //     final args = state.extra as CheckoutArguments;
    //     return CheckOutPage(vendorProducts: args
    //         // packs: args.pack,
    //         // packCount: args.packCount,
    //         );
    //   },
    // ),
    //
    // GoRoute(
    //   path: RouteNames.pharmacyCheckOut,
    //   builder: (context, state) {
    //     return const PharmacyCheckOut();
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.supermarketCheckOut,
    //   builder: (context, state) {
    //     return const SupermarketCheckOut();
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.payment,
    //   builder: (context, state) {
    //     final order = state.extra as PaymentArgs;
    //     return PaymentPage(
    //       order: order.orders!,
    //       sendAsGift: order.sendAsGift,
    //       sharpSharpNote: order.sharpSharpNote,
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.onlinePayment,
    //   builder: (context, state) {
    //     return const OnlinePaymentPage();
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.payOnline,
    //   builder: (context, state) {
    //     return const PayOnline();
    //   },
    // ),
    //
    // GoRoute(
    //   path: RouteNames.orderTracking,
    //   builder: (context, state) {
    //     return const OrderTracking();
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.orderCompletedPage,
    //   builder: (context, state) {
    //     final summary = state.extra as OrderTrackingEntity;
    //     return OrderCompletedPage(summary: summary);
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.updateDetails,
    //   builder: (context, state) {
    //     final profile = state.extra as ProfileEntity;
    //     return UpdateDetailsPage(profile: profile);
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.enterOtp,
    //   builder: (context, state) {
    //     return const EnterOtpPage();
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.support,
    //   builder: (context, state) {
    //     return const SupportChannels();
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.ratings,
    //   builder: (context, state) {
    //     final summary = state.extra as OrderTrackingEntity;
    //     return RatingPage(summary: summary,);
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.feedback,
    //   builder: (context, state) {
    //     return const FeedbackPage();
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.faq,
    //   builder: (context, state) {
    //     return const FAQ();
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.referral,
    //   builder: (context, state) {
    //     return const Referrals();
    //   },
    // ),
    //
    // GoRoute(
    //   path: RouteNames.delete,
    //   builder: (context, state) {
    //     return const Delete();
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.transactions,
    //   builder: (context, state) {
    //     return const TransactionHistoryScreen();
    //   },
    // ),
    //
    // GoRoute(
    //   path: RouteNames.hotelReservationsDetails,
    //   builder: (context, state) {
    //     final order = state.extra as OrderEntity;
    //     return HotelReservationsDetails(orderEntity: order);
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.carReservationsDetails,
    //   builder: (context, state) {
    //     final order = state.extra as OrderEntity;
    //
    //     return CarReservationsScreen(orderEntity: order);
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.barbingReservationsDetails,
    //   builder: (context, state) {
    //     final order = state.extra as OrderEntity;
    //
    //     return BarbingReservationDetails(orderEntity: order);
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.legal,
    //   builder: (context, state) {
    //     return const Legal();
    //   },
    // ),
    //
    // GoRoute(
    //   path: RouteNames.services,
    //   builder: (context, state) {
    //     final String slug = state.extra as String;
    //     return ServicesScreen(
    //       slug: slug,
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.hotel,
    //   builder: (context, state) {
    //     return HotelReservationPage();
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.carRental,
    //   builder: (context, state) {
    //     final args = state.extra as ServiceArgs;
    //     return CarRentalsPage(
    //       serviceType: args.serviceTypeEntity,
    //       serviceVendorModel: args.serviceVendorModel,
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.maintenance,
    //   builder: (context, state) {
    //     return MaintenanceServices();
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.barbing,
    //   builder: (context, state) {
    //     return BarbingServices();
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.hotelRooms,
    //   builder: (context, state) {
    //     final vendor = state.extra as ServiceVendorEntity;
    //     return HotelRoomTypes(vendor: vendor,);
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.roomDetails,
    //   builder: (context, state) {
    //     final arg = state.extra as ServiceOptionsArgs;
    //     return RoomDetails(
    //       vendor: arg.serviceVendorEntity,
    //       serviceResponse: arg.serviceResponseEntity,
    //       option: arg.option,
    //     );
    //   },
    // ),
    //
    // GoRoute(
    //   path: RouteNames.verifyAvailability,
    //   builder: (context, state) {
    //     final args = state.extra as VerifyAvailabilityArgs;
    //     return VerifyAvailability(serviceDetailEntity: args.serviceDetailEntity, vendor: args.serviceVendorEntity,);
    //   },
    // ),
    //
    // GoRoute(
    //   path: RouteNames.hotelPayment,
    //   builder: (context, state) {
    //     final args = state.extra as HotelPaymentArgs;
    //     return HotelPayment(
    //       summary: args.serviceAvailabilityModel,
    //       serviceDetail: args.serviceDetailEntity,
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.profileInfoDetails,
    //   builder: (context, state) {
    //     final token = state.extra as String;
    //
    //     return ProfileInfoDetails(token: token,);
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.pickUpBooking,
    //   builder: (context, state) {
    //     final vendor = state.extra as ServiceVendorEntity;
    //     return PickUpBooking(vendor: vendor);
    //   },
    // ),
    //
    // GoRoute(
    //   path: RouteNames.airportPickup,
    //   builder: (context, state) {
    //     final args = state.extra as BookingArgs;
    //
    //     return BookingInfoDetails(
    //       vendor: args.vendor,
    //       carService: args.carService,
    //       carType: args.carType,
    //       tripType: args.tripType,
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.luxuryInfo,
    //   builder: (context, state) {
    //     final args = state.extra as BookingArgs;
    //
    //     return LuxuryRentalBooking(
    //       vendor: args.vendor,
    //       carService: args.carService,
    //       carType: args.carType,
    //       tripType: args.tripType,
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.escortInfo,
    //   builder: (context, state) {
    //     final args = state.extra as BookingArgs;
    //
    //     return EscortServiceBooking(
    //       vendor: args.vendor,
    //       carService: args.carService,
    //       carType: args.carType,
    //       tripType: args.tripType,
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.pickUpPayment,
    //   builder: (context, state) {
    //     final vendor = state.extra as ServiceVendorEntity;
    //     return PickUpPayment(vendor: vendor,);
    //   },
    // ),
    //
    // GoRoute(
    //   path: RouteNames.maintenancePayment,
    //   builder: (context, state) {
    //     final vendor = state.extra as ServiceVendorEntity;
    //     return MaintenancePaymentPage(vendor: vendor,);
    //   },
    // ),
    //
    //
    // GoRoute(
    //   path: RouteNames.dropOffLocation,
    //   builder: (context, state) {
    //     return const DropOffLocationSearch();
    //   },
    // ),
    //
    // GoRoute(
    //   path: RouteNames.barbingBooking,
    //   builder: (context, state) {
    //     final vendor = state.extra as ServiceVendorEntity;
    //
    //     return BarbingBookingPage(vendor: vendor);
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.personalInfo,
    //   builder: (context, state) {
    //     final token = state.extra as String;
    //     return PersonalInfo(token: token,);
    //   },
    // ),
    //
    // GoRoute(
    //   path: RouteNames.reservationInfo,
    //   builder: (context, state) {
    //     final token = state.extra as String;
    //     return ReservationDetailsPage(token: token,);
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.electricServiceBooking,
    //   builder: (context, state) {
    //     final text = state.extra as String?;
    //     return ElectricServiceBooking(text: text);
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.tip,
    //   builder: (context, state) {
    //     return const TipSuccess();
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.orderDetailsPage,
    //   builder: (context, state) {
    //     final order = state.extra as OngoingOrderEntity;
    //     return OrderDetailsPage(order:  order,);
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.wallet,
    //   builder: (context, state) {
    //     return const WalletScreen();
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.addFunds,
    //   builder: (context, state) {
    //     return const AddFundsButton();
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.addDebit,
    //   builder: (context, state) {
    //     return const AddDebitCard();
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.barbingServiceRequest,
    //   builder: (context, state) {
    //     return const BarbingServiceRequest();
    //   },
    // ),
    //
    // GoRoute(
    //   path: RouteNames.electricalServiceRequest,
    //   builder: (context, state) {
    //     return const ElectricalServiceRequest();
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.carPayOnline,
    //   builder: (context, state) {
    //     return const CarPaymentOnline();
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.address,
    //   builder: (context, state) {
    //     return const AddressPage();
    //   },
    // ),
    //
    // GoRoute(
    //   path: RouteNames.paymentWebView,
    //   builder: (context, state) {
    //     final args = state.extra as Map<String, String>?;
    //     final url = args?['url'] ?? '';
    //     final callback = args?['callback'] ?? '';
    //     return PaymentWebViewPage(
    //       paymentUrl: url,
    //       redirectUrlSubstring: callback,
    //     );
    //   },
    // ),

    // GoRoute(
    //   path: RouteNames.barbingServiceRequest,
    //   builder: (context, state) {
    //     return const BarbingServiceRequest();
    //   },
    // ),
    // GoRoute(
    //   path: RouteNames.barbingServiceRequest,
    //   builder: (context, state) {
    //     return const BarbingServiceRequest();
    //   },
    // ),
  ],
);
