import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/kots/data/models/cancel_reason_model.dart';

class CancelReasonModal extends ConsumerStatefulWidget {
  final String title;
  final Future<List<CancelReasonModel>> Function() loadReasons;
  final Future<void> Function(int reasonId, String? note) onConfirm;

  const CancelReasonModal({
    super.key,
    required this.title,
    required this.loadReasons,
    required this.onConfirm,
  });

  @override
  ConsumerState<CancelReasonModal> createState() => _CancelReasonModalState();
}

class _CancelReasonModalState extends ConsumerState<CancelReasonModal> {
  CancelReasonModel? _selectedReason;
  final TextEditingController _noteController = TextEditingController();
  List<CancelReasonModel> _reasons = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadReasons();
  }

  Future<void> _loadReasons() async {
    try {
      final reasons = await widget.loadReasons();
      setState(() {
        _reasons = reasons;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load cancel reasons: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else ...[
              const Text(
                'Select a reason:',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              ..._reasons.map((reason) {
                return RadioListTile<CancelReasonModel>(
                  title: Text(reason.reason),
                  value: reason,
                  groupValue: _selectedReason,
                  onChanged: (value) {
                    setState(() {
                      _selectedReason = value;
                    });
                  },
                );
              }),
              const SizedBox(height: 16),
              const Text(
                'Additional Note (Optional):',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _noteController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Enter additional details...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _selectedReason == null
                        ? null
                        : () async {
                            try {
                              await widget.onConfirm(
                                _selectedReason!.id,
                                _noteController.text.isEmpty
                                    ? null
                                    : _noteController.text,
                              );
                              if (mounted) {
                                Navigator.of(context).pop();
                              }
                            } catch (e) {
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Failed to cancel: $e')),
                                );
                              }
                            }
                          },
                    child: const Text('Confirm'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

