class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :table
  has_many :booking_details
  has_many :dishes, through: :booking_details
  has_many :bills

  accepts_nested_attributes_for :booking_details, reject_if: :all_blank

  delegate :name, to: :user, prefix: true
  delegate :number_of_people, to: :table, prefix: true

  enum status: %i(pending serving complete)

  scope :search_by_type, ->(name){
    where("name LIKE ? or phone LIKE ?", "%#{name}%","%#{name}%") if name.present?}
  scope :filter_by_table, ->(table_id){where(table_id: table_id)if
    table_id.present?}
  scope :total_order, ->{count(:id)}
  scope :number_of_orders_by_status, ->{group(:status).count(:id)}
  scope :ordered, -> {order created_at: :desc}
  validates :time_start, presence: true
  validates :time_end, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :phone, presence: true
end
