import 'package:flutter/material.dart';
import 'package:profile/components/portfolio_appbar.dart';

class PortfolioView extends StatelessWidget { 
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PortfolioAppbar(),
    );
  }
} 