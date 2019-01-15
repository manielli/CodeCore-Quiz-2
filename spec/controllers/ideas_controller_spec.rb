require 'rails_helper'

RSpec.describe IdeasController, type: :controller do

    def current_user
        @current_user ||= FactoryBot.create(:user)
    end

    describe "#new" do
        context "without signed in user" do
            it "redirects the user to new session" do
                get(:new)
                expect(response).to redirect_to(new_session_path)
            end

            it "sets a danger flash message" do
                get(:new)
                expect(flash[:danger]).to be
            end
        end

        context "when signed in user" do
            before do 
                session[:user_id] = current_user.id
            end
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

    describe "#create" do
        def valid_request
            post(:create, params: { idea: FactoryBot.attributes_for(:idea) } )
        end

        context "with valid paramters" do
            it "creates a new idea" do
                count_before = Idea.count
                valid_request
                count_after = Idea.count
            end

            it "redirects to the show page of that idea" do
                valid_request
                idea = Idea.last
                expect(response).to(redirect_to(idea_url(idea.id)))
            end
        end

        context "without valid parameters" do
            def invalid_request
                post(:create, params: { idea: FactoryBot.attributes_for(:idea, title: nil)} )
            end

            it "doesn't create a post" do
                count_before = Idea.count
                invalid_request
                count_after = Idea.count
                expect(count_after).to(eq(count_before))
            end

            it "still does render the new template although paramters are invalid" do
                invalid_request
                expect(response).to render_template(:new)
            end

            it "assigns an invalid idea post as an instance variable" do
                invalid_request
                expect(assigns(:idea)).to(be_a(Idea))
                expect(assigns(:idea).valid?).to(be(false))
            end
        end
    end
end
