require_relative('../models/student.rb')

Student.delete_all()

student1 = Student.new({
    "first_name" => "Harry",
    "last_name" => "Potter",
    "house" => "Gryffindor",
    "age" => 14
  })

student2 = Student.new({
    "first_name" => "Ron",
    "last_name" => "Weasley",
    "house" => "Gryffindor",
    "age" => 13
  })

student3 = Student.new({
    "first_name" => "Hermiona",
    "last_name" => "Grenger",
    "house" => "Gryffindor",
    "age" => 12
  })

  student1.save()
  student2.save()
  student3.save()
