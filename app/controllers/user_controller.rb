class UserController < ApplicationController

    get '/users' do
        User.all.to_json(:include => [:recipes])
      end
      
     
      get '/chefs/:id' do
        User.find(params['id']).to_json(:include => {:recipes => {:include => :recipe_ingredients}} )
      end

end