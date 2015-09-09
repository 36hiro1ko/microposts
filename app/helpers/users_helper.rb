module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  
  #未読メッセージを表示する
  def mailcount_for(user)
    @unread = Mailbox.where(read: 0, recipient_id: user).count
    #@unread if @unread >= 1
    if @unread >= 1
      %Q{<a href="./inbox"><i class="glyphicon glyphicon-envelope"></i> <span class="badge">#{ @unread}</span></a>}.html_safe
    else
       %Q{<a href="./inbox"><i class="glyphicon glyphicon-envelope"></i></a>}.html_safe
    end
  end
  
end
