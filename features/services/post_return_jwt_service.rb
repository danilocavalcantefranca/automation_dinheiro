class PostReturnJwt
  include HTTParty

  base_uri HOSTS["mp-alf"]
  headers 'Content-Type' => 'application/json'

  def return_jwt(template)
    post_return_jwt(template, self, PATHS["mp-alf"]['post_return_jwt'])
  end
end