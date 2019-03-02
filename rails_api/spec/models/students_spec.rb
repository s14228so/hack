
require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "validation" do
    before :each do
      @student = Student.new(
        first_name: "Satoshi",
        last_name: "Ono",
        email: "saongtx7@gmail.com",
        password: "onoono"
      )
    end
    context "名前、苗字、emailがある場合" do
      it "is valid" do
        expect(@student).to be_valid
      end
    end
    context "名前がない場合" do
      before :each do
        @student.first_name = nil
      end
      it "is invalid" do
        @student.valid?
        expect(@student.errors[:first_name].size).to eq(1)
      end
    end
    context "emailが空の時" do
      before :each do
        @student.email = nil
      end
      it "is invalid" do
        @student.valid?
        expect(@student.errors[:email].size).to eq(2)
      end
    end
    context "emailの型が正しくない場合" do
      before :each do
        @student.email = "kijduehfu"
      end
      it "is invalid" do
        @student.valid?
        expect(@student.errors[:email].size).to eq(1)
      end
    end
  end
end

