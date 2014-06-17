require 'spec_helper'

describe MoviesController do
  context "GET index" do
   it "lists all movies" do
     get :index
     expect(response).to render_template("index")
   end
  end
  context "GET show" do
   let(:movie){FactoryGirl.create(:movie,:name => 'Movie1')}
   it "shows all movies" do
     get :show,{:id  => movie.id}
     expect(response).to render_template("show")
   end

  end

  context "GET new" do
    it "display a new form for creating an actor"
  end
  
  context "POST create" do
  let(:new_movie){FactoryGirl.attributes_for(:movie)}
    context "no error" do
      it "creates movie" do
#        post :create,{FactoryGirl.attributes(:actor)}
         post :create,{movie: new_movie} 
#        expect(response.status).to eq(302)
        expect(response).to redirect_to(movies_path)
      end
    end
    context "error" do
    let(:new_movie1){FactoryGirl.attributes_for(:movie, :name => "")}
      it "no movie created" do
        post :create,{movie: new_movie1}
        expect(response).to render_template("new") # give string in render template not path
      end
    end
  end

 context "PUT update" do
    let(:update_movie){FactoryGirl.create(:movie, :name => "Giona")}
    
    it "updates details of a specified actor" do
      update_movie.name='Fiona'
      put :update,{name: update_movie.name,id: update_movie.id}
      expect(response).to redirect_to(movies_path)
    end
  end

  context "GET edit" do
 let(:edit_movie){FactoryGirl.create(:movie)}
     it "fetches a movie in an editable form" do
       get :edit,{id: edit_movie.id}
       expect(response).to render_template("edit")
     end
  end

  context "GET NEW" do
     it "lets user enter movie in an NEW form" do
       get :new
       expect(response).to render_template("new")
     end
  end

  context "DELETE delete" do
   let(:movie){FactoryGirl.create(:movie,:name => 'Fiona')}
     it "delete a movie " do
       delete :destroy,{id: movie.id}
       expect(response).to redirect_to(movies_path)
     end
  end

  
  
end
