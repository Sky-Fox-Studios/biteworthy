class UsersRole < ApplicationRecord

  enum role_types: [:owner, :dam, :employee]

end
