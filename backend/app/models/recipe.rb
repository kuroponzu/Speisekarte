# == Schema Information
#
# Table name: recipes
#
#  id           :bigint           not null, primary key
#  title        :string(255)
#  description  :text(65535)
#  cooking_time :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :cooking_time, presence: true
end
