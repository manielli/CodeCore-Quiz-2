require 'rails_helper'

RSpec.describe Idea, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "validation" do
    it "requires title to be present" do
      idea = Idea.new
      idea.valid?
      expect(idea.errors.messages).to(have_key(:title))
    end

    it "requires title to be unique" do
      idea = Idea.new
      idea.title = "something"
      idea.description = "some sort of description"
      idea.save

      idea_2 = Idea.new
      idea.title = "something"
      idea_2.valid?

      expect(idea_2.errors.messages).to(have_key(:title))
    end

    it "requires desciption to be present" do
      idea = Idea.new
      idea.valid?
      expect(idea.errors.message).to(have_key(:description))
    end
  end
end
