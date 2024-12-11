class Booking < ApplicationRecord
  include Rails.application.routes.url_helpers
  acts_as_tenant :establishment

  has_one_attached :booking_qrcode, dependent: :destroy
  has_many :bookings_service_offers, dependent: :destroy
  has_many :service_offers, through: :bookings_service_offers
  has_many :bookings_results, dependent: :destroy
  has_many :results, through: :bookings_results

  scope :bookings_today, -> { where("DATE(booked_date) = ?", DateTime.now.to_date) }
  scope :bookings_this_month, -> { where("EXTRACT(MONTH FROM booked_date) = ?", DateTime.now.month) }
  scope :booked, -> { where(status: 'booked') }
  scope :no_show, -> { where(status: 'no-show') }
  scope :in_process, -> { where(status: 'processing') }
  scope :completed, -> { where(status: 'completed') }
  scope :waiting_for_result, -> { where(status: 'waiting-for-result') }
  validates :booked_date, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :middle_name, presence: true


  before_commit :generate_qrcode, on: :create
  before_create :set_que_number

  STATUSES = [['Booked','booked'], ['Processing','processing'], ['No Show','no-show'], ['Waiting for Result','waiting-for-result'],['Completed','completed']]

  def self.ransackable_attributes(auth_object = nil)
    ['last_name', 'first_name', 'booked_date', 'que_number']
  end

  def self.ransackable_associations(auth_object = nil)
    ["booking_service_offers", "establishment", "service_offers"]
  end

  def self.create_dummies
    establishment = Establishment.first

    for a in 1..50 do
      Booking.create!(
        booked_date: DateTime.now.to_date,
        establishment_id: establishment.id,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name
      )
    end
  end

  def customer_name
    "#{last_name}, #{first_name} #{middle_name}"
  end

  def pending?
    self.status == 'pending'
  end

  def booked?
    self.status == 'booked'
  end

  def total_to_pay
    self.bookings_service_offers.sum(:booked_price)
  end

  private

  def set_que_number
    booking_count = Booking.bookings_today.count + 1
    date = self.booked_date.to_date.strftime('%m%d%y')

    random_string = SecureRandom.alphanumeric(6)
    self.que_number = "#{date}-#{random_string}-#{booking_count}"
  end

  def generate_qrcode
    host = "#{self.establishment.subdomain}.#{Rails.application.config.action_controller.default_url_options[:host]}"

    qrcode = RQRCode::QRCode.new(booking_url(self, host:))

    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )

    self.booking_qrcode.attach(
      io: StringIO.new(png.to_s),
      filename: "qrcode.png",
      content_type: "image/png"
    )
  end
end
