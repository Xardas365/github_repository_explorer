import 'package:flutter/material.dart';
import 'package:github_repository_explorer/core/error/failure.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/widgets/failure_message.dart';

final class CacheStatusBanner extends StatelessWidget {
  const CacheStatusBanner({
    required this.isStale,
    required this.fetchedAt,
    this.refreshFailure,
    this.onRetry,
    super.key,
  });

  final bool isStale;
  final DateTime? fetchedAt;
  final Failure? refreshFailure;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final date = fetchedAt?.toLocal();
    final timestamp = date == null
        ? null
        : '${date.day.toString().padLeft(2, '0')}.'
              '${date.month.toString().padLeft(2, '0')}.'
              '${date.year} ${date.hour.toString().padLeft(2, '0')}:'
              '${date.minute.toString().padLeft(2, '0')}';
    final failure = refreshFailure;
    final message = failure != null
        ? 'Showing saved results. ${formatFailureMessage(context, failure)}'
        : isStale
        ? 'Showing saved results from $timestamp while refreshing.'
        : 'Showing saved results from $timestamp.';
    return Semantics(
      liveRegion: true,
      child: Material(
        color: scheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            children: [
              Icon(Icons.cloud_off_outlined, color: scheme.onTertiaryContainer),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(color: scheme.onTertiaryContainer),
                ),
              ),
              if (refreshFailure != null && onRetry != null)
                TextButton(onPressed: onRetry, child: const Text('Retry')),
            ],
          ),
        ),
      ),
    );
  }
}
