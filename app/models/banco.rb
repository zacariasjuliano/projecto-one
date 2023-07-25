class Banco < ApplicationRecord

    scope :by_nome, ->(nome) { where("lower(nome) like ?", "%#{nome.downcase}%") if nome.present?}
    scope :by_sigla, ->(sigla) { where("lower(sigla) like ?", "%#{sigla.downcase}%") if sigla.present?}
    scope :by_email, ->(email) { where("lower(email) like ?", "%#{email.downcase}%") if email.present?}
    scope :by_ni, ->(ni) { where("lower(ni) like ?", "%#{ni.downcase}%") if ni.present?}
    scope :by_capital, ->(capital) { where("lower(capital) like ?", "%#{capital.downcase}%") if capital.present?}
    scope :by_pais, ->(pais) { where("lower(pais) like ?", "%#{pais.downcase}%") if pais.present?}


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
