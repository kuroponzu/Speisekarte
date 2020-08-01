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
require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
