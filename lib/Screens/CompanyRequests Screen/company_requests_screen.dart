import 'package:blue_eye_web/Screens/CompanyRequests%20Screen/PC/pc_company_request.dart';
import 'package:blue_eye_web/Screens/CompanyRequests%20Screen/Tab/tab_company_request.dart';
import 'package:flutter/material.dart';

import '../../Core/Utils/responsive.dart';
import 'Mobile/mobile_company_request.dart';

class CompanyRequestsScreen extends StatefulWidget {
  const CompanyRequestsScreen({super.key});

  @override
  State<CompanyRequestsScreen> createState() => _CompanyRequestsScreenState();
}

class _CompanyRequestsScreenState extends State<CompanyRequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
        desktop: PcView(), tablet: TabView(), mobile: MobileView());
  }
}
