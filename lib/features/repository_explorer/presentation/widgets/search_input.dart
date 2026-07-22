import 'package:flutter/material.dart';
import 'package:github_repository_explorer/core/presentation/breakpoints.dart';

final class SearchInput extends StatelessWidget {
  const SearchInput({
    required this.controller,
    required this.onChanged,
    required this.onSubmitted,
    required this.onCleared,
    super.key,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onCleared;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, _) {
        final field = TextField(
          controller: controller,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          textInputAction: TextInputAction.search,
          autocorrect: false,
          enableSuggestions: false,
          decoration: InputDecoration(
            hintText: 'Search public repositories',
            labelText: 'Repository search',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: ValueListenableBuilder<TextEditingValue>(
              valueListenable: controller,
              builder: (context, value, child) => value.text.isEmpty
                  ? const SizedBox.shrink()
                  : IconButton(
                      tooltip: 'Clear search',
                      onPressed: onCleared,
                      icon: const Icon(Icons.close),
                    ),
            ),
          ),
        );
        if (MediaQuery.sizeOf(context).width < AppBreakpoints.tablet) {
          return field;
        }
        return Row(
          children: [
            Expanded(child: field),
            const SizedBox(width: 12),
            FilledButton.icon(
              onPressed: () => onSubmitted(controller.text),
              icon: const Icon(Icons.search),
              label: const Text('Search'),
              style: FilledButton.styleFrom(
                minimumSize: const Size(124, 56),
              ),
            ),
          ],
        );
      },
    );
  }
}
