class Topic < ActiveRecord::Base
  belongs_to :SponsoredPost
  has_many :comments, dependent: :destroy
end
