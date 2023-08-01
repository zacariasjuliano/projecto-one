class GithubController < ApplicationController

    require 'httparty'
    require 'json'

    def index
        
        @my_repo = GithubServiceAPI.pesquisa_users_repositorios(params)

        return render "index"
    end

    

end
