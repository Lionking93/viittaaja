require 'rails_helper'

RSpec.describe ReferencelistsController, type: :controller do
	describe "DELETE #destroy" do
    	it "destroys the requested referencelist" do
      		referencelist = Referencelist.create! name:"Ismon lista"
      		expect {
        		delete :destroy, {:id => referencelist.to_param}
      		}.to change(Referencelist, :count).by(-1)
    	end
    	it "redirects to the referncelists list" do
      		referencelist = Referencelist.create! name:"Ismon lista"
      		delete :destroy, {:id => referencelist.to_param}
     		expect(response).to redirect_to(referencelists_url)
    	end
	end
	describe "GET #index" do
    	it "Referencelist.all gets all referencelists" do
      		referencelist1 = Referencelist.create! name:"Lista1"
      		referencelist2 = Referencelist.create! name:"Lista2"
      		referencelist3 = Referencelist.create! name:"Lista3"
      		get :index
      		expect(assigns(:referencelists)).to eq(Referencelist.all)
    	end
  	end
  	describe "GET #new" do
    	it "getting new" do
      		get :new
      		expect(response.status).to eq(200)
    	end
  	end
  	describe "POST #create" do
    	it "creating referencelist with parameters" do
      		expect{
        	post :create, {:referencelist => {:name => "lista"}}
      		}.to change(Referencelist, :count).by(1)
    	end
    	it "invalid referencelist creation not possible" do
      		expect{
        	post :create, {:referencelist => {:name => ""}}
      		}.to change(Referencelist, :count).by(0)
    	end
  	end
  	describe "PUT #update" do
    	it "update success" do
      		list1 = Referencelist.create! name:"Lista1"
      		put :update, {:id => list1.to_param, :referencelist => {:name => "uusilista"} }
      		list1.reload
      		expect(list1.name).to eq("uusilista")
    	end
    	it "update fails" do
      		list1 = Referencelist.create! name:"Lista1"
      		put :update, {:id => list1.to_param, :referencelist => {:name => ""} }
      		list1.reload
      		expect(list1.name).to eq("Lista1")
    	end
  	end
end
