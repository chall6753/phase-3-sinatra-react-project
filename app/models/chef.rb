class Chef <ActiveRecord::Base
    has_many :recipes
    belongs_to :username
end