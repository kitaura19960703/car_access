class Car < ApplicationRecord
    def self.search(keyword)
        where(["maker like? OR body_type like?", "%#{keyword}%", "%#{keyword}%"])
    end
    enum maker: { TOYOTA: 0, HONDA: 1, NISSAN: 2, MAZDA: 3, other: 5 }
    enum body_type: { コンパクト: 0, ミニバン: 1, セダン: 2, スポーツ: 3, 軽自動車: 4, その他: 5 }
    has_many :favorites, dependent: :destroy
    belongs_to :user
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
    validates :maker, presence: true
    validates :body_type, presence: true
    validates :car_name, presence: true
    validates :star, numericality: {
        less_than_or_equal_to: 5,
        greater_than_or_equal_to: 0
    }, presence: true
end
