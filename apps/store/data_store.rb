require 'json'
require_relative '../helper/data_helper'

class DataStore

  include DataHelper

  def initialize(settings)
    @settings = settings
  end

  def get_all_data
    data_hash = parse_data
    p @settings.name
    p 'get all data'
    data_hash
  end

  def update_item
    p 'do something update'

  end

  def delete_item
    p 'do something delete'
  end

  def add_item
    p 'do something add'
  end
end