// import 'package:sharp_sharp/core/models/tab_item.dart';
// import 'package:sharp_sharp/features/home/domain/entity/vendor_entity.dart';
// import 'package:sharp_sharp/features/restaurant/domain/entity/order_placement_entity.dart';
//
// import '../../../features/car_rentals/domain/entity/car_service.dart';
// import '../../../features/car_rentals/domain/entity/car_trip_type.dart';
// import '../../../features/restaurant/domain/entity/order_summary_request.dart';
// import '../../../features/restaurant/domain/usecase/fetch_coupon_usecase.dart';
// import '../../../features/services/data/model/service_availability_model.dart';
// import '../../../features/services/domain/entity/service_detail_entity.dart';
// import '../../../features/services/domain/entity/service_option_entity.dart';
// import '../../../features/services/domain/entity/service_type_entity.dart';
// import '../../../features/services/domain/entity/service_vendor_entity.dart';
//
// class PromotionPageArgs {
//   final OrderSummaryRequestModel? orders;
//   final CouponParams params;
//   final SendAsGiftModel? sendAsGift;
//   final String? sharpSharpNote;
//
//
//
//   PromotionPageArgs({this.orders, required this.params, this.sendAsGift, this.sharpSharpNote});
// }
//
// class ProductSearchPageArgs {
//   final VendorEntity vendorEntity;
//   final String? packId;
//   final int vendorId;
//
//   ProductSearchPageArgs({this.packId, required this.vendorId, required this.vendorEntity});
// }
//
// class PaymentArgs {
//   final OrderSummaryRequestModel? orders;
//   final SendAsGiftModel? sendAsGift;
//   final String? sharpSharpNote;
//
//   PaymentArgs({this.orders, this.sendAsGift, this.sharpSharpNote});
// }
//
// class ServiceArgs{
//   final ServiceTypeEntity serviceTypeEntity;
//   final ServiceVendorModel serviceVendorModel;
//   ServiceArgs({required this.serviceTypeEntity, required this.serviceVendorModel});
// }
//
// class ServiceOptionsArgs{
//   final ServiceVendorEntity serviceVendorEntity;
//   final ServiceOptionEntity? option;
//   final ServiceResponseEntity? serviceResponseEntity;
//   ServiceOptionsArgs({
//     required this.serviceVendorEntity,
//     this.option,
//     this.serviceResponseEntity
//   });
// }
//
// class HotelPaymentArgs{
//   final ServiceDetailEntity serviceDetailEntity;
//   final ServiceAvailabilityModel serviceAvailabilityModel;
//   HotelPaymentArgs({
//     required this.serviceDetailEntity,
//     required this.serviceAvailabilityModel
//   });
// }
//
// class BookingArgs{
//   final ServiceVendorEntity vendor;
//   final ServiceEntity carService;
//   final TripTypeEntity tripType;
//   final CarTypeEntity carType;
//   BookingArgs({
//     required this.vendor,
//     required this.carService,
//     required this.tripType,
//     required this.carType
//   });
// }
//
//
//
// class VerifyAvailabilityArgs{
//   final ServiceDetailEntity serviceDetailEntity;
//   final ServiceVendorEntity serviceVendorEntity;
//
//   VerifyAvailabilityArgs({required this.serviceVendorEntity, required this.serviceDetailEntity});
// }
