::Page.reset_column_information
# Check whether all columns are applied yet by seo_meta.
unless !defined?(::SeoMeta) || ::SeoMeta.attributes.keys.all? { |k|
  ::Page.translation_class.instance_methods.include?(k)
}
  # Make pages model seo_meta because not all columns are accessible.
  ::Page.translation_class.send :is_seo_meta
end

page_position = -1

home_page = Page.create(:title => "Home",
            :deletable => false,
            :link_url => "/",
            :position => (page_position += 1))
home_page.parts.create({
              :title => "Body",
              :body => "<p>Welcome to our site. This is just a place holder page while we gather our content.</p>",
              :position => 0
            })
home_page.parts.create({
              :title => "Side Body",
              :body => "<p>This is another block of content over here.</p>",
              :position => 1
            })

home_page_position = -1
page_not_found_page = home_page.children.create(:title => "Page not found",
            :menu_match => "^/404$",
            :show_in_menu => false,
            :deletable => false,
            :position => (home_page_position += 1))
page_not_found_page.parts.create({
              :title => "Body",
              :body => "<h2>Sorry, there was a problem...</h2><p>The page you requested was not found.</p><p><a href='/'>Return to the home page</a></p>",
              :position => 0
            })

about_us_page = Page.create(:title => "About Us",
            :deletable => true,
            :position => (page_position += 1))
#Initial About Us page as heredoc so we can develop against what we think the page will look like
about_us_body = <<END
<p>Second Chance Dog Rescue is one of San Diego's largest and most successful <strong>non-profit 501c3</strong> organizations dedicated to saving homeless dogs. We rescue, rehabilitate and rehome dogs from local shelters, as well as dogs surrendered by their owners for various reasons, and dogs from Baja California, Mexico. Once we receive a dog, we provide medical care, including spay and neuter, and any necessary rehabilitation.</p>
<p>Second Chance Dog Rescue was founded in the fall of 2008 by Sandra D. Simpson, Jason Cordoba and Maria Blake who recognized the urgent need in our community.  We pride ourselves on being a rescue group that is flexible and non-breed specific. We also have the ability to rescue senior dogs as well as those with health or medical issues. In two years' time, Second Chance Dog Rescue has accomplished a true miracle within our community.</p>
<p>We have successfully rescued 2,000 dogs from euthanasia, placing them in loving, safe, forever homes. Many asked how this was possible. It was done utilizing a team of very dedicated volunteers who bring a wealth of experience regarding dog behaviors, business sense, use of modern technology, networking, and our philosophy of keeping the welfare of the dogs our first priority.</p>
<p>Another one of our strongest keys to success is our network of volunteers and foster family homes. Because we do not operate out of a shelter or have a facility in which to house our adoptable dogs, we rely heavily on volunteers who lovingly open their hearts and their homes, offering temporary accommodations. Once integrated into one of our foster families, a dog that may have come to us frightened, timid, or otherwise emotionally scarred, will blossom and flourish with the tender loving care it receives there, often within just a few days or weeks.</p>
<p>Additionally, Second Chance Dog Rescue has an &lsquo;open door&rsquo; policy, which means we continue to welcome the County of San Diego Department of Animal Control to perform routine inspections of our dogs, daily operations, visits to our foster family homes, adoption events, online database of medical records, veterinarian invoices and so forth. </p>
<p>With the support of so many, we hope to set a fine example, and maintain higher standards of excellence in the dog rescue community.Second Chance Dog Rescue has volunteer/foster families throughout Southern California and Baja California, Mexico. Won't you consider joining our team? The more foster families we have on board, the more dogs can be saved!</p>
<h3>Our Mission:</h3>
<p>
  Put puppy mills out of business.<br>
  Put breeders out of business.<br>
  Get animals spay and neutered.<br>
  Rescue dogs and find them a forever home.<br>
  Educate the public that a dog is not an accessory to put in a purse, left in a yard neglected or abused.
</p>
<h3>Application Process</h3>
<p>We have an application process for those interested in adopting one of our dogs.  Upon approval of the application, the dog and the adopter enter into a two week &lsquo;trial&rsquo; or foster period,  to make sure it's the right fit for the family and the dog. After completion of a successful foster period, we may do a home visit before we finalize the adoption.</p>
END
about_us_page.parts.create({
              :title => "Body",
              :body => about_us_body,
              :position => 0
            })
about_us_page.parts.create({
              :title => "Side Body",
              :body => "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus fringilla nisi a elit. Duis ultricies orci ut arcu. Ut ac nibh. Duis blandit rhoncus magna. Pellentesque semper risus ut magna. Etiam pulvinar tellus eget diam. Morbi blandit. Donec pulvinar mauris at ligula. Sed pellentesque, ipsum id congue molestie, lectus risus egestas pede, ac viverra diam lacus ac urna. Aenean elit.</p>",
              :position => 1
            })
