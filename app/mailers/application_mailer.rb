class ApplicationMailer < ActionMailer::Base
  default from: %{"TESTER" <test_result@tester.com>}
  layout 'mailer'
end
