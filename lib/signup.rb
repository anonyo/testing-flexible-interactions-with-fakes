require "account"
require "user"

class Signup
  def initialize(account_name:, email:, logger:)
    @account_name = account_name
    @email = email
    @logger = logger
  end

  def save
    account = Account.create!(name: @account_name)
    User.create!(account: account, email: @email)
    @logger.debug("Created user #{@email} with account #{@account_name}")
    true
  rescue StandardError => error
    @logger.fatal(error.message)
    false
  end
end
