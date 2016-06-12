class Company < ActiveRecord::Base
    validates_uniqueness_of :access_token
end
