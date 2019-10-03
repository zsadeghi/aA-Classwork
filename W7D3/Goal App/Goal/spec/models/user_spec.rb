require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    User.create!(
      username: "Kiki",
      password: "password"
    )

    describe "password encryption" do
      it "does not save passwords to the database" do
        User.create!(username: "Mal_brian", password: "werere")
        user = User.find_by(username: "Mal_brian")
        expect(user.password).not_to be("werere")
      end

      it "encrypts the password using BCrypt" do
        expect(BCrypt::Password).to recieve(:create)
        User.new(username: "Mal_brian", password: "werere")
      end
    end

    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username)}
    it { should have_many(:goals) }
    it { should have_many(:cheers_given) }
    it { should have_many(:cheers_received).through(:goals) }
  end
end
