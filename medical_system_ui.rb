require 'pg'
require './lib/appointment'
require './lib/insurance'
require './lib/doctor'
require './lib/patient'

DB = PG.connect({:dbname => 'medical_system'})

def clear
  system 'clear'
  start
end

def start
  puts "Welcome to the Medical System\n"
  puts "Pick an option:\n"

  puts "1 = new doctor"
  puts "2 = list doctors\n"

  puts "3 = new patient"
  puts "4 = list patients\n"

  puts "5 = new appointment"
  puts "6 = list appointment"

  menu1
end

def menu1
  menu_option = gets.chomp
  case menu_option
    when '1'
      new_doctor
      puts "Ok, your doctor has been created"
      start
    when '2'
      system 'clear'
      puts Doctor.names

      # menu2
    when '3'
      new_patient
      puts "Ok, your patient has been created"
      # menu1
    when '4'
      system "clear"
      list_patients
      # menu3
    when '5'
      new_appointment
      puts "Ok, your doctor has been created"
      # menu3
    when '6'
      new_appointment
      puts "Ok, your doctor has been created"
      # menu3
    else "sorry I don't understand that"
    menu1
  end
end

def new_doctor
  puts "Doctors name:"
  name = gets.chomp
  puts "Specialty:"
  specialty = gets.chomp
  puts "Insurance:"
  insurance = gets.chomp
  puts "Max clients:"
  max_clients = gets.chomp

  Doctor.add_doctor_db(name, specialty, insurance, max_clients)
  puts "#{name} who specializes in #{specialty} was added to the database."
  start
end

def new_appointment

  puts "Please provide appt. details:\n"

  puts "The following doctors are available for chomping:"
  puts Doctor.names
  puts "Doctors name:"
  doctor = gets.chomp

  puts "The following patients are available for chomping:"
  puts Patient.list_patient_db
  puts "Patient Name:"
  patient = gets.chomp

  Appointment.date
  puts "Please provide a chomp date:"
  date = gets.chomp

  Appointment.cost
  puts "Please provide a cost per chomp'ointment:"
  cost = gets.chomp

  Appointment.schedule(doctor, patient, date, cost)
  puts "#{doctor} will see #{patient} on #{date} for #{cost}."
  start
end

clear
