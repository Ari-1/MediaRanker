class User < ApplicationRecord
  has_many :votes

  validates :name, presence: true
  validates :votes, uniqueness: {scope: :work}

  def joined
    return self.created_at.strftime("%m-%d-%Y")
  end
end
