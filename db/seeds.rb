# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create admin user
admin = User.create!(
  name: "Administrator",
  email: "admin@university.com",
  phone: "(11) 99999-9999",
  academic_record: "ADM001",
  password: "password123",
  password_confirmation: "password123",
  role: "admin"
)

# Create students
students = [
  {
    name: "João Silva",
    email: "joao.silva@student.university.com",
    phone: "(11) 98888-8888",
    academic_record: "STU001",
    password: "password123",
    password_confirmation: "password123",
    role: "student"
  },
  {
    name: "Maria Santos",
    email: "maria.santos@student.university.com",
    phone: "(11) 97777-7777",
    academic_record: "STU002",
    password: "password123",
    password_confirmation: "password123",
    role: "student"
  },
  {
    name: "Pedro Oliveira",
    email: "pedro.oliveira@student.university.com",
    phone: "(11) 96666-6666",
    academic_record: "STU003",
    password: "password123",
    password_confirmation: "password123",
    role: "student"
  },
  {
    name: "Ana Costa",
    email: "ana.costa@student.university.com",
    phone: "(11) 95555-5555",
    academic_record: "STU004",
    password: "password123",
    password_confirmation: "password123",
    role: "student"
  },
  {
    name: "Carlos Ferreira",
    email: "carlos.ferreira@student.university.com",
    phone: "(11) 94444-4444",
    academic_record: "STU005",
    password: "password123",
    password_confirmation: "password123",
    role: "student"
  }
]

created_students = students.map { |student_data| User.create!(student_data) }

# Create subjects
subjects = [
  {
    name: "Programação Web",
    code: "CI1030",
    description: "Desenvolvimento de aplicações web utilizando tecnologias modernas como HTML, CSS, JavaScript e frameworks backend."
  },
  {
    name: "Banco de Dados",
    code: "CI1031",
    description: "Conceitos fundamentais de banco de dados, modelagem, SQL e administração de sistemas de gerenciamento de banco de dados."
  },
  {
    name: "Algoritmos e Estruturas de Dados",
    code: "CI1032",
    description: "Estudo de algoritmos eficientes e estruturas de dados fundamentais para resolução de problemas computacionais."
  },
  {
    name: "Engenharia de Software",
    code: "CI1033",
    description: "Metodologias e técnicas para desenvolvimento de software, incluindo análise de requisitos, design e testes."
  },
  {
    name: "Redes de Computadores",
    code: "CI1034",
    description: "Fundamentos de redes de computadores, protocolos de comunicação e arquiteturas de rede."
  }
]

created_subjects = subjects.map { |subject_data| Subject.create!(subject_data) }

# Enroll students in subjects
# João Silva enrolled in Programação Web and Banco de Dados
created_subjects[0].users << created_students[0]
created_subjects[1].users << created_students[0]

# Maria Santos enrolled in Programação Web and Algoritmos
created_subjects[0].users << created_students[1]
created_subjects[2].users << created_students[1]

# Pedro Oliveira enrolled in Banco de Dados and Engenharia de Software
created_subjects[1].users << created_students[2]
created_subjects[3].users << created_students[2]

# Ana Costa enrolled in Algoritmos and Redes
created_subjects[2].users << created_students[3]
created_subjects[4].users << created_students[3]

# Carlos Ferreira enrolled in Engenharia de Software and Redes
created_subjects[3].users << created_students[4]
created_subjects[4].users << created_students[4]

# Create monitorships
# Pedro Oliveira monitors Programação Web (he's not enrolled in it)
Monitorship.create!(
  user: created_students[2],
  subject: created_subjects[0]
)

# Ana Costa monitors Banco de Dados (she's not enrolled in it)
Monitorship.create!(
  user: created_students[3],
  subject: created_subjects[1]
)

puts "Database seeded successfully!"
puts "Admin user: admin@university.com / password123"
puts "Students created: #{created_students.count}"
puts "Subjects created: #{created_subjects.count}"
puts "Monitorships created: 2"
