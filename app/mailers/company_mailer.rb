class CompanyMailer < ActionMailer::Base
  default from: "digital-media-map@nrw.de"


  def new_admin_company(company)
    @edit_url = edit_company_url(company.private_slug)
    mail :to => "michael@railslove.com",
         :subject => "new company"
  end
  
  def new_company(company)
    @edit_url = edit_company_url(company.private_slug)
    mail :to => "michael@railslove.com",
         :subject => "new company"
  end
end
