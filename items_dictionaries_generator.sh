#!/bin/bash

set -e

faker_data=data/en
mkdir -p $faker_data

# 1. Contact Information
cat > $faker_data/email_addresses.txt <<EOF
alice@example.com
bob.smith@gmail.com
charlie99@yahoo.com
diana.jones@protonmail.com
user.name+filter@domain.co.uk
john_doe@company.org
jenny@outlook.com
hello@startup.ai
admin@website.io
support@helpdesk.net
EOF

cat > $faker_data/phone_numbers.txt <<EOF
+1-202-555-0173
+44 7911 123456
+33 6 12 34 56 78
+49 157 12345678
+61 412 345 678
+39 347 1234567
+91 98765 43210
+81 90-1234-5678
+55 21 91234-5678
+7 926 123-45-67
EOF

cat > $faker_data/mailing_addresses.txt <<EOF
New York, NY, 10001, USA
London, ENG, SW1A 1AA, UK
Paris, Île-de-France, 75001, France
Berlin, BE, 10115, Germany
Sydney, NSW, 2000, Australia
Rome, RM, 00100, Italy
Mumbai, MH, 400001, India
Tokyo, Kantō, 100-0001, Japan
São Paulo, SP, 01000-000, Brazil
Moscow, Moscow Oblast, 101000, Russia
EOF

cat > $faker_data/social_handles.txt <<EOF
@the_real_alice
@bobsmith_dev
@charlie.cat
@diana_illustrates
@user123456
@johnDoe1984
@jenny.codes
@helloworldio
@admin_404
@support_bot
EOF

# 2. Technical / IT

cat > $faker_data/ip_addresses.txt <<EOF
192.168.0.1
10.0.0.42
172.16.5.5
8.8.8.8
1.1.1.1
2001:0db8:85a3:0000:0000:8a2e:0370:7334
fe80::1ff:fe23:4567:890a
::1
fc00::/7
ff02::1
EOF

cat > $faker_data/urls_domains.txt <<EOF
https://example.com
http://localhost:3000
https://dev.api.company.org
https://shop.example.co.uk
http://intranet.internal
https://news.ycombinator.com
https://github.com
https://my-site.dev
https://dashboard.app.io
http://blog.engineering.net
EOF

cat > $faker_data/user_agents.txt <<EOF
Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/120.0.0.0 Safari/537.36
Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Gecko/20100101 Firefox/117.0
Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 Chrome/118.0.0.0 Safari/537.36
Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 Version/15.0 Mobile/15E148 Safari/604.1
Mozilla/5.0 (Android 12; Mobile; rv:99.0) Gecko/99.0 Firefox/99.0
curl/7.79.1
PostmanRuntime/7.28.0
python-requests/2.28.1
Go-http-client/2.0
okhttp/4.9.0
EOF

cat > $faker_data/mac_addresses.txt <<EOF
00:1A:2B:3C:4D:5E
01:23:45:67:89:AB
DE:AD:BE:EF:00:01
FE:DC:BA:98:76:54
10:20:30:40:50:60
AA:BB:CC:DD:EE:FF
08:00:27:00:12:34
FC:FB:FB:01:FA:CE
00:0C:29:7D:8E:9F
3C:5A:B4:21:43:65
EOF

cat > $faker_data/uuids.txt <<EOF
550e8400-e29b-41d4-a716-446655440000
f47ac10b-58cc-4372-a567-0e02b2c3d479
6ba7b810-9dad-11d1-80b4-00c04fd430c8
123e4567-e89b-12d3-a456-426614174000
9e107d9d-3721-4b71-a97f-ef9c5a1f4eab
3fa85f64-5717-4562-b3fc-2c963f66afa6
6f1a20dc-6e2c-4f89-8adf-c50c1d4e5e3e
fe56c2b1-3dd2-44f1-b15a-1b7a457e4e3e
c1a0de3c-667e-4fc2-92c7-bb4c3b1890f1
dcab3b6d-2d45-4c66-89ab-e86b80f6e7da
EOF

cat > $faker_data/file_names.txt <<EOF
document.pdf
resume.docx
report.csv
image.jpeg
profile.png
logfile.log
database.sqlite
archive.tar.gz
script.sh
presentation.pptx
README.md
index.html
app.js
main.py
module.rs
EOF

echo "✅ Faker data files generated in ./faker_data"


# 3. Financial

cat > $faker_data/ibans.txt <<EOF
DE89370400440532013000
GB82WEST12345698765432
FR1420041010050500013M02606
ES9121000418450200051332
IT60X0542811101000000123456
NL91ABNA0417164300
BE68539007547034
CH9300762011623852957
AT611904300234573201
PT50000201231234567890154
EOF

cat > $faker_data/credit_cards.txt <<EOF
4111111111111111
5500000000000004
340000000000009
30000000000004
6011000000000004
3530111333300000
6304000000000000
5018000000000009
6762480000000000
5890050000000012
EOF

cat > $faker_data/currency_values.txt <<EOF
12.99 USD
99.50 EUR
1500.00 GBP
32.75 CAD
45000.00 JPY
0.99 CHF
89.10 AUD
120.00 SEK
74.55 INR
130.00 PLN
EOF

