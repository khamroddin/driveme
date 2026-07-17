# -----------------------------
# Clear transactional data first
# -----------------------------
puts "========== RUNNING SEEDS =========="



Booking.destroy_all

Vehicle.destroy_all

Customer.destroy_all

Amenity.destroy_all
Location.destroy_all

VehicleColor.destroy_all
TransmissionType.destroy_all
FuelType.destroy_all

VehicleBrand.destroy_all
VehicleCategory.destroy_all

User.where.not(email: "admin@driveme.com").destroy_all

admin = User.find_or_initialize_by(email: "admin@driveme.com")

admin.password = "Admin@123"
admin.password_confirmation = "Admin@123"
admin.role = "super_admin"

admin.save!

[
  { name: "Toyota", country: "Japan", status: true },
  { name: "Hyundai", country: "South Korea", status: true },
  { name: "Honda", country: "Japan", status: true },
  { name: "BMW", country: "Germany", status: true },
  { name: "Mercedes-Benz", country: "Germany", status: true }
].each do |brand|
  VehicleBrand.find_or_create_by!(name: brand[:name]) do |b|
    b.country = brand[:country]
    b.status = brand[:status]
  end
end

[
  {
    name: "Sedan",
    code: "SED",
    description: "Comfortable passenger cars suitable for city and highway driving.",
    active: true
  },
  {
    name: "Hatchback",
    code: "HAT",
    description: "Compact cars with rear hatch doors.",
    active: true
  },
  {
    name: "SUV",
    code: "SUV",
    description: "Sport Utility Vehicles with higher ground clearance.",
    active: true
  },
  {
    name: "MUV",
    code: "MUV",
    description: "Multi Utility Vehicles for families and groups.",
    active: true
  },
  {
    name: "Luxury",
    code: "LUX",
    description: "Premium luxury vehicles.",
    active: true
  },
  {
    name: "Convertible",
    code: "CON",
    description: "Vehicles with retractable roofs.",
    active: true
  },
  {
    name: "Pickup",
    code: "PIC",
    description: "Pickup trucks for cargo transportation.",
    active: true
  },
  {
    name: "Van",
    code: "VAN",
    description: "Passenger and cargo vans.",
    active: true
  },
  {
    name: "Electric",
    code: "EV",
    description: "Battery-powered electric vehicles.",
    active: true
  },
  {
    name: "Hybrid",
    code: "HYB",
    description: "Vehicles powered by both fuel and electricity.",
    active: true
  }
].each do |category|
  VehicleCategory.find_or_create_by!(name: category[:name]) do |c|
    c.code = category[:code]
    c.description = category[:description]
    c.active = category[:active]
  end
end
[
  "Petrol",
  "Diesel",
  "CNG",
  "LPG",
  "Electric",
  "Hybrid"
].each do |fuel|
  FuelType.find_or_create_by!(name: fuel) do |f|
    f.active = true
  end
end
[
  "Manual",
  "Automatic",
  "CVT",
  "AMT",
  "DCT"
].each do |name|
  TransmissionType.find_or_create_by!(name: name) do |t|
    t.active = true
  end
end
[
  "White",
  "Black",
  "Silver",
  "Grey",
  "Red",
  "Blue",
  "Brown",
  "Green",
  "Yellow",
  "Orange"
].each do |color|
  VehicleColor.find_or_create_by!(name: color) do |c|
    c.active = true
  end
end

[
  {
    name: "Hyderabad Branch",
    code: "HYD",
    city: "Hyderabad",
    state: "Telangana",
    country: "India",
    active: true
  },
  {
    name: "Bangalore Branch",
    code: "BLR",
    city: "Bangalore",
    state: "Karnataka",
    country: "India",
    active: true
  },
  {
    name: "Chennai Branch",
    code: "MAA",
    city: "Chennai",
    state: "Tamil Nadu",
    country: "India",
    active: true
  }
].each do |location|
  Location.find_or_create_by!(code: location[:code]) do |l|
    l.assign_attributes(location)
  end
