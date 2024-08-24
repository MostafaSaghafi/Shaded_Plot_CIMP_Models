library(readxl)
library(ggplot2)
library(dplyr)
library(tidyr)
# Replace with the actual paths to your Excel files
data_rcp45 <- read_excel("C:/Users/Mostafa/Desktop/Rajaei/CMIP5/RCP45.xlsx")
data_rcp85 <- read_excel("C:/Users/Mostafa/Desktop/Rajaei/CMIP5/RCP85.xlsx")

# Preprocess the datasets (example: filtering out -99 values)
data_rcp45 <- dplyr::filter(data_rcp45, SPI_3M != -99, SPI_6M != -99, SPI_12M != -99)
data_rcp85 <- dplyr::filter(data_rcp85, SPI_3M != -99, SPI_6M != -99, SPI_12M != -99)

# Plotting with smoothing (example: plotting SPI-3M for both datasets)
ggplot() +
  geom_smooth(data = data_rcp45, aes(x = Year, y = SPI_3M, color = "RCP 4.5", fill = "RCP 4.5"), method = "loess", alpha = 0.2) +
  geom_smooth(data = data_rcp85, aes(x = Year, y = SPI_3M, color = "RCP 8.5", fill = "RCP 8.5"), method = "loess", alpha = 0.2) +
  scale_color_manual(values = c("RCP 4.5" = "blue", "RCP 8.5" = "red")) +
  scale_fill_manual(values = c("RCP 4.5" = "blue", "RCP 8.5" = "red")) +
  labs(title = "Simulated SPI Under RCP 4.5 and RCP 8.5 scenarios (3-Month)", x = "Year", y = "SPI Value") +
  geom_hline(yintercept = 0, linetype = "dashed", color = "purple") + # This adds the historical line
  theme_minimal()