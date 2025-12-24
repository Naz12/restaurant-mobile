import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/customers/data/models/customer_model.dart';
import '../../features/customers/presentation/providers/customer_provider.dart';
import '../../core/theme/app_theme.dart';

class CustomerSelectionModal extends ConsumerStatefulWidget {
  final Function(CustomerModel) onCustomerSelected;
  final CustomerModel? selectedCustomer;

  const CustomerSelectionModal({
    super.key,
    required this.onCustomerSelected,
    this.selectedCustomer,
  });

  @override
  ConsumerState<CustomerSelectionModal> createState() => _CustomerSelectionModalState();
}

class _CustomerSelectionModalState extends ConsumerState<CustomerSelectionModal> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool _showCreateForm = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customersAsync = ref.watch(customersProvider(_searchQuery.isEmpty ? null : _searchQuery));

    return Dialog(
      child: Container(
        width: 500,
        height: 600,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select Customer',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search by name, email, or phone...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _showCreateForm = !_showCreateForm;
                    });
                  },
                  icon: Icon(_showCreateForm ? Icons.close : Icons.add),
                  label: Text(_showCreateForm ? 'Cancel' : 'New Customer'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_showCreateForm) ...[
              _buildCreateForm(),
              const SizedBox(height: 16),
            ],
            Expanded(
              child: customersAsync.when(
                data: (customers) {
                  if (customers.isEmpty) {
                    return const Center(
                      child: Text('No customers found'),
                    );
                  }
                  return ListView.builder(
                    itemCount: customers.length,
                    itemBuilder: (context, index) {
                      final customer = customers[index];
                      final isSelected = widget.selectedCustomer?.id == customer.id;
                      return ListTile(
                        title: Text(customer.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (customer.phone != null) Text('Phone: ${customer.phone}'),
                            if (customer.email != null) Text('Email: ${customer.email}'),
                          ],
                        ),
                        trailing: isSelected
                            ? const Icon(Icons.check_circle, color: AppTheme.primaryPurple)
                            : null,
                        selected: isSelected,
                        onTap: () {
                          widget.onCustomerSelected(customer);
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: $error'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          ref.invalidate(customersProvider(_searchQuery.isEmpty ? null : _searchQuery));
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateForm() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create New Customer',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name *',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _showCreateForm = false;
                      _nameController.clear();
                      _emailController.clear();
                      _phoneController.clear();
                      _addressController.clear();
                    });
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () async {
                    if (_nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Name is required')),
                      );
                      return;
                    }
                    try {
                      final customer = await ref.read(createCustomerProvider({
                        'name': _nameController.text,
                        'email': _emailController.text.isEmpty ? null : _emailController.text,
                        'phone': _phoneController.text.isEmpty ? null : _phoneController.text,
                        'address': _addressController.text.isEmpty ? null : _addressController.text,
                      }).future);
                      widget.onCustomerSelected(customer);
                      Navigator.of(context).pop();
                    } catch (e) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to create customer: $e')),
                        );
                      }
                    }
                  },
                  child: const Text('Create'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

