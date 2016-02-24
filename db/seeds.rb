# Users
jane  = User.create!(name: 'Jane')
peter = User.create!(name: 'Peter')
luke  = User.create!(name: 'Luke')

# Users phone numbers
jane.numbers.create!(sip_endpoint: 'sip:jane160224131109@phone.plivo.com', name: 'Mac telephone')
peter.numbers.create!(sip_endpoint: 'sip:peter160224131456@phone.plivo.com', name: 'Mac telephone')
luke.numbers.create!(sip_endpoint: 'sip:luke160224131539@phone.plivo.com', name: 'Mac telephone')

# Company numbers
[
  { name: 'Main Office', sip_endpoint: 'sip:mainoffice160224131220@phone.plivo.com' },
  { name: 'Sales', sip_endpoint: 'sip:sales160224134003@phone.plivo.com' },
  { name: 'Support', sip_endpoint: 'sip:support160224131313@phone.plivo.com' }
].each do |attrs|
  CompanyNumber.create!(attrs)
end
