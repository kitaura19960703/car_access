class Car < ApplicationRecord
    def self.search(keyword)
        where(["maker like? OR body_type like?", "%#{keyword}%", "%#{keyword}%"])
    end
    enum maker: { TOYOTA: 0, HONDA: 1, NISSAN: 2, MAZDA: 3, Oher: 5 }
    enum body_type: { コンパクト: 0, ミニバン: 1, セダン: 2, スポーツ: 3, 軽自動車: 4, その他: 5 }
    belongs_to :user
end
