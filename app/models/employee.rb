class Employee < ApplicationRecord

	belongs_to :manager, class_name: "Employee", optional: true

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :department, presence: true
	validates :salary, presence: true, numericality: { greater_than: 0 }

	scope :search, ->(query) { 
		where( 
			"name LIKE :query OR email LIKE :query OR department LIKE :query", query: "%#{query}%"
			)
	}
end
