class PedidosController < ApplicationController
  before_action :set_pedido, only: %i[ show edit update destroy ]

  # GET /pedidos or /pedidos.json
  def index   
    
    @pedidos = Pedido.all

    # Pesquisa com a Model
    @pedidos = Pedido.joins("inner join clientes on clientes.id = pedidos.cliente_id")
    .joins("left join pedidos_produtos on pedidos_produtos.pedido_id = pedidos.id")
    .joins("left join produtos on produtos.id = pedidos_produtos.produto_id")
    .select("pedidos.id as pedido_id, pedidos.valor_total as valor_total, clientes.nome as nome, clientes.telefone as telefone, produtos.nome as produto_nome, produtos.valor as produto_valor")
    .order(id: :asc)
    .paginate(page: params[:page], per_page: 4)
    
    
    # Pesquisa com Query Bruta    
    # sql = "
    #   select
    #     clientes.nome, clientes.telefone, pedidos.id as pedido_id, pedidos.valor_total,
    #     produtos.nome as produto_nome, produtos.valor as produto_valor
    #   from pedidos
    #   inner join clientes on clientes.id = pedidos.cliente_id
    #   left join pedidos_produtos on pedidos_produtos.pedido_id = pedidos.id
    #   left join produtos on produtos.id = pedidos_produtos.produto_id
    # "

    #@pedidos = ActiveRecord::Base.connection.execute(sql) 

    # @pedidos = Pedido.joins("inner join clientes on clientes.id = pedidos.cliente_id")
    # @pedidos = @pedidos.joins("left join pedidos_produtos on pedidos_produtos.pedido_id = pedidos.id")
    # @pedidos = @pedidos.joins("left join produtos on produtos.id = pedidos_produtos.produto_id")
    # @pedidos = @pedidos.where("pedidos.nome ilike ?", "'%#{params[:nome]}%')
  
  end

  # GET /pedidos/1 or /pedidos/1.json
  def show
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos or /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to pedido_url(@pedido), notice: "Pedido was successfully created." }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1 or /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to pedido_url(@pedido), notice: "Pedido was successfully updated." }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1 or /pedidos/1.json
  def destroy
    @pedido.destroy

    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: "Pedido was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pedido_params
      params.require(:pedido).permit(:cliente_id, :valor_total)
    end
end
