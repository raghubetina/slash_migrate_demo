# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  approved     :boolean          default(FALSE), not null
#  body         :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  commenter_id :bigint           not null
#  post_id      :bigint           not null
#
# Indexes
#
#  index_comments_on_commenter_id  (commenter_id)
#  index_comments_on_post_id       (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (commenter_id => authors.id)
#  fk_rails_...  (post_id => posts.id)
#
class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :commenter, class_name: "Author"
end
