library(readr)
library(dplyr)
library(stringr)
library(tidyr)
library(ggplot2)
library(scico)

# read data
data <- read_csv("Data/landsat/sample_ndvi.csv")

# select cols
data <- select(data,
               id, 
               contains("LC"))

# pivot
data <- pivot_longer(data, cols = -id,
                     names_to = "date",
                     values_to = "ndvi")

# get date from image name letting lubridate guess
# also fix ndvi
data <- mutate(data,
               id = as.character(as.numeric(id)),
               date = lubridate::as_date(str_sub(date, -8, -1),
                                         format = "%Y%m%d"),
               ndvi = if_else(ndvi == -9999, NA_real_, ndvi))

# remove NA ndvi
data <- filter(data,
               !is.na(ndvi))

# plot
ggplot(data,
       aes(x = date, y = ndvi,
           group = id)) +
  geom_point(col = "steelblue", 
             alpha = 0.1) +
  geom_smooth(se = F, size = 0.3,
              col = "steelblue") +
  scale_x_date(date_labels = "%B %Y") +
  scale_fill_scico(palette = "bilbao",
                     direction = 1) +
  coord_cartesian(ylim = c(-0.1, 1.0)) +
  theme_test(base_family = "IBM Plex Sans")+
  theme(legend.position = c(0.8, 0.1),
        legend.direction = "horizontal",
        axis.text.y = element_text(angle = 90,
                                   hjust = 0.5),
        axis.text.x = element_text(size = 5),
        panel.grid.major.x = element_line(size = 0.1,
                                          colour = "grey"),
        panel.grid.major.y = element_line(size = 0.1,
                                          colour = "grey"),
        panel.grid.minor.y = element_line(size = 0.1,
                                          colour = "grey")) +
  labs(x = "Time",
       y = "NDVI",
       colour = "NDVI")
