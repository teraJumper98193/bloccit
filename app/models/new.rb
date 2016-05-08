class New < ActiveRecord::Base

  before_save { self.email = email.downcase if email.present? }


  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :name, capitalization: {"name".capitalize}, presence: true
  validates :name, spacing: {"name".split}, presence: true


  validates :password, presence: true, length: { minimum: 6 }, unless: :password_digest
  validates :password, length: { minimum: 6 }, allow_blank: true

  has_secure_password
end
