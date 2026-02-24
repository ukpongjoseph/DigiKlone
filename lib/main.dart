import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/beneficiaries_provider.dart';
import 'package:second_flutter/a_List_providers/digi_target_providers.dart';
import 'package:second_flutter/a_List_providers/money_transfer_provider.dart';
import 'package:second_flutter/a_List_providers/nav_provider.dart';
import 'package:second_flutter/a_List_providers/savings_plan.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/a_List_providers/transaction_activity.dart';
import 'package:second_flutter/pages/add_card.dart';
import 'package:second_flutter/pages/auto_save_settings_page.dart';
import 'package:second_flutter/pages/createDigiLock/Digi_Lock_Plan_Details.dart';
import 'package:second_flutter/pages/createDigiLock/create_digi_lock.dart';
import 'package:second_flutter/pages/digi_lock.dart';
import 'package:second_flutter/pages/digi_save_balance.dart';
import 'package:second_flutter/pages/digi_target.dart';
import 'package:second_flutter/pages/digi_target_savings.dart';
import 'package:second_flutter/pages/dream_vacation_page.dart';
import 'package:second_flutter/pages/edit_profile.dart';
import 'package:second_flutter/pages/emergency_fund_page.dart';
import 'package:second_flutter/pages/faq.dart';
import 'package:second_flutter/pages/home_page.dart';
import 'package:second_flutter/pages/kyc_verification.dart';
import 'package:second_flutter/pages/landing_page.dart';
import 'package:second_flutter/pages/lock_funds.dart';
import 'package:second_flutter/pages/message_center.dart';
import 'package:second_flutter/pages/new_car_page.dart';
import 'package:second_flutter/pages/notification_page.dart';
import 'package:second_flutter/pages/payment_methods.dart';
import 'package:second_flutter/pages/refer_friends.dart';
import 'package:second_flutter/pages/review_digi_target.dart';
import 'package:second_flutter/pages/security.dart';
import 'package:second_flutter/pages/set_up_auto_save_page.dart';
import 'package:second_flutter/pages/sign_in.dart';
import 'package:second_flutter/pages/signup/confirm_password.dart';
import 'package:second_flutter/pages/signup/email.dart';
import 'package:second_flutter/pages/signup/firstname.dart';
import 'package:second_flutter/pages/signup/lastname.dart';
import 'package:second_flutter/pages/signup/password.dart';
import 'package:second_flutter/a_List_providers/auth_login_provider.dart';
import 'package:second_flutter/a_List_providers/auth_register.dart';
import 'package:second_flutter/pages/support.dart';
import 'package:second_flutter/pages/total_progress.dart';
import 'package:second_flutter/pages/transferMoney/transfer_money.dart';
import 'package:second_flutter/pages/transferMoney/transfer_money_2.dart';
import 'package:second_flutter/pages/transferMoney/transfer_money_3.dart';

// This the root of the application. The main method is the entry point ofthe flutter application
void main() {
  // We call the runApp method to run the application but we wrap it around a changeNotifier to ensure state management which will ensure data is accessible across the entire app
  runApp(
    // The ChangeNotifierProvider is used to wrap the entire app so that the global state is accessible through out the widget tree. It takes a create method and a child, this child is the root of the entire application which is the MyApp Widget. The create method is used to create an instance of the Provider Class which holds the global state
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => AuthloginProvider()),
        ChangeNotifierProvider(create: (context) => NavProvider()),
        ChangeNotifierProvider(create: (context) => BeneficiariesProvider()),
        ChangeNotifierProvider(create: (context) => DigiSavingsPlans()),
        ChangeNotifierProvider(create: (context) => TransactionActivity()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => DigiTargetProviders()),
        ChangeNotifierProvider(create: (context) => MoneyTransferProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).getTheme(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      // We are creating routes for different screen for the purpose of routing and Navigation between screens
      routes: {
        "/signIn": (context) => const SignIn(),
        "/landing": (context) => const LandingPage(),
        "/firstname": (context) => const Firstname(),
        "/lastname": (context) => const Lastname(),
        "/email": (context) => const Email(),
        "/password": (context) => Password(),
        "/confirm-password": (context) => const ConfirmPassword(),
        "/digiTargetSavings": (context) => const DigiTargetSavings(),
        "/lockFunds": (context) => const LockFunds(),
        "/referFriends": (context) => const ReferFriends(),
        "/security": (context) => const Security(),
        "/addCard": (context) => const AddCard(),
        "/support": (context) => const Support(),
        "/faq": (context) => const Faq(),
        "/digiSaveBalance": (context) => const DigiSaveBalance(),
        "/digiTargetPage": (context) => const DigiTarget(),
        "/digiLockPage": (context) => const DigiLock(),
        "/transerMoneyPage": (context) => const TransferMoney(),
        "/transerMoneyPage2": (context) => const TransferMoney2(),
        "/transerMoneyPage3": (context) => const TransferMoney3(),
        "/totalProgress": (context) => const TotalProgress(),
        "/editProfilePage": (context) => EditProfile(),
        "/notificationPage": (context) => NotificationPage(),
        "/paymentMethods": (context) => PaymentMethods(),
        "/kycVerificationPage": (context) => KycVerification(),
        "/reviewDigiTarget": (context) => ReviewDigitarget(),
        "/createDigilock": (context) => CreateDigiLock(),
        "/autoSaveSettingspage": (context) => AutoSaveSettingsPage(),
        "/setUpAutoSavePage": (context) => SetUpAutoSavePage(),
        "/dreamVacationpage": (context) => DreamVacationPage(),
        "/emergencyFundPage": (context) => EmergencyFundPage(),
        "/newCarPage": (context) => NewCarPage(),
        "/message_center": (context) => MessageCenter(),
        "/digiLockPlanDetails" : (context) => DigiLockPlanDetails()
      },
    );
  }
}
