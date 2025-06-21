require "test_helper"

class SubjectTest < ActiveSupport::TestCase
  def setup
    @subject = Subject.new(
      name: "Programação Web Test",
      code: "CI9999",
      description: "Desenvolvimento de aplicações web usando Ruby on Rails"
    )
  end

  test "should be valid with valid attributes" do
    assert @subject.valid?
  end

  # Validation tests
  test "should require name" do
    @subject.name = nil
    assert_not @subject.valid?
    assert_includes @subject.errors[:name], "can't be blank"
  end

  test "should require code" do
    @subject.code = nil
    assert_not @subject.valid?
    assert_includes @subject.errors[:code], "can't be blank"
  end

  test "should require description" do
    @subject.description = nil
    assert_not @subject.valid?
    assert_includes @subject.errors[:description], "can't be blank"
  end

  test "should require unique code" do
    @subject.save!
    duplicate_subject = @subject.dup
    duplicate_subject.name = "Different Name"
    assert_not duplicate_subject.valid?
    assert_includes duplicate_subject.errors[:code], "has already been taken"
  end

  # Association tests
  test "should have many users through subjects_users" do
    assert_respond_to @subject, :users
  end
end