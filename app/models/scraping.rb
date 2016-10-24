class Scraping
  def self.movie_urls
     link =[]
     agent = Mechanize.new
     next_url = ""

     while true
      current_page = agent.get("http://review-movie.herokuapp.com/" + next_url)
      elements = current_page.search('.entry-title a')
      elements.each do |ele|
        link << ele.get_attribute('href')
      end

      next_link = current_page.at('.pagination .next a')
      break unless next_link
      next_url = next_link.get_attribute('href')
     end

   link.each do|link|
    get_product('http://review-movie.herokuapp.com/' + link)
   end
 end

 def self.get_product(link)
  agent = Mechanize.new
  product_page = agent.get(link)
  title = product_page.at('.entry-title').inner_text if product_page.at('.entry-title')
  image_url = product_page.at('.entry-content img')[:src] if product_page.at('.entry-content')

    product = Product.where(title: title).first_or_initialize
    product.image_url = image_url
    product.save
 end
end