end
[
  {
    name: "GPS Navigation",
    description: "Built-in GPS navigation system",
    active: true
  },
  {
    name: "Bluetooth",
    description: "Bluetooth connectivity",
    active: true
  },
  {
    name: "Reverse Camera",
    description: "Rear parking camera",
    active: true
  },
  {
    name: "Dash Camera",
    description: "Front dashboard camera",
    active: true
  },
  {
    name: "Child Seat",
    description: "Baby/Child safety seat",
    active: true
  },
  {
    name: "USB Charger",
    description: "USB charging ports",
    active: true
  },
  {
    name: "Airbags",
    description: "Driver and passenger airbags",
    active: true
  },
  {
    name: "ABS",
    description: "Anti-lock Braking System",
    active: true
  },
  {
    name: "Sunroof",
    description: "Electric sunroof",
    active: true
  },
  {
    name: "Cruise Control",
    description: "Automatic cruise control",
    active: true
  },
  {
    name: "Parking Sensors",
    description: "Front and rear parking sensors",
    active: true
  },
  {
    name: "Apple CarPlay",
    description: "Apple CarPlay support",
    active: true
  },
  {
    name: "Android Auto",
    description: "Android Auto support",
    active: true
  },
  {
    name: "Leather Seats",
    description: "Premium leather upholstery",
    active: true
  },
  {
    name: "Keyless Entry",
    description: "Remote keyless entry",
    active: true
  }
].each do |amenity|
  Amenity.find_or_create_by!(name: amenity[:name]) do |a|
    a.description = amenity[:description]
    a.active = amenity[:active]
  end
end

vehicles = [
  {
    vehicle_category: "SUV",
    vehicle_brand: "Toyota",
    fuel_type: "Diesel",
    transmission_type: "Automatic",
    vehicle_color: "White",
    location: "Hyderabad Branch",
    registration_number: "TS09AB1234",
    vin: "JTMBR32V205123456",
    model: "Fortuner",
    variant: "4X4 AT",
    manufacture_year: 2024,
    seating_capacity: 7,
    doors: 5,
    mileage: 12000,
    engine_capacity: "2755 CC",
    daily_rate: 4500,
    weekly_rate: 28000,
    monthly_rate: 95000,
    security_deposit: 10000,
    description: "Toyota Fortuner Diesel Automatic",
    status: :available
  },

  {
    vehicle_category: "SUV",
    vehicle_brand: "Hyundai",
    fuel_type: "Petrol",
    transmission_type: "Automatic",
    vehicle_color: "Black",
    location: "Bangalore Branch",
    registration_number: "KA01CD5678",
    vin: "MALBU81ULNM123456",
    model: "Creta",
    variant: "SX(O)",
    manufacture_year: 2023,
    seating_capacity: 5,
    doors: 5,
    mileage: 18000,
    engine_capacity: "1497 CC",
    daily_rate: 2800,
    weekly_rate: 17000,
    monthly_rate: 60000,
    security_deposit: 7000,
    description: "Hyundai Creta Automatic",
    status: :available
  },

  {
    vehicle_category: "Sedan",
    vehicle_brand: "Honda",
    fuel_type: "Petrol",
    transmission_type: "Manual",
    vehicle_color: "Silver",
    location: "Hyderabad Branch",
    registration_number: "TS08EF9988",
    vin: "MAKGM456123456789",
    model: "City",
    variant: "VX",
    manufacture_year: 2022,
    seating_capacity: 5,
    doors: 4,
    mileage: 22000,
    engine_capacity: "1498 CC",
    daily_rate: 2200,
    weekly_rate: 14000,
    monthly_rate: 50000,
    security_deposit: 5000,
    description: "Honda City Manual",
    status: :available
  },

  {
    vehicle_category: "Luxury",
    vehicle_brand: "BMW",
    fuel_type: "Petrol",
    transmission_type: "Automatic",
    vehicle_color: "Blue",
    location: "Chennai Branch",
    registration_number: "TN07GH7777",
    vin: "WBA12345678901234",
    model: "X5",
    variant: "xDrive30d",
    manufacture_year: 2025,
    seating_capacity: 5,
    doors: 5,
    mileage: 5000,
    engine_capacity: "2993 CC",
    daily_rate: 12000,
    weekly_rate: 72000,
    monthly_rate: 250000,
    security_deposit: 25000,
    description: "BMW X5 Luxury SUV",
    status: :available
  }
]

