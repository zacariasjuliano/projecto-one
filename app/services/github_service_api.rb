class GithubServiceAPI
    def self.pesquisa_users_repositorios(params = {})

        @my_repo = []
        
        if params[:nome].present?

            headers = {
                "Authorization" => "token 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" 
            }
            
            #Pesquisa pelo Repositório
            url = "https://api.github.com/users/"+params[:nome]+"/repos"
            response = HTTParty.get(url, headers: headers)

            if response.code == 200
                repositories = JSON.parse(response.body) 
    
                repositories.each do |repo|                    
                
                    @project = []  
                    @project_language = []  
                    
                    #Pesquisa pelas linguagens usadas no projecto
                    response_language = HTTParty.get(repo["languages_url"], headers: headers)
                    
                    @project.push(repo["name"])
    
                    if response_language.code == 200
                        repositories_language = JSON.parse(response_language.body)
    
                        repositories_language.each do |language|
                            @project_language.push(language[0])
                        end
    
                    end

                    @project.push(@project_language)
                    #@project.push(repo["avatar_url"])
                    #@project.push(repo["name"])
                    @project.push(repo["description"])
                    #description
                    #"collaborators_url"=>"https://api.github.com/repos/MarcioSantos64/MarcioSantos64/collaborators{/collaborator}", 

                    @my_repo.push(@project)
                    
                end
            end
        end

        @my_repo

    end
end