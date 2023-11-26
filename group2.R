# R PROJECT 
# GROUP 3 
# TOPIC: GGPLOT 2
# YASH AGGARWAL: 2K22MAE21
# CHETAN SINGHAL: 2K22MAE20
# ARYAN BHATI: 2K22MAE37
# DHRUV THAPLIYAL: 2K22MAE17
# VISHESH PAL: 2K22MAE53

# Read the CSV file
movies <- read.csv(file.choose())

# Rename the column names
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
names(movies)
# Convert variables to appropriate data types
movies$Film <- as.factor(movies$Film)
movies$CriticRating <- as.integer(movies$CriticRating)
movies$Year <- as.factor(movies$Year)
movies$Genre <- as.factor(movies$Genre)
str(movies)
# Load the ggplot2 library
#install.packages("ggplot2")
library(ggplot2)



# very basic scatter plot
ggplot(data=movies,aes(x=CriticRating, y=AudienceRating)) + 
  geom_point()

# Create a scatter plot with CriticRating on the x-axis, AudienceRating on the y-axis,
# color mapped to Genre,
# size mapped to BudgetMillions

ggplot(data = movies, aes(x = CriticRating, y = AudienceRating)) +
  geom_point(aes(colour = Genre, size = BudgetMillions))

" Points to note from this graph 
1. If we draw a diagonal, we could see that audience definitely 
   rates movies higher than critic
2. We could easily see that action movies are high budget 
   movies with fairly high audience rating and mixed critic rating
3. Comedy and drama movies have fairly high audience rating with low budget"

# we can assign a variable to the asthetics we did before 
a<- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating,
                      colour = Genre, size = BudgetMillions))
a + geom_point()

# does budget affect audience rating or critic rating ? 
a + geom_point(aes(x= BudgetMillions)) + xlab("BudgetMillions")
" we could clearly see that budget doesn't really affect the audience rating,
there could be other factors which may affect audience rating"


# what about critic rating ?
a + geom_point(aes(x= BudgetMillions, y=CriticRating)) +
  xlab("BudgetMillions") +
  ylab("CriticRating")
"critic rating is also unaffected by budget "

# adding geom smooth layer 
a + geom_point() + geom_smooth(fill = NA)
" Now its easy to understand and draw some inference from the graph 
1. Statistically, we could see that even if we have low critic
   ratings for romance, but we get high audience rating
2. If critic gives same rating to horror movies and action movies|
   adventure movies, then action movies are likely to get more of audience rating
"

# Create a boxplot of AudienceRating based on Genre, with color differentiated by Genre,
# and add jitter points for better visualization
c<- ggplot(data = movies, aes(x = Genre, y = AudienceRating, colour = Genre))

c +  geom_point() +
  geom_boxplot(alpha = 0.6) 
 "1.  We could see the most statistically likely audience rating of each genre
      when a random movie is thrown into this environment as per the data.
  2.  Movie with thrill genre is expected to get highest median audience rating
  3.  Thrill genre has the narrowest box, implies the lowest variance
  4.  Risky businness is to produce horror movies - lowest audience rating
  %.  Outliers in horror, romance and thrill " 

 # creating boxplot for critic rating 
d<- ggplot(data = movies, aes(x = Genre, y = CriticRating, colour = Genre))

d +  geom_point() +
  geom_boxplot(alpha = 0.6)

"1.  very high variance - we have more certainity in audience
     rating as compared to critic rating
 2. Thrill still has statistically highest critic rating 
 3. Horror has the least
 "

# Create histograms of BudgetMillions, with bins of width 10, 
# mapped and filled by Genre,
# and organized by Genre using facet_grid

ggplot(data = movies, aes(x = BudgetMillions)) +
  geom_histogram(binwidth = 10, aes(fill = Genre))

#setting a border 

b<- ggplot(data = movies, aes(x = BudgetMillions)) +
  geom_histogram(binwidth = 10, aes(fill = Genre), colour = "black")
b

" here we could see that it is slightly rightward skewed, most of the movies 
are low budget movies around 30-40 million "

# Facet 

ggplot(data = movies, aes(x = BudgetMillions)) +
  geom_histogram(binwidth = 10, aes(fill = Genre), colour = "black") +
  facet_grid(Genre ~ ., scale = "free")

# Create density charts of BudgetMillions, filled by Genre,
# and organized by Genre using facet_grid
ggplot(data = movies, aes(x = BudgetMillions)) +
  geom_density(aes(fill = Genre)) +
  facet_grid(Genre ~ ., scale = "free")

 # Create scatter plots of CriticRating vs. AudienceRating, with color mapped to Genre,
# and facets organized by Genre and Year
ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, colour = Genre)) +
  geom_point(size = 3) +
  facet_grid(Genre ~ Year)

# Create scatter plots of CriticRating vs. AudienceRating, with color mapped to Genre,
# size mapped to BudgetMillions, and control the coordinate limits
ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, size = BudgetMillions, colour = Genre)) +
  geom_point() +
  xlim(50, 100) +
  ylim(50, 100)

# Customize the theme by modifying axis labels, tick mark sizes, legend appearance, and plot title
ggplot(data = movies, aes(x = BudgetMillions)) +
  geom_histogram(binwidth = 10, aes(fill = Genre), colour = "black") +
  xlab("money axis") +
  ylab("number of movies") +
  theme(axis.title.x = element_text(colour = "brown", size = 30),
        axis.title.y = element_text(colour = "Red", size = 30),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        legend.title = element_text(size = 30),
        legend.text = element_text(size = 20),
        legend.position = c(1, 1),
        legend.justification = c(1, 1),
        plot.title = element_text(colour = "DarkBlue", size = 40, family = "Courier"))

