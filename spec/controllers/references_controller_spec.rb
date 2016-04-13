require 'rails_helper'

RSpec.describe ReferencesController, type: :controller do
	describe "DELETE #destroy" do
    	it "destroys the requested reference" do
      		reference = Reference.create! year:1990, author:"Teppo", title:"Matti", publisher:"Suomiboyz"
      		expect {
        		delete :destroy, {:id => reference.to_param}
      		}.to change(Reference, :count).by(-1)
    	end
    	it "redirects to the references list" do
      		reference = Reference.create! year:1990, author:"Teppo", title:"Matti", publisher:"Suomiboyz"
      		delete :destroy, {:id => reference.to_param}
     		expect(response).to redirect_to(references_url)
    	end
	end
	describe "GET #index" do
    	it "Reference.all gets all references" do
      		reference1 = Reference.create! year:1990, author:"Teppo", title:"Matti", publisher:"Suomiboyz"
    		reference2 = Reference.create! year:1990, author:"Barack Öbämå", title:"USA", publisher:"asd"
      		get :index
      		expect(assigns(:references)).to eq(Reference.all)
    	end
  	end
  	describe "GET #new" do
    	it "getting new" do
      		get :new
      		expect(response.status).to eq(200)
    	end
  	end
  	describe "POST #create" do
    	it "creating reference with parameters" do
    		referencelist1 = Referencelist.create! name:"lista"
      		expect{
        	post :create, {:reference => {:referencelist_id => referencelist1.id,:year => 1990, :author => "Teppo", :title => "Matti", :publisher => "Suomiboyz"}}
      		}.to change(Reference, :count).by(1)
    	end
    	it "invalid referencelist creation not possible" do
      		expect{
        	post :create, {:reference => {:year => "epävuosi"}}
      		}.to change(Reference, :count).by(0)
    	end
  	end
  	describe "PUT #update" do
    	it "update success" do
      		reference1 = Reference.create! year:1990, author:"Teppo", title:"Matti", publisher:"Suomiboyz"
      		put :update, {:id => reference1.to_param, :reference => {:author => "Jorma"} }
      		reference1.reload
      		expect(reference1.author).to eq("Jorma")
    	end
    	it "update fails" do
      		reference1 = Reference.create! year:1990, author:"Teppo", title:"Matti", publisher:"Suomiboyz"
      		put :update, {:id => reference1.to_param, :reference => {:year => "miljoona"} }
      		reference1.reload
      		expect(reference1.year).to eq(1990)
    	end
  	end
end
