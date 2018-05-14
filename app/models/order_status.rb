class OrderStatus < ApplicationRecord

  has_many :orders

  def self.in_progress
    @in_progress ||= find_by(name: 'In Progress')
  end


end
