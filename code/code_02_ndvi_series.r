library(readr)
library(dplyr)
library(stringr)
library(tidyr)
library(ggplot2)
library(scico)
library(glue)
library(lubridate)

# read data
data <- read_csv("Data/landsat/landsat8_ndvi_series_2014_2019.csv")

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
data <- drop_na(data, ndvi)

# group by month
data_summary <- data %>% 
  mutate(month_year = glue('{month(date, label = TRUE)}/{year(date)}'),
         month_year = as_date(parse_date_time(month_year, orders = c("m/Y")))) %>% 
  group_by(id, month_year) %>% 
  summarise(ndvi = mean(ndvi))

# plot
ggplot(data_summary,
       aes(x = month_year, y = ndvi,
           group = id)) +
  geom_jitter(col = "steelblue",
             alpha = 1,
             size = 0.2) +
  geom_line(se = F, size = 0.3,
            alpha = 0.5,
            col = "steelblue") +
  scale_x_date(date_labels = "%B %Y") +
  scale_fill_scico(palette = "bilbao",
                     direction = 1) +
  coord_cartesian(ylim = c(-0.1, 1.0),
                  expand = T) +
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

ggsave("Figures/fig_sample_ndvi.png", dpi = 300)
