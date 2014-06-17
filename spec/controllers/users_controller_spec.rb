require 'spec_helper'

describe UsersController do
  context "GET index" do
   it "lists all actors" do
     get :index
     expect(response).to render_template("index")
   end
  end
  context "GET show" do
   let(:actor){FactoryGirl.create(:actor,:name => 'actor1')}
   it "shows all actors" do
     get :show,{:id  => actor.id}
     expect(response).to render_template("show")
   end

  end

  context "GET new" do
    it "display a new form for creating an actor"
  end
  
  context "POST create" do
  let(:new_actor){FactoryGirl.attributes_for(:actor)}
    context "no error" do
      it "creates actor" do
#        post :create,{FactoryGirl.attributes(:actor)}
         post :create,{actor: new_actor} 
#        expect(response.status).to eq(302)
        expect(response).to redirect_to(actors_path)
      end
    end
    context "error" do
    let(:new_actor1){FactoryGirl.attributes_for(:actor, :name => "")}
      it "no actor created" do
        post :create,{actor: new_actor1}
        expect(response).to render_template("new") # give string in render template not path
      end
    end
  end

 context "PUT update" do
    let(:update_actor){FactoryGirl.create(:actor)}
    let(:update_actor1){FactoryGirl.create(:actor)}
    it "updates details of a specified actor" do
      update_actor.name='Fiona'
      put :update,{ac_name: update_actor.name,id: update_actor.id}
      expect(response).to redirect_to(actors_path)
    end
    it "does not update details" do
      update_actor.name=update_actor1.name
       put :update,{ac_name: update_actor.name,id: update_actor.id}
      expect(response).to render_template("edit")
    end 
  end

  context "GET edit" do
 let(:edit_actor){FactoryGirl.create(:actor)}
     it "fetches an actor in an editable form" do
       get :edit,{id: edit_actor.id}
       expect(response).to render_template("edit")
     end
  end

  context "GET NEW" do
     it "lets user enter actor in an NEW form" do
       get :new
       expect(response).to render_template("new")
     end
  end

  context "DELETE delete" do
   let(:actor){FactoryGirl.create(:actor,:name => 'fiona')}
     it "delete an actor " do
       delete :destroy,{id: actor.id}
       expect(response).to redirect_to(actors_path)
     end
  end

  
  
end
