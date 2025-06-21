require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: "João Silva Test",
      email: "joao.test@example.com",
      phone: "41999999998",
      academic_record: "GRR20219999",
      password: "password123",
      role: :student
    )
  end

  test "should be valid with valid attributes" do
    assert @user.valid?
  end

  # Validation tests
  test "should require name" do
    @user.name = nil
    assert_not @user.valid?
    assert_includes @user.errors[:name], "can't be blank"
  end

  test "should require email" do
    @user.email = nil
    assert_not @user.valid?
    assert_includes @user.errors[:email], "can't be blank"
  end

  test "should require unique email" do
    @user.save!
    duplicate_user = @user.dup
    duplicate_user.academic_record = "GRR20219998"
    assert_not duplicate_user.valid?
    assert_includes duplicate_user.errors[:email], "has already been taken"
  end

  test "should require unique academic record" do
    @user.save!
    duplicate_user = @user.dup
    duplicate_user.email = "different@example.com"
    assert_not duplicate_user.valid?
    assert_includes duplicate_user.errors[:academic_record], "has already been taken"
  end

  test "should have default student role" do
    user = User.create!(
      name: "Test User Default",
      email: "test.default@example.com",
      phone: "41888888887",
      academic_record: "GRR20219997",
      password: "password123"
    )
    assert user.student?
  end

  # Association tests
  test "should have many subjects through subjects_users" do
    assert_respond_to @user, :subjects
  end

  # Role tests
  test "should respond to role methods" do
    @user.role = :student
    assert @user.student?
    assert_not @user.admin?

    @user.role = :admin
    assert @user.admin?
    assert_not @user.student?
  end

  # Integration tests
  test "student can enroll in subjects" do
    @user.save!
    subject = subjects(:one)
    @user.subjects << subject
    assert_includes @user.subjects, subject
  end
end