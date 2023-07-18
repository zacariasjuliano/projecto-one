class ContactosController < ApplicationController

    def index
        @lista = Contacto.all
        return render "index"
    end

    def store
        nome = params["nome"]
        email = params["email"]
        observacao = params["observacao"]

        if nome.blank?
            flash["error"] = "Por favor informe o nome."
            return render "index"
        end

        if email.blank?
            flash["error"] = "Por favor informe o nome."
            return render "index"
        end

        Contacto.create!(nome: nome, email: email, observacao:observacao)

        flash["success"] = "O contato foi cadastrado com sucesso."
        redirect_to "/contactos"
    end

    def edit
        @contacto = Contacto.find(params["id"])
        return render "edit"
    end

    def update
        @contacto = Contacto.find(params["id"])
        @contacto.nome = params["nome"]
        @contacto.email = params["email"]
        @contacto.observacao = params["observacao"]

        @contacto.save

        flash["success"] = "O contato foi editado com sucesso."
        render json: @contato.to_json, status: 200

    end

    def delete
        contacto = Contacto.find(params["id"])
        contacto.destroy

        flash["success"] = "O contato foi excluido com sucesso."
        render json: {}, status: 204 
    end

    def show
        @contacto = Contacto.find(params["id"])
        return render "show"
    end

end
