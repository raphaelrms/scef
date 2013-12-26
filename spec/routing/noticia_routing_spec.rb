require "spec_helper"

describe NoticiaController do
  describe "routing" do

    it "routes to #index" do
      get("/noticia").should route_to("noticia#index")
    end

    it "routes to #new" do
      get("/noticia/new").should route_to("noticia#new")
    end

    it "routes to #show" do
      get("/noticia/1").should route_to("noticia#show", :id => "1")
    end

    it "routes to #edit" do
      get("/noticia/1/edit").should route_to("noticia#edit", :id => "1")
    end

    it "routes to #create" do
      post("/noticia").should route_to("noticia#create")
    end

    it "routes to #update" do
      put("/noticia/1").should route_to("noticia#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/noticia/1").should route_to("noticia#destroy", :id => "1")
    end

  end
end