vehicles.each do |v|
  Vehicle.find_or_create_by!(registration_number: v[:registration_number]) do |vehicle|
    vehicle.vehicle_category = VehicleCategory.find_by!(name: v[:vehicle_category])
    vehicle.vehicle_brand = VehicleBrand.find_by!(name: v[:vehicle_brand])
    vehicle.fuel_type = FuelType.find_by!(name: v[:fuel_type])
    vehicle.transmission_type = TransmissionType.find_by!(name: v[:transmission_type])
    vehicle.vehicle_color = VehicleColor.find_by!(name: v[:vehicle_color])
    vehicle.location = Location.find_by!(name: v[:location])

    vehicle.vin = v[:vin]
    vehicle.model = v[:model]
    vehicle.variant = v[:variant]
    vehicle.manufacture_year = v[:manufacture_year]
    vehicle.seating_capacity = v[:seating_capacity]
    vehicle.doors = v[:doors]
    vehicle.mileage = v[:mileage]
    vehicle.engine_capacity = v[:engine_capacity]

    vehicle.daily_rate = v[:daily_rate]
    vehicle.weekly_rate = v[:weekly_rate]
    vehicle.monthly_rate = v[:monthly_rate]
    vehicle.security_deposit = v[:security_deposit]

    vehicle.description = v[:description]
    vehicle.status = v[:status]
  end
end

customers = [
  {
    first_name: "Mohammed",
    last_name: "Khan",
    mobile: "9876500001",
    alternate_mobile: "9876501001",
    email: "mohammed.khan@example.com",
    driving_license_no: "TS012023000001",
    license_expiry: Date.new(2030, 12, 31),
    id_proof_type: "Aadhaar",
    id_proof_number: "123412341234",
    address: "Banjara Hills",
    city: "Hyderabad",
    state: "Telangana",
    country: "India",
    pincode: "500034",
    notes: "Frequent corporate customer",
    status: true
  },
  {
    first_name: "Rahul",
    last_name: "Sharma",
    mobile: "9876500002",
    alternate_mobile: "9876501002",
    email: "rahul.sharma@example.com",
    driving_license_no: "KA012022000002",
    license_expiry: Date.new(2029, 8, 15),
    id_proof_type: "Aadhaar",
    id_proof_number: "234523452345",
    address: "Indiranagar",
    city: "Bengaluru",
    state: "Karnataka",
    country: "India",
    pincode: "560038",
    notes: "",
    status: true
  },
  {
    first_name: "Priya",
    last_name: "Reddy",
    mobile: "9876500003",
    alternate_mobile: "",
    email: "priya.reddy@example.com",
    driving_license_no: "TS012021000003",
    license_expiry: Date.new(2031, 5, 20),
    id_proof_type: "Passport",
    id_proof_number: "N1234567",
    address: "Madhapur",
    city: "Hyderabad",
    state: "Telangana",
    country: "India",
    pincode: "500081",
    notes: "Airport pickup preferred",
    status: true
  },
  {
    first_name: "Ahmed",
    last_name: "Ali",
    mobile: "9876500004",
    alternate_mobile: "",
    email: "ahmed.ali@example.com",
    driving_license_no: "KL012020000004",
    license_expiry: Date.new(2028, 11, 10),
    id_proof_type: "Passport",
    id_proof_number: "P9876543",
    address: "Kakkanad",
    city: "Kochi",
    state: "Kerala",
    country: "India",
    pincode: "682030",
    notes: "",
    status: true
  },
  {
    first_name: "Sneha",
    last_name: "Patil",
    mobile: "9876500005",
    alternate_mobile: "",
    email: "sneha.patil@example.com",
    driving_license_no: "MH012019000005",
    license_expiry: Date.new(2027, 3, 5),
    id_proof_type: "Aadhaar",
    id_proof_number: "987698769876",
    address: "Andheri West",
    city: "Mumbai",
    state: "Maharashtra",
    country: "India",
    pincode: "400058",
    notes: "VIP customer",
    status: true
  }
]

customers.each do |customer|
  c = Customer.find_or_initialize_by(email: customer[:email])

  c.assign_attributes(customer)

  # Set password only for new records
  if c.new_record?
    c.password = "Password@123"
    c.password_confirmation = "Password@123"
  end

  c.save!
end
