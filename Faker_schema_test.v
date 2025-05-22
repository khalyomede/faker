module faker

struct UserProfile {
pub mut:
	first_name   string @[fake_source: 'first-name']
	last_name    string @[fake_source: 'last-name']
	company_name string @[fake_source: company_names]
	email        string @[fake_source: email_addresses]
	phone        string @[fake_source: phone_numbers]
}

fn test_generate_user_profiles() {
	mut ftl := FakerTypedList{
		helper: Faker{}
	}

	profiles := ftl.generate[UserProfile](10) or {
		print(err)
		[]UserProfile{}
	}
	assert profiles.len == 10

	for profile in profiles {
		assert profile.first_name.len > 0
		assert profile.last_name.len > 0
		assert profile.email.len > 0
		assert profile.phone.len > 0
		assert profile.company_name.len > 0
		println('Generated: ${profile}')
	}
}

struct Transaction {
	product_sku string @[fake_source: 'product_skus']
	price       string @[fake_source: 'cart_totals']
	timestamp   string @[fake_source: 'timestamps']
}

fn test_generate_transactions() {
	mut ftl := FakerTypedList{
		helper: Faker{}
	}

	txs := ftl.generate[Transaction](3) or {
		print(err)
		[]Transaction{}
	}
	assert txs.len == 3

	for tx in txs {
		assert tx.product_sku.starts_with('SKU') || tx.product_sku.len > 0
		assert tx.price.contains('.') || tx.price.len > 0
		assert tx.timestamp.len > 0
		println('Transaction: ${tx}')
	}
}
