class MonstersController < ApplicationController
  def index
    @monsters = Monster.all.order(name: :desc)
  end

  def show
    @monster = Monster.find(params[:id])

    if @monster.tweets.empty?
      # Si el monstruo no tiene tweets, redirige a la vista de creación de tweets
      redirect_to tweets_new_path(monster_id: @monster.id)
    end
  end

  def destroy
    @monster = Monster.find(params[:id])
    @monster.destroy
    redirect_to monsters_path, notice: "Monstruo eliminado exitosamente"
  end

end
