class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  #get all classes
  get "/classes" do
    dance_classes = DanceClass.all
    dance_classes.to_json
  end

  #get class by id
  get "/classes/:id" do
    dance_class = DanceClass.find(params[:id])
    dance_class.to_json(include: { registrations: { include: :student } })
  end

  #add class
  post '/classes' do
    dance_class = DanceClass.create(
      category: params[:category],
      location: params[:location],
      date: params[:date],
      starts_at: params[:starts_at],
      ends_at: params[:ends_at],
      duration: params[:duration]
    )
    dance_class.to_json
  end

  #Update class by id
  patch '/classes/:id' do
    dance_class = DanceClass.find(params[:id])
    dance_class.update(
      category: params[:category],
      location: params[:location],
      date: params[:date],
      starts_at: params[:starts_at],
      ends_at: params[:ends_at],
      duration: params[:duration]
    )
    dance_class.to_json
  end

  #delete class by id
  delete '/classes/:id' do
    dance_class = DanceClass.find(params[:id])
    dance_class.destroy
    dance_class.to_json
  end



  #get all students
  get "/students" do
    students = Student.all
    students.to_json
  end

  #get student by id
  get "/students/:id" do
    student = Student.find(params[:id])
    student.to_json(include: { registrations: { include: :dance_class } })
  end

  #add class
  post '/students' do
    student = Student.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      phone: params[:phone],
      email: params[:email]
    )
    student.to_json
  end

  #get all registrations
  get "/registrations" do
    registrations = Registration.all
    registrations.to_json
  end

  #add registration
  post '/registrations' do
    fee = params[:fee].to_i
    paid = false

    if fee == 10 
      paid = true
    end

    registration = Registration.create(
      fee: fee,
      paid: paid,
      student_id: params[:student_id],
      dance_class_id: params[:dance_class_id]
    )
    registration.to_json
  end

  #Update class by id
  patch '/registrations/:id' do
    fee = params[:fee].to_i
    paid = false

    if fee == 10 
      paid = true
    end

    registration = Registration.find(params[:id])
    registration.update(
      fee: fee,
      paid: paid
    )
    registration.to_json
  end

end