cat > $faker_data/prices_with_tax.txt <<EOF
10.00 -> 11.90 EUR
25.00 -> 29.75 USD
99.99 -> 119.99 GBP
5.00 -> 6.15 CAD
100.00 -> 123.00 CHF
15.75 -> 18.52 AUD
8.50 -> 10.12 JPY
34.00 -> 40.46 PLN
200.00 -> 238.00 NOK
60.00 -> 71.40 SEK
EOF

# 4. Identifiers

cat > $faker_data/auto_ids.txt <<EOF
1
2
3
4
5
6
7
8
9
10
EOF

cat > $faker_data/barcodes.txt <<EOF
9780306406157
4006381333931
73513537
123456789012
5012345678900
9781861972712
9781234567897
5901234123457
4260143270013
8901234567893
EOF

# 5. Business

cat > $faker_data/company_names.txt <<EOF
Globex Corporation
Initech
Umbrella Corp
Stark Industries
Wayne Enterprises
Hooli
Massive Dynamic
Aperture Science
Cyberdyne Systems
Wonka Industries
EOF

cat > $faker_data/job_titles.txt <<EOF
Software Engineer
Project Manager
UX Designer
Data Scientist
DevOps Specialist
Marketing Director
Financial Analyst
HR Generalist
Legal Counsel
Product Owner
EOF

cat > $faker_data/product_names.txt <<EOF
UltraClean 3000
WidgetMaster Pro
EcoLite Bulb
NanoDrone X5
ThermoBottle Z
QuickCharge Pad
AirBliss Fan
GreenGrow Kit
PocketProjector
FlexiChair Ergo
EOF

cat > $faker_data/departments.txt <<EOF
Engineering
Marketing
Sales
Finance
Legal
Human Resources
Customer Support
Operations
IT Services
Research and Development
EOF

echo "✅ Additional faker data files generated in \$faker_data = $faker_data"


# 6. E-commerce

cat > $faker_data/product_skus.txt <<EOF
SKU-0001-A1
PRD-442-BX
ITEM-98321-QZ
SKU-2024-RED
PN-1221-BLACK
ART-789X-V2
XG-400-ZX
MOD-512-YELLOW
WTCH-XL-002
BOX-0098-GREEN
EOF

cat > $faker_data/cart_totals.txt <<EOF
12.50
49.99
5.00
100.75
250.00
0.99
74.30
19.99
300.00
2.49
EOF

cat > $faker_data/transactions.txt <<EOF
2024-01-10T10:45:00Z, Visa
2024-02-15T16:00:30Z, PayPal
2024-03-01T09:30:45Z, Mastercard
2024-04-12T14:12:12Z, Apple Pay
2024-05-20T18:25:00Z, Google Pay
2024-06-02T22:11:45Z, AMEX
2024-07-07T07:30:30Z, Stripe
2024-08-09T19:00:00Z, Revolut
2024-09-01T12:20:20Z, Direct Debit
2024-10-11T23:59:59Z, Cash
EOF

# 7. Customizable Text

cat > $faker_data/markdown_snippets.txt <<EOF
# Welcome to Our App

**Bold** and _italic_ styles supported.

- Feature 1
- Feature 2

> This is a blockquote.

\`\`\`python
def hello():
    print("Hello, world!")
\`\`\`
EOF

cat > $faker_data/html_fragments.txt <<EOF
<div class="card">
  <h1>Title</h1>
  <p>This is a <strong>sample</strong> paragraph.</p>
</div>

<ul>
  <li>Item A</li>
  <li>Item B</li>
</ul>

<img src="image.jpg" alt="Sample image" />
EOF

cat > $faker_data/sql_queries.txt <<EOF
SELECT * FROM users WHERE active = 1;

INSERT INTO orders (user_id, total, status) VALUES (1, 99.99, 'pending');

UPDATE products SET stock = stock - 1 WHERE id = 42;

DELETE FROM sessions WHERE created_at < NOW() - INTERVAL '30 days';
EOF

# 8. Scientific / Engineering

cat > $faker_data/geocoordinates.txt <<EOF
40.7128,-74.0060
51.5074,-0.1278
48.8566,2.3522
35.6895,139.6917
-33.8688,151.2093
52.5200,13.4050
55.7558,37.6176
34.0522,-118.2437
41.9028,12.4964
37.7749,-122.4194
EOF

cat > $faker_data/units.txt <<EOF
12.5 cm
45 kg
98.6 °F
37.0 °C
3.3 m
0.75 liters
1.8 bar
2.5 g/cm³
5 m/s²
300 lux
EOF

cat > $faker_data/timestamps.txt <<EOF
1716459600
2025-05-23T21:00:00+02:00
Friday, 23 May 2025 21:00
2025-05-23 19:00:00 UTC
05/23/2025 21:00
May 23, 2025 9:00 PM
2025-05-23T19:00:00Z
2025-W21-5
20250523T190000Z
EOF

echo "✅ Final faker data files added in \$faker_data = $faker_data"
