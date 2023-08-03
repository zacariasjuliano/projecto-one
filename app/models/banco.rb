class Banco < ApplicationRecord

    include Bancos::Busca

    has_many :deposito_bancos

    def self.busca_por_parametro(params = {})
        bancos = Banco.all
        bancos = bancos.by_nome(params[:nome]) if params[:nome].present?
        bancos = bancos.by_sigla(params[:sigla]) if params[:sigla].present?
        bancos = bancos.by_email(params[:email]) if params[:email].present?
        bancos = bancos.by_ni(params[:ni]) if params[:ni].present?
        bancos = bancos.by_capital(params[:capital]) if params[:capital].present?
        bancos = bancos.by_pais(params[:pais]) if params[:pais].present?
        bancos
    end

end
