
export 'package:flutter/material.dart' hide RefreshIndicator, RefreshIndicatorState;
export 'package:flutter/widgets.dart';
export 'package:flutter/cupertino.dart' hide RefreshCallback;
export 'dart:io';
export 'dart:async';
export 'package:flutter/rendering.dart';
export 'package:flutter/foundation.dart';
export 'package:flutter/services.dart';

//plugins
export 'package:device_info_plus/device_info_plus.dart';
export 'package:get/get.dart'
    hide HeaderValue, FormData, MultipartFile, Response;
export 'package:fluttertoast/fluttertoast.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:dio/dio.dart';
export 'package:logger/logger.dart';
export 'package:package_info_plus/package_info_plus.dart';
export 'package:get_storage/get_storage.dart';
export 'package:smooth_page_indicator/smooth_page_indicator.dart';
export 'package:colorful_safe_area/colorful_safe_area.dart';
export 'package:dropdown_button2/dropdown_button2.dart';
export 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
export 'package:pinput/pinput.dart';
export 'package:intl/intl.dart' hide TextDirection;
export 'package:flutter_easyloading/flutter_easyloading.dart';
export 'package:flutter/gestures.dart';
export 'package:share_plus/share_plus.dart';
export 'package:dotted_border/dotted_border.dart';

//config
export 'package:e2mars/config/device_info.dart';
export 'package:e2mars/config/local_storage.dart';
export 'package:e2mars/config/app_theme.dart';

//repository
export 'package:e2mars/repository/dio_client.dart';
export 'package:e2mars/repository/api_repository.dart';
export 'package:e2mars/repository/endpoint.dart';
export 'package:e2mars/repository/network_exceptions.dart';
export 'package:e2mars/repository/request_model.dart';

// logger
export 'package:e2mars/logger/logger_utils.dart';

// main
export 'package:e2mars/main.dart';

// route
export 'package:e2mars/route/app_routes.dart';
export 'package:e2mars/route/app_pages.dart';

//app values
export 'package:e2mars/app_values/app_images.dart';
export 'package:e2mars/app_values/app_colors.dart';
export 'package:e2mars/app_values/app_constants.dart';
export 'package:e2mars/app_values/text_styles.dart';

//utils
export 'package:e2mars/utils/custom_loader.dart';
export 'package:e2mars/utils/custom_toast.dart';
export 'package:e2mars/utils/double_back_press.dart';
export 'package:e2mars/utils/validator.dart';
export 'package:e2mars/utils/annotated_region_widget.dart';
export 'package:e2mars/utils/intl_phone_field/countries.dart';
export 'package:e2mars/utils/intl_phone_field/country_picker_dialog.dart';
export 'package:e2mars/utils/intl_phone_field/intl_phone_field.dart';
export 'package:e2mars/utils/intl_phone_field/phone_number.dart';
export 'package:e2mars/utils/intl_phone_field/helpers.dart';

//translation
export 'package:e2mars/translation/translation_service.dart';
export 'package:e2mars/translation/local_keys.dart';
export 'package:e2mars/translation/languages/en_Us.dart';

//models
export 'package:e2mars/models/device_model/device_model.dart';
export 'package:e2mars/models/message_response_model.dart';
export 'package:e2mars/models/authentication/login_response_model.dart';
export 'package:e2mars/models/static_pages_response_model.dart';

// controller
export 'package:e2mars/modules/splash/splash_controller.dart';
export 'package:e2mars/modules/login/login_controller.dart';
export 'package:e2mars/modules/reset_password/reset_password_controller.dart';
export 'package:e2mars/modules/forgot_password/forgot_password_controller.dart';
export 'package:e2mars/modules/otp_verification/otp_verification_controller.dart';
export 'package:e2mars/modules/on_boarding/on_boarding_controller.dart';
export 'package:e2mars/modules/dashboard/dashboard_controller.dart';
export 'package:e2mars/modules/rider/home/rider_home_controller.dart';
export 'package:e2mars/modules/rider/profile/profile_controller.dart';
export 'package:e2mars/modules/rider/my_rides/my_rides_controller.dart';
export 'package:e2mars/modules/help/help_controller.dart';
export 'package:e2mars/modules/role_selection/role_selection_controller.dart';
export 'package:e2mars/modules/signup/signup_controller.dart';
export 'package:e2mars/modules/driver/home/driver_home_controller.dart';
export 'package:e2mars/modules/e2refer/e2refer_controller.dart';
export 'package:e2mars/modules/upload_documents/unload_documents_controller.dart';
export 'package:e2mars/modules/vehicle_info_form/vehicle_info_form_controller.dart';
export 'package:e2mars/modules/bank_info_form/bank_info_form_controller.dart';

//bindings
export 'package:e2mars/initial_binding/initial_binding.dart';
export 'package:e2mars/modules/splash/splash_binding.dart';
export 'package:e2mars/modules/login/login_binding.dart';
export 'package:e2mars/modules/reset_password/reset_password_binding.dart';
export 'package:e2mars/modules/forgot_password/forgot_password_binding.dart';
export 'package:e2mars/modules/on_boarding/on_boarding_binding.dart';
export 'package:e2mars/modules/otp_verification/otp_verification_binding.dart';
export 'package:e2mars/modules/dashboard/dashboard_binding.dart';
export 'package:e2mars/modules/role_selection/role_selection_binding.dart';
export 'package:e2mars/modules/signup/signup_binding.dart';
export 'package:e2mars/modules/e2refer/e2refer_binding.dart';
export 'package:e2mars/modules/upload_documents/upload_documents_binding.dart';
export 'package:e2mars/modules/vehicle_info_form/vehicle_info_binding.dart';
export 'package:e2mars/modules/bank_info_form/bank_info_form_binding.dart';

//screen
export 'package:e2mars/modules/splash/splash_screen.dart';
export 'package:e2mars/modules/login/login_screen.dart';
export 'package:e2mars/modules/reset_password/reset_password_screen.dart';
export 'package:e2mars/modules/forgot_password/forgot_password_screen.dart';
export 'package:e2mars/modules/on_boarding/on_boarding_screen.dart';
export 'package:e2mars/modules/otp_verification/otp_verification_screen.dart';
export 'package:e2mars/modules/dashboard/dashboard_screen.dart';
export 'package:e2mars/modules/rider/home/rider_home_screen.dart';
export 'package:e2mars/modules/reset_password/password_reset_successful.dart';
export 'package:e2mars/modules/role_selection/role_selection_screen.dart';
export 'package:e2mars/modules/signup/signup_screen.dart';
export 'package:e2mars/modules/driver/home/driver_home_screen.dart';
export 'package:e2mars/modules/e2refer/e2refer_screen.dart';
export 'package:e2mars/modules/rider/profile/profile_screen.dart';
export 'package:e2mars/modules/upload_documents/upload_documents_screen.dart';
export 'package:e2mars/modules/vehicle_info_form/vehicle_info_form_screen.dart';
export  'package:e2mars/modules/bank_info_form/bank_info_from_screen.dart';

//widgets
export 'package:e2mars/widgets/custom_phone_text_field.dart';
export 'package:e2mars/widgets/custom_asset_image_widget.dart';
export 'package:e2mars/widgets/custom_text_field.dart';
export 'package:e2mars/widgets/custom_button_widget.dart';
export 'package:e2mars/widgets/custom_dropdown.dart';
export 'package:e2mars/widgets/network_image.dart';
export 'package:e2mars/widgets/custom_appbar.dart';
export 'package:e2mars/widgets/drawer.dart';

