require_relative('../db/sql_runner.rb')

class Student

  attr_reader :id;
  attr_accessor :first_name, :last_name, :house, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house']
    @age = options['age']
  end

  def save()
    sql = "INSERT INTO students
    (
      first_name,
      last_name,
      house,
      age
    )
    VALUES
    (
        $1, $2, $3, $4
    )
    RETURNING id"
    values = [@first_name, @last_name, @house, @age]
    student_data = SqlRunner.run(sql, values)
    @id = student_data[0]['id'].to_i
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM students WHERE id = $1"
    student = SqlRunner.run(sql, [id])
    return Student.new(student[0])
  end

  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    return students.map{ |student| Student.new(student) }
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

end
