host = User.create!(name: 'john', email: 'john@email.com')
guest = User.create!(name: 'max', email: 'max@email.com')
meeting_1 = Meeting.create(location_name: "John's House",
      location_address: "1583 Newton St. Denver CO",
      host_name: "john",
      guest_name: "max"
    )
