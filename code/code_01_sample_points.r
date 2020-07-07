#### prelim code to look at ndvi time series ####

library(sf)

# read in india vector
india <- st_read("Data/spatial/indian_states.gpkg") %>% 
  st_transform(32643)

# sample 100 points
samples <- st_sample(india, 10)

# get a random radius in km around each point
# between 0.1 and 5 km
buffer_size <- runif(n = 10, 
                     min = 100, 
                     max = 5000) %>% 
  round()
sample_buffer <- purrr::map2(samples, buffer_size, function(x, y) {
  st_buffer(x, y)
})

# make spatial object
sample_buffer <- tibble::tibble(point_id = seq_len(10),
                        geometry = sample_buffer)
sample_buffer <- st_as_sf(sample_buffer) %>% 
  `st_crs<-`(32643)

# save samples
st_write(sample_buffer, 
         dsn = "Data/spatial/sample_points.gpkg",
         delete_dsn = TRUE)

st_write(sample_buffer %>% 
           st_transform(4326),
         dsn = "Data/spatial/sample_points",
         layer = "sample_points",
         driver = "ESRI Shapefile",
         delete_dsn = T)
