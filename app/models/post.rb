# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  body         :text
#  published    :boolean          default(FALSE), not null
#  published_at :datetime
#  rating       :decimal(3, 2)
#  reading_time :float
#  title        :string           not null
#  view_count   :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  author_id    :bigint           not null
#  category_id  :bigint
#  legacy_id    :bigint
#
# Indexes
#
#  index_posts_on_author_id    (author_id)
#  index_posts_on_category_id  (category_id)
#  index_posts_on_title        (title)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => authors.id)
#  fk_rails_...  (category_id => categories.id)
#
class Post < ApplicationRecord
  belongs_to :author
  belongs_to :category, optional: true
  has_many :comments, dependent: :destroy
end
