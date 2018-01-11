module UsersHelper
# Gravatar with default img 
def gravatar_for(user, size: 200)
  gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  default_url = "https://s3.amazonaws.com/mirrorco/site/img/appicons/72.png"
  gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  image_tag(gravatar_url, alt: user.first_name + '' + user.last_name, class: "gravatar")
 end
end
