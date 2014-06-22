class Post < ActiveRecord::Base
    validates :user_id, presence: true
    validates :video_id, presence: true
    validates :caption, length: { maximum: 50 }

    belongs_to :user

    default_scope -> { order('created_at DESC') }



end
