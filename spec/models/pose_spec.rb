require 'rails_helper'

RSpec.describe Pose, type: :model do
  describe 'poseの新規投稿' do
    before do
      @pose = FactoryBot.build(:pose)
    end

    it '全項目が入力されていれば投稿できる' do
      expect(@pose).to be_valid
    end
  
    it 'Pose Nameが空では投稿できない' do
      @pose.title = nil
      @pose.valid?
      expect(@pose.errors.full_messages).to include("Title can't be blank")
    end

    it 'Effectが空では投稿できない' do
      @pose.effect_id = 1
      @pose.valid?
      expect(@pose.errors.full_messages).to include("Effect must be other than 1")
    end

    it 'Required Timeが空では投稿できない' do
      @pose.minute = nil
      @pose.valid?
      expect(@pose.errors.full_messages).to include("Minute can't be blank")
    end

    it 'Required Timeが全角数字では登録できない' do
      @pose.minute = '１５'
      @pose.valid?
      expect(@pose.errors.full_messages).to include("Minute is not a number")
    end

    it 'Required Timeが半角英字では登録できない' do
      @pose.minute = 'one'
      @pose.valid?
      expect(@pose.errors.full_messages).to include("Minute is not a number")
    end

    it 'Required Timeが半角英数字では登録できない' do
      @pose.minute = '1min'
      @pose.valid?
      expect(@pose.errors.full_messages).to include("Minute is not a number")
    end

    it 'Intensityが空では投稿できない' do
      @pose.intensity_id = 1
      @pose.valid?
      expect(@pose.errors.full_messages).to include("Intensity must be other than 1")
    end

    it 'Pose Imageが空では投稿できない' do
      @pose.image = nil
      @pose.valid?
      expect(@pose.errors.full_messages).to include("Image can't be blank")
    end

    it 'userが紐付いていないと投稿できない' do
      @pose.user = nil
      @pose.valid?
      expect(@pose.errors.full_messages).to include('User must exist')
    end

  end
end
