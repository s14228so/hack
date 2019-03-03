
require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "validation" do
    before :each do
      @student = create(:student)
    end
    context "emailがある場合" do
      it "is valid" do
        expect(@student).to be_valid
      end
    end
    context "emailがない場合" do
      it "is invalid" do
        @student.valid?
        expect(@student.errors[:email].size).to eq(0)
      end
    end
    context "emailの値が不正な場合" do
      before :each do
        @student.email = "aaabbb"
      end
      it "is that Email is not an email" do
        @student.valid?
        expect(@student.errors[:email]).to eq(["is invalid", "is not an email"])
      end
    end
    context "emailが空の時" do
      before :each do
        @student.email = nil
      end
      it "is invalid" do
        @student.valid?
        expect(@student.errors[:email]).to eq(["can't be blank", "is not an email"])
      end
    end
    context "passwordが6文字以上の場合" do
      it  "is that password is more than 6 charactors" do
        @student.valid?
        expect(@student.errors[:password].size).to eq(0)
      end

    end
    context "passwordが6文字未満の場合" do
      before :each do
        @student.password = "test"
      end
      it "is that password is must be more than 6 charactors" do
        @student.valid?
        expect(@student.errors[:password]).to eq(["is too short (minimum is 6 characters)"])
      end
    end
    context "grade(学年)が4以下である場合" do
      it "is that student`s grade is valid" do
        @student.valid?
        expect(@student.errors[:grade].size).to eq(0)
      end
    end
    context "grade(学年)が5を超える場合" do
      before :each do
        @student.grade = 5
      end
      it "is that student`s grade is invalid" do
        @student.valid?
        expect(@student.errors[:grade].size).to eq(1)
      end
    end
  end
end

