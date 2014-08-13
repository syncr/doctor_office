require 'pg'
require './lib/appointment'
require './lib/insurance'
require './lib/doctor'
require './lib/patient'

DB = PG.connect({:dbname => 'medical_system'})

def start
  system 'clear'
  puts "Welcome to the Medical System"
  puts "Pick an option"

  puts "1 = new doctor"
  puts "2 = list doctors"
  puts "3 = new appointment"
  puts "4 = list appointment"

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
      list_doctors
      menu2
    when '3'
      new_appointment
      puts "Ok, your doctor has been created"
      menu3
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
  sleep(10)
end

start
