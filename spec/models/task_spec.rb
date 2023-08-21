require "rails_helper"

RSpec.describe Task, type: :model do
  describe "instance methods" do
    describe "#laundry?" do
      it "returns true if the task title is laundry" do
        task = Task.new({
          title: "laundry",
          description: "blah"
        })
        task.save
        # can also just do task.create -> .new + .save

        expect(task.laundry?).to be true
      end

      it "returns false when neither the description nor title contain laundry" do
        task = Task.create!(
          title: "hello how are you",
          description: "doing well"
        )

        expect(task.laundry?).to be false
      end

      it "returns true when the title contains laundry" do
        task = Task.create!(
          title: "hello i am laundry",
          description: "doing well"
        )

        # expect(task.laundry?).to include("laundry")
        expect(task.laundry?).to be true
      end

      it "is case insensitive when checking if the title contains laundry" do
        task1 = Task.create!(
          title: "LAunDry",
          description: "doing well"
        )

        task2 = Task.create!(
          title: "hello i am laundry",
          description: "doing well"
        )

        expect(task1.laundry?).to be true
        expect(task2.laundry?).to be true
      end

      it "returns true when the description contains the word laundry" do
        task1 = Task.create!(
          title: "i dont want the word here",
          description: "laundry"
        )

        expect(task1.laundry?).to be true
      end

      it "is case insensitive with laundry in the description" do
        task1 = Task.create!(
          title: "LAunDry",
          description: "LaunDry"
        )

        expect(task1.laundry?).to be true
      end
    end
  end
end