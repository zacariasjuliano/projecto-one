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

    def delete
    end
end
