require 'open-uri'
require 'json'
require 'http'
require 'faraday'

class GardensController < ApplicationController
  include HTTParty
  # Method privée
  before_action :set_garden, only: [:show, :edit, :update, :destroy, :gardener]

  def index
    @gardens = Garden.all
  end

  def show
    ### SUPER HERO API : KEY IN QUERY PARAM ###

    # url = "https://superheroapi.com/api/#{ENV['SUPER_KEY']}/12"
    # data_serialized = open(url).read
    # data = JSON.parse(data_serialized)

    # @super_hero_name = data["name"]

    ### CAT API : KEY IN HEADERS ###

    # response = Faraday.new("https://api.thecatapi.com/v1/breeds/search?q=abyss", headers: { 'x-api-key': "#{ENV['CAT_API']}" }).get
    # response_serialized = response.body
    # raise

    #### OPEN-FOOTBALL-DATA API : KEY IN HEADERS ####

    # response = Faraday.new("http://api.football-data.org/v2/teams/78", headers: { 'X-Auth-Token': "#{ENV['FOOT_API']}" }).get
    # response_serialized = response.body
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)
    if @garden.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @garden.update(garden_params)
    redirect_to garden_path(@garden)
  end

  def destroy
    @garden.destroy
    redirect_to gardens_path
  end

  def top
    @top_gardens = Garden.where(stars: 5)
  end

  def gardener
    @gardener_name = @garden.gardener_name
    @gardener_age = @garden.gardener_age
  end

  private

  def set_garden
    @garden = Garden.find(params[:id])
  end

  def garden_params
    params.require(:garden).permit(:name, :address, :stars, :gardener_name, :gardener_age)
  end
end
