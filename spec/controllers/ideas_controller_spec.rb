require 'rails_helper'

RSpec.describe IdeasController, type: :controller do

    describe "#new" do
        it "renders a new template" do
            get(:new)
            expect(response).to render_template(:new)
        end

        it "sets an instance variable with a new idea" do
            get(:new)
            expect(assigns(:idea)).to(be_a_new(Idea))
        end
    end
end
