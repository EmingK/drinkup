require 'json'
require './network_utils'

class Github
  include NetworkUtils

  def self.get_sheets branch_name
    sheet_folder_uri = "https://api.github.com/repos/secreek/drinkup/contents/sheets"
    params = {:ref => branch_name}
    return NetworkUtils.do_request_returning_json sheet_folder_uri, params
  end

  def self.get_raw_content branch_name, path
    content_uri = "https://raw.github.com/secreek/drinkup/#{branch_name}/#{path}"
    return NetworkUtils.do_request_returning_json content_uri
  end

  def self.get_user_info_from_id inner_id
    user_uri = "https://api.github.com/user/" + inner_id
    return NetworkUtils.do_request_returning_json user_uri
  end

end
