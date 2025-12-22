import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/payment_repository.dart';
import '../../../../core/theme/app_theme.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  final int orderId;
  final double orderTotal;
  final String? orderNumber;
  
  const PaymentScreen({
    super.key,
    required this.orderId,
    required this.orderTotal,
    this.orderNumber,
  });

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  // Payment type
  bool _isFullPayment = true;
  
  // Payment methods
  String _selectedMethod1 = 'cash';
  String _selectedMethod2 = 'cash';
  
  // Amounts
  final _amountController1 = TextEditingController();
  final _amountController2 = TextEditingController();
  final _tipController1 = TextEditingController();
  final _tipController2 = TextEditingController();
  
  // State
  bool _isProcessing = false;
  
  double _amount1 = 0.0;
  double _amount2 = 0.0;
  double _tip1 = 0.0;
  double _tip2 = 0.0;
  
  @override
  void initState() {
    super.initState();
    _amountController1.text = widget.orderTotal.toStringAsFixed(2);
    _amount1 = widget.orderTotal;
    _amountController1.addListener(_updateAmount1);
    _amountController2.addListener(_updateAmount2);
    _tipController1.addListener(_updateTip1);
    _tipController2.addListener(_updateTip2);
  }

  void _updateAmount1() {
    setState(() {
      _amount1 = double.tryParse(_amountController1.text) ?? 0.0;
    });
  }

  void _updateAmount2() {
    setState(() {
      _amount2 = double.tryParse(_amountController2.text) ?? 0.0;
    });
  }

  void _updateTip1() {
    setState(() {
      _tip1 = double.tryParse(_tipController1.text) ?? 0.0;
    });
  }

  void _updateTip2() {
    setState(() {
      _tip2 = double.tryParse(_tipController2.text) ?? 0.0;
    });
  }

  @override
  void dispose() {
    _amountController1.dispose();
    _amountController2.dispose();
    _tipController1.dispose();
    _tipController2.dispose();
    super.dispose();
  }

  double get _totalPayable {
    if (_isFullPayment) {
      return _amount1 + _tip1;
    } else {
      return _amount1 + _tip1 + _amount2 + _tip2;
    }
  }

  double get _dueAmount {
    return widget.orderTotal - _totalPayable;
  }

  void _setQuickAmount(double amount, int field) {
    if (field == 1) {
      _amountController1.text = amount.toStringAsFixed(2);
      _amount1 = amount;
    } else {
      _amountController2.text = amount.toStringAsFixed(2);
      _amount2 = amount;
    }
  }

  void _appendToAmount(String digit, int field) {
    final controller = field == 1 ? _amountController1 : _amountController2;
    final current = controller.text.replaceAll(RegExp(r'[^\d.]'), '');
    if (digit == '.' && current.contains('.')) return;
    if (current.isEmpty && digit == '.') {
      controller.text = '0.';
    } else {
      controller.text = current + digit;
    }
    if (field == 1) {
      _amount1 = double.tryParse(controller.text) ?? 0.0;
    } else {
      _amount2 = double.tryParse(controller.text) ?? 0.0;
    }
  }

  void _backspaceAmount(int field) {
    final controller = field == 1 ? _amountController1 : _amountController2;
    if (controller.text.isNotEmpty) {
      controller.text = controller.text.substring(0, controller.text.length - 1);
    }
    if (field == 1) {
      _amount1 = double.tryParse(controller.text) ?? 0.0;
    } else {
      _amount2 = double.tryParse(controller.text) ?? 0.0;
    }
  }

  Future<void> _processPayment() async {
    if (_isFullPayment) {
      if (_amount1 <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter payment amount'),
            backgroundColor: AppTheme.errorRed,
          ),
        );
        return;
      }
    } else {
      if (_amount1 <= 0 || _amount2 <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter payment amounts for both methods'),
            backgroundColor: AppTheme.errorRed,
          ),
        );
        return;
      }
    }

    setState(() {
      _isProcessing = true;
    });

    try {
      final repository = ref.read(paymentRepositoryProvider);
      
      if (_isFullPayment) {
        // Single payment
        await repository.processPayment(
          orderId: widget.orderId,
          paymentMethod: _selectedMethod1,
          amount: _amount1,
          tipAmount: _tip1 > 0 ? _tip1 : null,
        );
      } else {
        // Split payment - process two payments
        await repository.processPayment(
          orderId: widget.orderId,
          paymentMethod: _selectedMethod1,
          amount: _amount1,
          tipAmount: _tip1 > 0 ? _tip1 : null,
        );
        await repository.processPayment(
        orderId: widget.orderId,
          paymentMethod: _selectedMethod2,
          amount: _amount2,
          tipAmount: _tip2 > 0 ? _tip2 : null,
      );
      }

      if (mounted) {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Payment processed successfully'),
            backgroundColor: AppTheme.successGreen,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Payment failed: $e'),
            backgroundColor: AppTheme.errorRed,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppTheme.cardBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        constraints: const BoxConstraints(maxWidth: 800),
        padding: const EdgeInsets.all(24),
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                      'Payment',
                        style: TextStyle(
                        fontSize: 24,
                          fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                        ),
                      ),
                    if (widget.orderNumber != null)
                      Text(
                        '${widget.orderNumber} \$${widget.orderTotal.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                  color: AppTheme.textSecondary,
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Payment type selection
            Row(
              children: [
                Expanded(
                  child: _PaymentTypeButton(
                    label: 'Full Payment',
                    isSelected: _isFullPayment,
                    onTap: () {
                            setState(() {
                        _isFullPayment = true;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _PaymentTypeButton(
                    label: 'Split Bill',
                    isSelected: !_isFullPayment,
                    onTap: () {
                      setState(() {
                        _isFullPayment = false;
                            });
                        },
                      ),
                  ),
              ],
              ),
            const SizedBox(height: 24),
            // Payment sections
            if (_isFullPayment)
              _buildPaymentSection(1)
            else
              Row(
                children: [
                  Expanded(child: _buildPaymentSection(1)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildPaymentSection(2)),
                ],
              ),
            const SizedBox(height: 24),
            // Payment summary
            Container(
                  padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.darkBackground,
                borderRadius: BorderRadius.circular(8),
              ),
                  child: Column(
                    children: [
                  _buildSummaryRow('Total', widget.orderTotal),
                  _buildSummaryRow(
                    'Payable Amount',
                    _totalPayable,
                    isHighlight: true,
                  ),
                  _buildSummaryRow(
                    'Due Amount',
                    _dueAmount,
                    isError: _dueAmount > 0,
                  ),
                ],
                        ),
                      ),
            const SizedBox(height: 24),
            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: AppTheme.textSecondary),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: AppTheme.textPrimary),
                  ),
                ),
              ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                onPressed: _isProcessing ? null : _processPayment,
                style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryPurple,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: _isProcessing
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                      )
                        : const Text('Complete Payment'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentSection(int field) {
    final selectedMethod = field == 1 ? _selectedMethod1 : _selectedMethod2;
    final amountController = field == 1 ? _amountController1 : _amountController2;
    final tipController = field == 1 ? _tipController1 : _tipController2;
    final amount = field == 1 ? _amount1 : _amount2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Payment method buttons
        Row(
          children: [
            _PaymentMethodButton(
              label: 'Cash',
              isSelected: selectedMethod == 'cash',
              onTap: () {
                setState(() {
                  if (field == 1) {
                    _selectedMethod1 = 'cash';
                  } else {
                    _selectedMethod2 = 'cash';
                  }
                });
              },
            ),
            const SizedBox(width: 8),
            _PaymentMethodButton(
              label: 'Card',
              isSelected: selectedMethod == 'card',
              onTap: () {
                setState(() {
                  if (field == 1) {
                    _selectedMethod1 = 'card';
                  } else {
                    _selectedMethod2 = 'card';
                  }
                });
              },
            ),
            const SizedBox(width: 8),
            _PaymentMethodButton(
              label: 'UPI',
              isSelected: selectedMethod == 'upi',
              onTap: () {
                setState(() {
                  if (field == 1) {
                    _selectedMethod1 = 'upi';
                  } else {
                    _selectedMethod2 = 'upi';
                  }
                });
              },
            ),
            const SizedBox(width: 8),
            _PaymentMethodButton(
              label: 'Bank Transfer',
              isSelected: selectedMethod == 'bank_transfer',
              onTap: () {
                setState(() {
                  if (field == 1) {
                    _selectedMethod1 = 'bank_transfer';
                  } else {
                    _selectedMethod2 = 'bank_transfer';
                  }
                });
              },
            ),
            const SizedBox(width: 8),
            _PaymentMethodButton(
              label: 'Due',
              isSelected: selectedMethod == 'due',
              onTap: () {
                setState(() {
                  if (field == 1) {
                    _selectedMethod1 = 'due';
                  } else {
                    _selectedMethod2 = 'due';
                  }
                });
              },
              ),
            ],
        ),
        const SizedBox(height: 16),
        // Tip button
        ElevatedButton.icon(
          onPressed: () {
            // TODO: Show tip input dialog
          },
          icon: const Icon(Icons.attach_money, size: 16),
          label: const Text('Add Tip'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.cardBackground,
            foregroundColor: AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        // Amount input
        TextField(
          controller: amountController,
          readOnly: true,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
          ),
          decoration: InputDecoration(
            labelText: 'Amount',
            labelStyle: const TextStyle(color: AppTheme.textSecondary),
            filled: true,
            fillColor: AppTheme.darkBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF4B5563)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF4B5563)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppTheme.primaryPurple, width: 2),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Quick amount buttons
        Row(
          children: [
            Expanded(
              child: _QuickAmountButton(
                amount: 50.0,
                onTap: () => _setQuickAmount(50.0, field),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _QuickAmountButton(
                amount: 100.0,
                onTap: () => _setQuickAmount(100.0, field),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _QuickAmountButton(
                amount: 500.0,
                onTap: () => _setQuickAmount(500.0, field),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _QuickAmountButton(
                amount: 1000.0,
                onTap: () => _setQuickAmount(1000.0, field),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Numpad
        _buildNumpad(field),
      ],
    );
  }

  Widget _buildNumpad(int field) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 1.5,
      children: [
        _NumpadButton(label: '1', onTap: () => _appendToAmount('1', field)),
        _NumpadButton(label: '2', onTap: () => _appendToAmount('2', field)),
        _NumpadButton(label: '3', onTap: () => _appendToAmount('3', field)),
        _NumpadButton(label: '4', onTap: () => _appendToAmount('4', field)),
        _NumpadButton(label: '5', onTap: () => _appendToAmount('5', field)),
        _NumpadButton(label: '6', onTap: () => _appendToAmount('6', field)),
        _NumpadButton(label: '7', onTap: () => _appendToAmount('7', field)),
        _NumpadButton(label: '8', onTap: () => _appendToAmount('8', field)),
        _NumpadButton(label: '9', onTap: () => _appendToAmount('9', field)),
        _NumpadButton(label: '.', onTap: () => _appendToAmount('.', field)),
        _NumpadButton(label: '0', onTap: () => _appendToAmount('0', field)),
        _NumpadButton(
          label: '⌫',
          onTap: () => _backspaceAmount(field),
          icon: Icons.backspace,
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, double amount, {bool isHighlight = false, bool isError = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: isError ? AppTheme.errorRed : AppTheme.textPrimary,
              fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 16,
              color: isError 
                  ? AppTheme.errorRed 
                  : isHighlight 
                      ? AppTheme.primaryPurple 
                      : AppTheme.textPrimary,
              fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentTypeButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentTypeButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryPurple : AppTheme.cardBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : AppTheme.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class _PaymentMethodButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentMethodButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected 
                ? AppTheme.primaryPurple.withOpacity(0.2) 
                : AppTheme.darkBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? AppTheme.primaryPurple : Colors.transparent,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? AppTheme.primaryPurple : AppTheme.textPrimary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _QuickAmountButton extends StatelessWidget {
  final double amount;
  final VoidCallback onTap;

  const _QuickAmountButton({
    required this.amount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppTheme.darkBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFF4B5563)),
        ),
        child: Center(
          child: Text(
            '\$${amount.toStringAsFixed(2)}',
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

class _NumpadButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final IconData? icon;

  const _NumpadButton({
    required this.label,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.darkBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFF4B5563)),
        ),
        child: Center(
          child: icon != null
              ? Icon(icon, color: AppTheme.textPrimary)
              : Text(
                  label,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
          ),
        ),
      ),
    );
  }
}
