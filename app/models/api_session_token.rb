class ApiSessionToken
  extend  ActiveModel::Naming # make this model act like a tabled model (http://railscasts.com/episodes/219-active-model, http://yehudakatz.com/2010/01/10/activemodel-make-any-ruby-object-feel-like-activerecord/)
  
  TTL = 20.minutes

  def self.store
    @store ||= Hash.new
  end

  def initialize(existing_token=nil)
    @token = existing_token
    unless expired?
      self.last_seen = Time.now
    end
  end

  def token
    @token ||= MicroToken.generate 128
  end

  def ttl
    return TTL unless last_seen
    elapsed   = Time.now - last_seen
    remaining = (TTL - elapsed).floor
    remaining > 0 ? remaining : 0
  end

  def last_seen
    store[:last_seen_at]
  end

  def last_seen=(as_at)
    store[:last_seen_at] = as_at
  end

  def user
    return if expired?
    store[:user]
  end

  def user=(user)
    store[:user] = user
  end

  def expired?
    ttl < 1
  end

  def valid?
    !expired?
  end

  private

  def store
    self.class.store[token] ||= {}
  end

end
