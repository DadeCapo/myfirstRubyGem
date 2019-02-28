require 'dotenv/load'
require 'gmail'

class Email
  def initialize(email_address, country)
    @email_address  = email_address
    @country        = country
  end

  def deliver
    Gmail.connect!(ENV['GMAIL_ADDRESS'], "Soft1Volt") do |gmail|
      message = gmail.compose do |m|
        m.to      @email_address
        m.subject "#{@country_name} #{@country.emoji_flag}"
        m.body      "Here is that report!\n"
        m.add_file  "./country_report.pdf"
      end
      message.deliver!
      gmail.logout
  end
end
