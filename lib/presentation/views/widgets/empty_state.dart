import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyState extends StatelessWidget {
  final Function? onSuggestedAction;
  final String? suggestedAction;

  const EmptyState({
    super.key,
    this.onSuggestedAction,
    this.suggestedAction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              'assets/animations/search.json',
              fit: BoxFit.contain,
            ),
            if (suggestedAction != null && onSuggestedAction != null) const SizedBox(height: 12),
            if (suggestedAction != null && onSuggestedAction != null)
              InkWell(
                onTap: onSuggestedAction as void Function()?,
                child: Text(
                  suggestedAction!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
