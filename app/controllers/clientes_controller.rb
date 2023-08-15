class ClientesController < ApplicationController
  before_action :set_cliente, only: %i[ show edit update destroy ]

  # GET /clientes or /clientes.json
  def index
    @clientes = Cliente.all
    

    # #==== Union forma 1 =====
    # @union = ActiveRecord::Base.connection.execute("
    #   select id, nome, email as contato, created_at , updated_at, 'aluno' as tipo from alunos
    #   union
    #   select id, nome, telefone as contato, created_at , updated_at, 'cliente' as tipo  from clientes
    #   order by id
    # ")

 

    # #==== Union forma 2 =====
    # alunos_tabela = Aluno.arel_table
    # clientes_tabela = Cliente.arel_table

    # clientes_alunos_tabela = alunos_tabela.project(alunos_tabela[:id], alunos_tabela[:nome])
    # alunos_clientes_tabela = clientes_tabela.project(clientes_tabela[:id], clientes_tabela[:nome])

    # union = clientes_alunos_tabela.union(alunos_clientes_tabela)
    # results = ActiveRecord::Base.connection.exec_query(union.to_sql)

 

    # #==== Union forma 3 =====
    clientes_tabela_sql = Cliente.select(:id, :nome).to_sql
    contactos_tabela_sql = Contacto.select(:id, :nome).to_sql

    results = ActiveRecord::Base.connection.exec_query("#{clientes_tabela_sql} UNION #{contactos_tabela_sql}")

    debugger

    x = ""

  end

  # GET /clientes/1 or /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes or /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to cliente_url(@cliente), notice: "Cliente was successfully created." }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1 or /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to cliente_url(@cliente), notice: "Cliente was successfully updated." }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1 or /clientes/1.json
  def destroy
    @cliente.destroy

    respond_to do |format|
      format.html { redirect_to clientes_url, notice: "Cliente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cliente_params
      params.require(:cliente).permit(:nome, :telefone)
    end
end
