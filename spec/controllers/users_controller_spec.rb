require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = User.create! username:"IsmoLaitela"
      expect {
        delete :destroy, {:id => user.to_param}
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = User.create! username:"IsmoLaitela"
      delete :destroy, {:id => user.to_param}
      expect(response).to redirect_to(users_url)
    end
  end
  describe "GET #index" do
    it "User.all gets all users" do
      user1 = User.create! username:"IsmoLaitela1"
      user2 = User.create! username:"IsmoLaitela2"
      user3 = User.create! username:"IsmoLaitela3"
      get :index
      expect(assigns(:users)).to eq(User.all)
    end
  end
  describe "GET #new" do
    it "getting new" do
      get :new
      expect(response.status).to eq(200)
    end
  end
  describe "POST #create" do
    it "creating user with parameters" do
      expect{
        post :create, {:user => {:username => "ismolaitela"}}
      }.to change(User, :count).by(1)
    end
    it "invalid user creation not possible" do
      expect{
        post :create, {:user => {:name => ""}}
      }.to change(User, :count).by(0)
    end
  end
  describe "PUT #update" do
    it "update success" do
      user1 = User.create! username:"IsmoLaitela1"
      put :update, {:id => user1.to_param, :user => {:username => "uusiismo"} }
      user1.reload
      expect(user1.username).to eq("uusiismo")
    end
    it "update fails" do
      user1 = User.create! username:"IsmoLaitela1"
      put :update, {:id => user1.to_param, :user => {:username => "uu"} }
      user1.reload
      expect(user1.username).to eq("IsmoLaitela1")
    end
  end
end
