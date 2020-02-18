require(ApacheLogProcessor)
require(dplyr)
require(rgeolocate)
require(rgeos)
require(shiny)
require(leaflet)
require(ggplot2)
require(sf)
#require(RColorBrewer)
require(tidyverse)
library(magrittr) # for piping
library(data.table) # for selecting known
#require(RgoogleMaps)
#install.packages(c("cowplot", "googleway", "ggplot2", "ggrepel","ggspatial", "libwgeom", "sf", "rnaturalearth", "rnaturalearthdata"))
                 
library("rnaturalearth")
library("rnaturalearthdata")


world <- ne_countries(scale = "medium", returnclass = "sf")
class(world)

## initial Zoom level for map and restrictions on zoom to limit mapTiles required
defaultZoom<-3
lowZoom<-3
highZoom<-5
## Focus of map -Hebei, China
focusLon<-70
focusLat<-30.5
print(paste0("defaultZoom:",defaultZoom))
print(paste0("lowZoom:",lowZoom))
print(paste0("highZoom:", highZoom))


path_combined = system.file("access", "access\access_log.txt", package = "ApacheLogProcessor")
path_common = system.file("access", "access\access_log.txt", package = "ApacheLogProcessor")

#Return only the ip, url and datetime columns
df = read.apache.access.log("access/access_log.txt", format="common", columns=c("ip", "url", "datetime"))

## remove localhost ip,  this df contains the URL which can be used to determine malicious intent
ip_df<-df %>% filter(ip != "127.0.0.1")
php_ip<-ip_df[ip_df$url %like% "php",]
ip_df<-php_ip

print(c("Records found:",nrow(ip_df)))

#group by ip to see who hits the site the most
summary_df<-ip_df %>% 
  group_by(ip) %>%
  summarize(count=n())

# sort descending, top hitters at the top
attach(summary_df)
df<-summary_df[order(-count),]

## now the fun part, locate the countries for each IP
geofile <- system.file("extdata","GeoLite2-Country.mmdb", package = "rgeolocate")
#results <- maxmind("196.200.60.51", file, c("continent_name", "country_code", "country_name"))

## this dataframe shows the country and access count, ready for plotting
plot_df<-cbind(df, maxmind(df$ip, geofile, c("continent_name", "country_code", "country_name")))

country_df<-plot_df %>% group_by(country_name) %>% summarize(count=sum(count))
attach(country_df)
country_df<-country_df[order(-count),]

print(c("Total Countries:",nrow(country_df)))

##filter out the N/A
country_df<-country_df %>% filter(!is.na(country_name))

top10<-country_df[1:10,]


# barchart with added parameters
barplot(top10$count,
        main = "Top 10 PHP Access by Country",
        xlab = "Access Count",
        names.arg = top10$country_name, las=1,
        col = "darkred",
        horiz = TRUE)


ggplot(data = world) +
  geom_sf() +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("World map", subtitle = paste0("(", length(unique(world$NAME)), " countries)"))

ggplot(data = world) +
  geom_sf() +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("World map", subtitle = paste0("(", length(unique(world$NAME)), " countries)"))
