require 'erb'
include ERB::Util

CSL::Style.root = File.dirname(__FILE__)

def section id
  item = @items["/#{id.to_s}.*"]
  <<-HTML
<section markdown="block">
#{item.raw_content}
</section>
  HTML
end

def person name, website, profile, affiliation, email
  if not website
    txt = h name
  elsif not profile
    txt = %{<a href="#{h website}" class="author-name">#{h name}</a>}
  else
    txt = %{<a href="#{h website}" typeof="http://xmlns.com/foaf/0.1/Person" resource="#{profile}" class="author-name">#{h name}</a>}
  end
  if affiliation
    txt += %{<span class="author-org">#{h affiliation}</span>}
  end
  if email
    txt += %{<span class="author-email">#{h email}</span>}
  end
end
