class Article < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true, length: { minimum: 10 }
    validates :body, presence: true

    has_one_attached :avatar
    has_rich_text :body

    has_and_belongs_to_many :categories

    belongs_to :user

    has_many :comments, dependent: :destroy

    private

    def self.add_categories(article, ids)
        # ids.each do |i|
            # c = Category.find(i)
            # article.categories << c
        # end
        # El codigo anterior se puede refactorizar de la siguiente manera
        ids.each { |i| article.categories << Category.find(i) }
    end

    def self.update_categories(article, ids)
        article.categories.delete_all if article.categories.present?
        # La linea anterior es la misma que la siguiente
        # article.categories.delete_all unLess article.categories.empty?
        ids.each { |i| article.categories << Category.find(i) }
    end
end
