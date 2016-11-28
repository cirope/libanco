COOKIES_DOMAIN = ".#{ENV['APP_HOST'].sub /:.*/, ''}"
RESERVED_SUBDOMAINS = ['admin', 'login', 'www']
EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}\Z/i
CUSTOMERS_PDF_PATH = Rails.root.join('private/pdfs/customers')
TAX_ID_REGEX = /\A\d{2}-\d{8}-\d{1}\Z/i
