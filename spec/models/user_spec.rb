require 'rails_helper'

RSpec.describe User, type: :model do
  it{ is_expected.to have_db_column(:email).of_type(:string) }
  it{ is_expected.to have_db_column(:encrypted_password).of_type(:string) }

  it{ is_expected.to have_many(:tasks) }
end
