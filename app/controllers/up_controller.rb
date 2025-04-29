class UpController < ApplicationController
  allow_unauthenticated_access only: :index
  allow_unauthenticated_access only: :databases
  def index
    head :ok
  end

  def databases
    RedisConn.current.ping
    ActiveRecord::Base.connection.execute("SELECT 1")
    head :ok
  end
end
