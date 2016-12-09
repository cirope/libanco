module BanksHelper
  def bank_accounts bank
    bank.bank_accounts.new if bank.bank_accounts.blank?
    bank.bank_accounts
  end
end
