RE_EMAIL_NAME   = '[\w\.%\+\-]+'                          # what you actually see in practice
#RE_EMAIL_NAME   = '0-9A-Z!#\$%\&\'\*\+_/=\?^\-`\{|\}~\.' # technically allowed by RFC-2822
RE_DOMAIN_HEAD  = '(?:[A-Z0-9\-]+\.)+'
RE_DOMAIN_TLD   = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'
RE_EMAIL_OK     = /\A#{RE_EMAIL_NAME}@#{RE_DOMAIN_HEAD}#{RE_DOMAIN_TLD}\z/i
MSG_EMAIL_BAD   = "should look like an email address."
