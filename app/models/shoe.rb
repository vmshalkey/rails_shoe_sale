class Shoe < ActiveRecord::Base
	belongs_to :user
	has_many :purchases, dependent: :destroy

	validates :name, presence: true, length: { minimum: 2 }
	validates :amount, presence: true

	before_save :default_values
	def default_values
		self.purchased ||= "false"
	end
end
