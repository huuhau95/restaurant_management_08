require "rails_helper"

RSpec.describe Booking, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:table) { FactoryBot.create(:table) }

  context "associations" do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :table}
    it {is_expected.to have_many :booking_details}
   it {is_expected.to have_many(:dishes).through(:booking_details)}
   it {is_expected.to have_many :bills}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :time_start}
    it {is_expected.to validate_presence_of :time_end}
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_presence_of :email}
    it {is_expected.to validate_presence_of :address}
    it {is_expected.to validate_presence_of :phone}
  end

  context "validates enum" do
    it { should define_enum_for(:status).with([:pending, :serving, :complete]) }
  end

  describe "to delegate" do
    context "delegate for user" do
      it{should delegate_method(:name).to(:user).with_prefix}
    end

    context "delegate for table" do
      it{should delegate_method(:number_of_people).to(:table).with_prefix}
    end
  end

  describe "booking created" do
    let!(:booking) { FactoryBot.create(:booking, user_id:user.id, table_id: table.id) }
    let!(:booking1) { FactoryBot.create(:booking, user_id:user.id, table_id: table.id) }
    context "order by desc" do
      it{ expect(Booking.ordered).to eq [booking,booking1] }
    end
  end

  describe ".search" do
    context "search by name booking" do
      let!(:booking) { FactoryBot.create(:booking, user_id:user.id, table_id: table.id, name: "Huu Hau") }
      it do
        expect(Booking.search_by_type("Huu")).to eq [booking]
      end
    end

    context "filter by table" do
      let!(:booking) { FactoryBot.create(:booking, user_id:user.id, table_id: table.id, name: "Huu Hau") }
      it do
        expect(Booking.filter_by_table(table.id)).to eq [booking]
      end
    end
  end

  describe "creating Booking with valid attributes and nested Booking details attributes" do
    it { should accept_nested_attributes_for(:booking_details) }
  end
end
