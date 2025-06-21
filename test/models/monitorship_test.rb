require "test_helper"

class MonitorshipTest < ActiveSupport::TestCase
  def setup
    @student = User.create!(
      name: "Student Monitor Test",
      email: "student.test@example.com",
      phone: "41999999997",
      academic_record: "GRR20219988",
      password: "password123",
      role: :student
    )
    
    @admin = User.create!(
      name: "Admin User Test",
      email: "admin.test@example.com",
      phone: "41888888886",
      academic_record: "GRR20219987",
      password: "password123",
      role: :admin
    )
    
    @subject = Subject.create!(
      name: "Programação Web Test Monitor",
      code: "CI9998",
      description: "Desenvolvimento de aplicações web"
    )
    
    @monitorship = Monitorship.new(user: @student, subject: @subject)
  end

  test "should be valid with valid attributes" do
    assert @monitorship.valid?
  end

  # Association tests
  test "should belong to user" do
    assert_respond_to @monitorship, :user
    assert_equal @student, @monitorship.user
  end

  test "should belong to subject" do
    assert_respond_to @monitorship, :subject
    assert_equal @subject, @monitorship.subject
  end

  test "should require user" do
    @monitorship.user = nil
    assert_not @monitorship.valid?
    assert_includes @monitorship.errors[:user], "must exist"
  end

  test "should require subject" do
    @monitorship.subject = nil
    assert_not @monitorship.valid?
    assert_includes @monitorship.errors[:subject], "must exist"
  end

  # Uniqueness validation tests
  test "should enforce unique user-subject combination" do
    @monitorship.save!
    duplicate_monitorship = Monitorship.new(user: @student, subject: @subject)
    assert_not duplicate_monitorship.valid?
    assert_includes duplicate_monitorship.errors[:user_id], "has already been taken"
  end

  test "same user can monitor different subjects" do
    @monitorship.save!
    
    another_subject = Subject.create!(
      name: "Banco de Dados Test",
      code: "CI9997",
      description: "Sistemas de gerenciamento de banco de dados"
    )
    
    another_monitorship = Monitorship.new(user: @student, subject: another_subject)
    assert another_monitorship.valid?
  end

  test "different users can monitor same subject" do
    @monitorship.save!
    
    another_student = User.create!(
      name: "Another Student Test",
      email: "another.test@example.com",
      phone: "41777777776",
      academic_record: "GRR20219986",
      password: "password123",
      role: :student
    )
    
    another_monitorship = Monitorship.new(user: another_student, subject: @subject)
    assert another_monitorship.valid?
  end

  # Custom validation: user must be student
  test "should reject non-student users as monitors" do
    admin_monitorship = Monitorship.new(user: @admin, subject: @subject)
    assert_not admin_monitorship.valid?
    assert_includes admin_monitorship.errors[:user], "must be a student"
  end

  test "should accept student users as monitors" do
    assert @monitorship.valid?
    assert_not_includes @monitorship.errors[:user], "must be a student"
  end

  # Custom validation: user cannot monitor subject they are enrolled in
  test "should reject monitor who is enrolled in the subject" do
    # Enroll student in the subject
    @student.subjects << @subject
    
    assert_not @monitorship.valid?
    assert_includes @monitorship.errors[:user], "cannot be monitor of a subject they are enrolled in"
  end

  test "should accept monitor who is not enrolled in the subject" do
    # Make sure student is not enrolled
    @student.subjects.clear
    
    assert @monitorship.valid?
    assert_not_includes @monitorship.errors[:user], "cannot be monitor of a subject they are enrolled in"
  end

  test "should cascade delete when user is deleted" do
    @monitorship.save!
    monitorship_id = @monitorship.id
    
    @student.destroy
    
    assert_not Monitorship.exists?(monitorship_id)
  end

  test "should cascade delete when subject is deleted" do
    @monitorship.save!
    monitorship_id = @monitorship.id
    
    @subject.destroy
    
    assert_not Monitorship.exists?(monitorship_id)
  end
end