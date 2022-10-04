puts "🌱 Seeding spices..."

  # Make 
  ["Jazz", "Tap Dance", "Belly Dance", "Salsa", "Bollywood"].each do |dance_category|
    # create a game with random data
    dance_class = DanceClass.create(
      category: dance_category,
      location: Faker::Address.city,
      date: Faker::Date.forward(days: 20),
      starts_at: "10:00 AM",
      ends_at: "11:00 AM",
      duration: 1)
    
    student = Student.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      phone: Faker::PhoneNumber.cell_phone,
      email: Faker::Internet.email)
  
    # A registration belongs to a dance_class and a student, so we must provide those foreign keys
    Registration.create(
      fee: 10,
      paid: true,
      student_id: student.id,
      dance_class_id: dance_class.id)

  end

puts "✅ Done seeding!"
