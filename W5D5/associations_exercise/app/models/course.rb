class Course < ApplicationRecord

  validates :name, :instructor_id, presence: true

  has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment

  has_many :enrolled_students,
    through: :enrollments,
    source: :user

  belongs_to :advanced_course,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: :Course

  has_one :prereq_course,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: :Course

  has_one :instructor,
    primary_key: :instructor_id,
    foreign_key: :id,
    class_name: :User

end
