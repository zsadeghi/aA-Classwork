# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  validates :birth_date, :sex, :description, :name, presence: true
  validates_inclusion_of :sex, in: ["M", "F"], length: { minimum: 1}
  validates_inclusion_of :color, in: ["brown", "red", "blue", "purple"]

  def age
    Date.today.year - self.birth_date.year
  end

end
