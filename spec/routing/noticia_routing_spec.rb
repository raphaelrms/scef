require "spec_helper"

describe NoticiaController do
  describe "routing" do

    it "routes to #index" do
      get("/noticias").should route_to("noticias#index")
    end

    it "routes to #new" do
      get("/noticias/new").should route_to("noticias#new")
    end

    it "routes to #show" do
      get("/noticias/1").should route_to("noticias#show", :id => "1")
    end

    it "routes to #edit" do
      get("/noticias/1/edit").should route_to("noticias#edit", :id => "1")
    end

    it "routes to #create" do
      post("/noticias").should route_to("noticias#create")
    end

    it "routes to #update" do
      put("/noticias/1").should route_to("noticias#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/noticias/1").should route_to("noticias#destroy", :id => "1")
    end

  end
end
