require 'jwt'

class Auth
  ALGORITHM = 'HS256'

  # set expire jwt token for one day
  def self.encode(payload)
    payload[:exp] = 1.day.from_now.to_i
    JWT.encode(
      payload,
      auth_secret,
      ALGORITHM
    )
  end

  def self.decode(token)
    JWT.decode(
      token,
      auth_secret,
      true,
      { algorithm: ALGORITHM }
		).first
  end

  def self.auth_secret
    "\x85\x11\xFA\xEF\xF2A\x11\xC7\x90\x9C!{\xDC\x11W\xFB\x93\xE5\xA3\xCD\xE3\xC2\x9E#7\xC4\xCDa\xCF\xC9/\xEA"
  end
end
