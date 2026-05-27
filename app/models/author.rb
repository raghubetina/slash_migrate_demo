# == Schema Information
#
# Table name: authors
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE), not null
#  age        :integer
#  bio        :text
#  born_on    :date
#  email      :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_authors_on_email  (email) UNIQUE
#
class Author < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, foreign_key: :commenter_id, inverse_of: :commenter, dependent: :destroy
end
