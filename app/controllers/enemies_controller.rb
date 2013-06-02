class EnemiesController < ApplicationController
  def create
    @enemy = Enemy.create!(params[:enemy].merge({
                                                    :name => (params[:enemy][:health].to_i > 8 ? 'REALLY BAD GUY' : 'bad guy'),
                                                    :sector => Sector.find(params[:enemy][:sector_id]),
                                                    :enemy_actions => [
                                                        EnemyAction.new(
                                                            :distance => 10,
                                                            :damage => 1
                                                        ),
                                                        EnemyAction.new(
                                                            :distance => 5,
                                                            :damage => 2
                                                        ),
                                                        EnemyAction.new(
                                                            :distance => 1,
                                                            :damage => 3
                                                        )
                                                    ]

                                                }))

    redirect_to :action => :show, :controller => :ships, :id => @enemy.sector.ship.id
  end
end
