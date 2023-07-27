module Bancos
    module Busca
        extend ActiveSupport::Concern

        included do 
            scope :by_nome, ->(nome) { where("lower(nome) like ?", "%#{nome.downcase}%") if nome.present?}
            scope :by_sigla, ->(sigla) { where("lower(sigla) like ?", "%#{sigla.downcase}%") if sigla.present?}
            scope :by_email, ->(email) { where("lower(email) like ?", "%#{email.downcase}%") if email.present?}
            scope :by_ni, ->(ni) { where("lower(ni) like ?", "%#{ni.downcase}%") if ni.present?}
            scope :by_capital, ->(capital) { where("capital::text like ?", "%#{capital.to_s}%") if capital.present?}
            scope :by_pais, ->(pais) { where("lower(pais) like ?", "%#{pais.downcase}%") if pais.present?}
        end

    end
end