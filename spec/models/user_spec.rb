require 'rails_helper'

describe User do
  describe '#create' do

    it "is valid with a nickname, email, password, password_confirmation, birthday, family_name, first_name, family_name_pseudonym, first_name_pseudonym" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("can't be blank")
    end

    it "is invalid without a birthday" do
        user = build(:user, birthday: "")
        user.valid?
        expect(user.errors[:birthday]).to include("can't be blank")
    end

    it "is invalid without a family_name" do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    it "is invalid without a first_name" do
        user = build(:user, first_name: "")
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank")
    end
    
    it "is invalid without a family_name_pseudonym" do
      user = build(:user, family_name_pseudonym: "")
      user.valid?
      expect(user.errors[:family_name_pseudonym]).to include("can't be blank")
    end

    it "is invalid without a first_name_pseudonym" do
      user = build(:user, first_name_pseudonym: "")
      user.valid?
      expect(user.errors[:first_name_pseudonym]).to include("can't be blank")
    end
    
    it "is invalid without a password_confirmation although with a password" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is valid with a nickname that has less than 6 characters " do
        user = build(:user, nickname: "aaaaaa")
        expect(user).to be_valid
    end

    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end
    
    it "is valid without provider and uid" do
      user = build(:user, provider: "", uid: "")
      expect(user).to be_valid
    end

    it "is valid omniauth" do
      user = build(:user)
      user[:provider] = facebook_mock['provider']
      user[:uid] = facebook_mock['uid']
      expect(user).to be_valid
    end

  end

end

