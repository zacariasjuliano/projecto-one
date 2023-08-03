class BancoServiceQuery
    def self.busca_por_parametro(params = {})
        bancos = Banco.all
        bancos = bancos.by_nome(params[:nome]) if params[:nome].present?
        bancos = bancos.by_sigla(params[:sigla]) if params[:sigla].present?
        bancos = bancos.by_email(params[:email]) if params[:email].present?
        bancos = bancos.by_ni(params[:ni]) if params[:ni].present?
        bancos = bancos.by_capital(params[:capital]) if params[:capital].present?
        bancos = bancos.by_pais(params[:pais]) if params[:pais].present?
        
        bancos = bancos.where("capital >= ?", params[:capital_ini]) if params[:capital_ini].present?
        bancos = bancos.where("capital <= ?", params[:capital_fim]) if params[:capital_fim].present?
        
        bancos = bancos.where("created_at >= ?", params[:data_ini]) if params[:data_ini].present?
        bancos = bancos.where("created_at <= ?", params[:data_fim]) if params[:data_fim].present?

        if params[:ids].present?

            array_ids = params[:ids].split(",").map{|s| s.to_i}.find_all{|n| n > 0} rescue []

            bancos = bancos.where(id: array_ids)

        end

        bancos
    end
end