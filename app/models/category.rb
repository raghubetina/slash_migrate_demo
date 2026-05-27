# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  featured   :boolean          default(FALSE), not null
#  name       :string           not null
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_slug  (slug) UNIQUE
#
class Category < ApplicationRecord
  has_many :posts, dependent: :nullify
end
