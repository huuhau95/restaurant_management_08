require "rails_helper"

RSpec.describe User, type: :model do

 describe "db schema" do
   context "columns" do
     it { should have_db_column(:email).of_type(:string) }
     it { should have_db_column(:name).of_type(:string) }
     it { should have_db_column(:password_digest).of_type(:string) }
     it { should have_db_column(:image).of_type(:string) }
     it { should have_db_column(:phone).of_type(:string) }
  end
end

describe "validations" do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_confirmation_of :password }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_length_of(:password).is_at_least 6 }
end

context "association" do
  it{should have_many :bills}
  it{should have_many :bookings}
  it{should have_many :reviews}
  it{should have_many(:dishes).through(:reviews)}
  it{should have_many(:tables).through(:bookings)}
end

describe ".order_created" do
 let!(:user){FactoryGirl.create(:user)}
end
end
