Introduction 

When people travel somewhere either for vacation, a weekend getaway or important business, a place to stay is always the first thing to decide after booking the trip, it is the most important part for everyone on the road. No wonder hotel industry is one of the most profitable business, but in recent years, this industry has been challenged dramatically. Along with the technological progression in the internet era, a company is changing the lifestyle of many of us. Airbnb, an online marketplace for accommodation sharing, reached 4 million listings in over 65,000 cities worldwide in just 10 years. The value of Airbnb is estimated to be $32 billion today, which combines the famous Hilton group and Wynn Resorts. 
We are very interest in the Airbnb listing data because of several reasons. First of all, Airbnb is a free trading marketplace, compare with chained hotel groups, it’s a decentralized system, customers have more bargaining power at Airbnb so that we think the listing price is more transparent and reactive, and we can discover information about true market drivers. Secondly, there are more way more listings on Airbnb than hotels rooms in most areas, and they are more spread out around the city. We all know that location is the most significant price determinant, with more spread data points, we can further reveal how this relationship was formed. Thirdly, people stayed in Airbnb rooms are about 34% more likely to leave a review, because they feel more connected with the host of the house or condo rather than a commercialized hotel, so there’s more data on how people think about their accommodation we can study.  
Since we are already living in the fabulous New York City, we want to discover somewhere else, so we targeted at the other mega city in the U.S. San Francisco. 
Here are some questions we are most interested in San Francisco Airbnb listings:
How does the location affect the listing price?
Is public transit important for listings?
Which transportation method do travelers value the most?
What are the valuable amenities?
Which housing type is most popular? 


Description of data

We are not interested in how the price or other variables change over time but rather the intrinsic relationship among them. Therefore,  we picked a recent month of data, October 2018 for analysis. 
Airbnb has a mature API top fetch data, we just have to fill out the request to access on their portal. That process is rather straightforward, we stated our purpose for using their data and got approved on the same day. The dataset contains some basic information about every listing such as location, price, zip code, property types like apartment or house. Other very interesting and valuable features are the text descriptions, they are written by the host about the room or around the community, we are sure that we can mine some gold nuggets from these texts and learn more about the market. 

Data Quality 

The quality of data is obviously the best among all the sources since it is directly from the owner, it is trustworthy and relatively most complete. The first step of our exploratory data analysis on this dataset is to analysis the missing data, we plotted a visna graph to observe it intuitively. We saw that most of the data is missing sq feet and neighborhood group variables, we think this is acceptable since we don’t think the size of the house or condo is the main driver for the market, and we can infer the neighborhood from it’s coordinate and zip code information. 
For the variables that we want to focus on, such as price, zip code, transit, description and property type, are very complete with all of them has lower than 3% missing rate. Since the proportion of the missing data is very low, we will just exclude these row when performing the analysis. 

Main Analysis 


Executive Summary 

Pricing strategy is a rather critical component for hotel and airline industries, corporations like Hilton and Marriot hire researchers in fields like operation research, industrial engineering, and even psychology to develop the dynamic pricing model to react on the market demand and elevate the profit. For hosts on Airbnb, they are not necessarily having a degree in those fields, how can they make an offer to make the most out of the market? Browsing other listings online seems a great idea, and Airbnb does have many filters to let people find rooms similar to theirs. However, there are so many components can affect the price and so many listing in cities like San Francisco, an average host doesn’t have enough statistical knowledge to have a clear idea about the what’s driving the price and make the best offer. Therefore, our goal is to present these drivers and help the hosts to better determine what they should offer.

Obviously, location is still the biggest drive for the price as we have assumed. The price goes higher for the districts by the northeast coast and downtown area, which follows the distribution in the real estate market, a higher valued house can charge more for room sharing. Since these houses or condos are sold for a higher price, we can infer these places have great views and luxury finish, and therefore can provide a better experience for the traveler. 


The district with the highest overall price is 94104, a neighbor right by the financial district, it can be interpreted that people go to San Francisco for business trip want to live close to the companies they are going to, and they are willing to pay a higher price due to subsidiaries from their employer. For average travelers, this district is also in the heart of downtown San Francisco, which can provide easier transportation and access to bars and restaurants, the word cloud for descriptions of listings in this district below approved this point.

We can see these hosts are talking a lot about clubs, union square, and dining in their descriptions, these are the place people would love to walk rather than ride for half an hour for, and hence living close to it and enjoy, the demand, therefore, driving the price up. If we trace back the development of city neighborhoods, that’s how different clusters with different cultures are formed, people want to stay closer to the place that attracts them. 
On the other hand, the most pricey areas are also very close to the famous attraction places in San Francisco such as Fisherman’s Wharf, Golden Gate Bridge, Lombard Street, and union square, which also drives the price up as we can see from the graph below, away from attractions is preventing many districts to achieve a higher price. 

It’s easier to understand that people not willing to travel far for clubs and restaurants, how about other places like attraction points, parks, and shopping? Do travelers want to spend time on the road? If that’s the case, listings with easier access to public transit would be more competitive and charge more. But the fact is not, as we can observe from the graph below, the price distribution between listings mentioning one of the public transit method(bus, train,BART, shuttle) in their description or not at all, and the difference is rather subtle.


 

We know that public transportation in California is not so convenient, most people will drive to places and so does travelers. If the traveling people rented a car, they would need a place to park, so what about hosts mentioning parking? 



Again, not so much difference. Therefore, this verified our point that when people travel to San Francisco, they do not want to spend much time on the road again, but rather stay closer to the places they plan to go. 

Therefore, the most exciting finding for our analysis is that we revealed the more intrinsic relationships between price and location. Harold Samuel, a real estate tycoon in Britain, coined the expression: “There are three things that matter in property: location, location, location”. Our findings verified that this rule still holds in nowadays even with the huge steps in transportation technologies. 

Our suggestions to the hosts, or people looking for house and plan to share rooms for profit in the future,  that if they want to maximize their income from room sharing, it is much better and competitive to being close to either attraction points for tourists, or business districts for business travelers, or clubs and restaurants for everyone is the best selling point. Take this advantage and otherwise, compete on price or service. 
