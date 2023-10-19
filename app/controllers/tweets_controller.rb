class TweetsController < ApplicationController

  def index
    @tweets = Tweet.order(created_at: :desc)
  end

  def show
   @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    puts "+++++ dentro de la accion crear++++"
    # Crear un nuevo tweet con los parámetros del formulario
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      puts "+++++ si se puede crear tweet++++"
      # Si se guarda con éxito, redirigir a la página de detalle del tweet
      redirect_to @tweet
    else
      puts "+++++ no se puede crear tweet++++"
      # Si no se puede guardar, volver a mostrar el formulario con errores
      render 'new'
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:monster_id, :content)
  end

end
