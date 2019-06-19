class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
        :confirmable, :lockable, :timeoutable,
        :omniauthable, omniauth_providers: [:facebook, :github, :google_oauth2]

  has_and_belongs_to_many :restaurant_users
  has_many :photos, as: :photo
  has_many :reviews

  scope :restaurant_reviews, -> { where(review_type: "Restaurant") }

  enum level: {nom: 11,
               grower:    7,
               maker:     6,
               editor:    5,
               nommer:    4,
               gobbler:   3,
               eater:     2,
               taster:    1,
               nibbler:   0,
               leftover: -1,
               crust:    -2,
               stale:    -3,
               slop:     -4,
               trash:    -5
  }

  def self.good_level_info
    [
      [0, "Nibbler", "We all start here"],
      [1, "Taster", "Moving up and becoming worthy"],
      [2, "Eater", "Beginning to contribute"],
      [3, "Gobbler", "Activily maintaining"],
      [4, "Nommer", "Top tier member"]
    ]
  end

  def self.bad_level_info
    [
      [-1, "Leftovers", "Neglect of responsibilities"],
      [-2, "Crust", "Choosing poorly"],
      [-3, "Stale", "Those actions lead downhill"],
      [-4, "Slop", "Creating abysmal content"],
      [-5, "Trash", "Without value"]
    ]
  end

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

  def self.create_from_facebook_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.user_name = provider_data.info.name
      if provider_data.info.name.include?(" ")
        user.first_name = provider_data.info.name.split(" ").first
        user.last_name  = provider_data.info.name.split(" ").last
      end
      user_basics(user, provider_data.provider)
      #TODO add photo from provider_data.info.image
    end
  end

  def self.create_from_github_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.user_name = provider_data.info.nickname
      if provider_data.info.name.include?(" ")
        user.first_name = provider_data.info.name.split(" ").first
        user.last_name  = provider_data.info.name.split(" ").last
      end
      user_basics(user, provider_data.provider)
      #TODO add photo from provider_data.info.image
    end
  end

  def self.create_from_google_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.user_name = provider_data.info.name
      user.first_name = provider_data.info.first_name
      user.last_name  = provider_data.info.last_name
      user_basics(user, provider_data.provider)
      #TODO add photo from provider_data.info.image
    end
  end

  def self.user_basics(user, provider)
    user.password = Devise.friendly_token[0, 20]
    user.approved = true
    user.level = :nibbler
    user.skip_confirmation!
  end

  # Devise settings
  def timeout_in
    if self.is_admin?
      2.weeks
    else
      3.days
    end
  end
end
