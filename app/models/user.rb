class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  enum level: {nom: 11,
    grower:    7,
    maker:     6,
    editor:    5,
    nommer:    4,
    gobbler:   3,
    eater:     2,
    taster:    1,
    nibbler:   0,
    crust:    -1,
    stale:    -2,
    leftover: -3,
    slop:     -4,
    trash:    -5
    }


  has_and_belongs_to_many :restaurant_users
  has_many :photos, :as => :photo

  has_many :reviews
  has_many :review_food_items, :through =>  :reviews, :source => :favoritable , :source_type => "FoodItem"
  has_many :review_restaurants, :through =>  :reviews, :source => :favoritable , :source_type => "Restaurant"
   def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super # Use whatever other message
    end
  end

   def can_edit?
      return self.is_manager || self.is_admin
   end

  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end

end
