require 'rails_helper'

RSpec.describe "Users", type: :request do
    # subject {FactoryBot.build(:name)}
    #     context "GET index" do
    #         it "returns a successful response" do
    #             get :index
    #             expect(response).to be_successful
    #             expect(response.status).to eq(200)
    #         end
            
    #         it "assigns @users" do
    #             get :index
    #             expect(assigns(:users)).to eq(User.all)
    #         end

    #         it "renders the index template" do
    #             get :index
    #             expect(response).to render_template("index")
    #         end
    #     end 

    #     context "GET new" do  
    #         it "returns a successful response" do
    #             get :new
    #             expect(response).to be_successful
    #             expect(response.status).to eq(200)
    #         end

    #         it "assigns @user" do
    #             get :new
    #             expect(assigns(:user)).to be_a_new(User)
    #         end

    #         it "renders the new template" do
    #             get :new
    #             expect(response).to render_template("new")
    #             expect(response.body).to eq ""
    #         end
    #     end 

    #     context 'GET show' do
    #         it 'should show the theatre with its details' do
    #             user1 = FactoryBot.create(:user)
    #             get :show, params: { id: user1.id }
    #             expect(response).to render_template :show  
    #         end
    #     end
end