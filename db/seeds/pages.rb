::Page.reset_column_information
# Check whether all columns are applied yet by seo_meta.
unless !defined?(::SeoMeta) || ::SeoMeta.attributes.keys.all? { |k|
  ::Page.translation_class.instance_methods.include?(k)
}
  # Make pages model seo_meta because not all columns are accessible.
  ::Page.translation_class.send :is_seo_meta
end

page_position = -1

home_page = Page.create(
  :title => "Home",
  :deletable => false,
  :link_url => "/",
  :position => (page_position += 1)
)

home_page.parts.create({
  :title => "Body",
  :body => "",
  :position => 0
})

home_page_position = -1
page_not_found_page = home_page.children.create(
  :title => "Page not found",
  :menu_match => "^/404$",
  :show_in_menu => false,
  :deletable => false,
  :position => (home_page_position += 1)
)

page_not_found_page.parts.create({
  :title => "Body",
  :body => "<h2>Sorry, there was a problem...</h2><p>The page you requested was not found.</p><p><a href='/'>Return to the home page</a></p>",
  :position => 0
})

about_us_page = Page.create(
  :title => "About Us",
  :deletable => true,
  :position => (page_position += 1)
)

#Initial About Us page as heredoc so we can develop against what we think the page will look like
about_us_body = <<END
<p>Second Chance Dog Rescue is one of San Diego's largest and most successful <strong>non-profit 501c3</strong> organizations dedicated to saving homeless dogs. We rescue, rehabilitate and rehome dogs from local shelters, as well as dogs surrendered by their owners for various reasons, and dogs from Baja California, Mexico. Once we receive a dog, we provide medical care, including spay and neuter, and any necessary rehabilitation.</p>
<p>Second Chance Dog Rescue was founded in the fall of 2008 by Sandra D. Simpson, Jason Cordoba and Maria Blake who recognized the urgent need in our community. We pride ourselves on being a rescue group that is flexible and non-breed specific. We also have the ability to rescue senior dogs as well as those with health or medical issues. In two years' time, Second Chance Dog Rescue has accomplished a true miracle within our community.</p>
<p>We have successfully rescued 2,000 dogs from euthanasia, placing them in loving, safe, forever homes. Many asked how this was possible. It was done utilizing a team of very dedicated volunteers who bring a wealth of experience regarding dog behaviors, business sense, use of modern technology, networking, and our philosophy of keeping the welfare of the dogs our first priority.</p>
<p>Another one of our strongest keys to success is our network of volunteers and foster family homes. Because we do not operate out of a shelter or have a facility in which to house our adoptable dogs, we rely heavily on volunteers who lovingly open their hearts and their homes, offering temporary accommodations. Once integrated into one of our foster families, a dog that may have come to us frightened, timid, or otherwise emotionally scarred, will blossom and flourish with the tender loving care it receives there, often within just a few days or weeks.</p>
<p>Additionally, Second Chance Dog Rescue has an &lsquo;open door&rsquo; policy, which means we continue to welcome the County of San Diego Department of Animal Control to perform routine inspections of our dogs, daily operations, visits to our foster family homes, adoption events, online database of medical records, veterinarian invoices and so forth.</p>
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
<p>We have an application process for those interested in adopting one of our dogs. Upon approval of the application, the dog and the adopter enter into a two week &lsquo;trial&rsquo; or foster period, to make sure it's the right fit for the family and the dog. After completion of a successful foster period, we may do a home visit before we finalize the adoption.</p>
END

about_us_page.parts.create({
  :title => "Body",
  :body => about_us_body,
  :position => 0
})

how_to_help_page = Page.create(
  :title => "How to Help",
  :deletable => true,
  :position => (page_position += 1)
)

how_to_help_body = <<END
<ul>
  <li><a href="#foster">Foster</a></li>
  <li><a href="#volunteer">Volunteer</a></li>
  <li><a href="/events">Adoption Events</a></li>
</ul>

<h1>Foster a Dog</h1>
<p>Second Chance Dog Rescue is a non-profit operated solely by volunteers with no central kennel or shelter location - our dogs are all in private homes, so if it weren't for our wonderful foster families, we wouldn't be able to do what we do.</p>

<p>Being a foster with Second Chance Dog Rescue is a rewarding experience as you are helping us save another dog's life! We can only rescue the amount of dogs that we have fosters for so we are always looking for new fosters. We provide you with with all of the supplies and needed vet care - you provide the dog with love, companionship and guidance.</p>

<p>All of our rescues are of all breeds, ages and sizes. We work with you and your household to make sure that you are matched up with a rescue(s) that will mesh well in your home. However, please keep in mind that most of our dogs are rescues that have come from shelters, abusive situations or found as strays and may have issues that need patience and a kind heart. Usually a rescue dog will come out of their shell within the first 48 hrs of being in a foster home and you can get to know their true personality. There are some cases where it may take longer, but with your help, they can again feel safe, secure, exercised and socliazed again.</p>

<p>Just as we work to find the right foster dog for you, Second Chance also works hard on finding the right forever home for our rescues. Therefore, the fostering commitment can last from a few days to even months - just depends on the dog.</p>

<p>Please keep the following things in mind to help you and your family decide if you are willing to take on this wonderful commitment:</p>

<ul>
  <li>Please provide care and affection for your foster dog such as socialization, healthy practices, and some basic training.</li>
  <li>Keep your foster dog on a leash at all times, even in dog parks until you learn about their strengths and social skills.</li>
  <li>We require your foster dog to ALWAYS wear its Second Chance Dog Rescue identification tag, to ensure its safe return should he/she escape.</li>
  <li>We provide all necessary supplies, but always appreciate donations as well.</li>
  <li>If a foster dog is not working out, normally we need up to 72 hours to find another foster for the dog.</li>
  <li>As a foster, if the rescue dog gets lost in your care, please help us find the dog by notifying us immediately, posting flyers, posting on Craigslist.</li>
  <li>We rely on our fosters for pictures and bios for the our available dogs listings. Your wonderful information/updates will help the dog(s) find their loving homes faster.
  <li>Most of all, just give the dog(s) lots of love and cuddlles so that they can be ready for their new forever home!</li>
</ul>
<p>Once you are accepted to become a foster, we provide you a foster packet with valuable information, contact numbers/emails, etc. for your reference and to have available for any questions and emergencies that may arise. This insures that all goes smoothly for your household and for the rescue dog.</p>

<p>If you would like to volunteer as a foster and help save a dog's life, please complete and submit the application found below.</p>

<p>Thank you in advance for considering to become a foster!</p>
END

how_to_help_page.parts.create({
  :title => "How to Help",
  :body => how_to_help_body,
  :position => 0
})
