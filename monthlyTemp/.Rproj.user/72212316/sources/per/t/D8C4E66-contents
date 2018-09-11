library(tidyverse)
source("geom_flat_violin.R")
source("hnudge.R")

#link to data
# https://fritz.freiburg.de:8443/Informationsportal/configurator?scenario=OpenData

data <- read.csv("data_freiburg.csv", sep = ";")

data %>% 
  select(Jahr, Monat.Jahresdurchschnitt, Lufttemperatur..Mittelwert..oC) %>% 
  filter(!Monat.Jahresdurchschnitt %in% c("Jahresdurchschnitt")) -> temp_month

names(temp_month) <- c("Year", "Month", "meanTemp")

temp_month$Month <- lapply(temp_month$Month, as.character)

temp_month$Month[temp_month$Month == "Januar"] <- "January"
temp_month$Month[temp_month$Month == "Februar"] <- "February"
temp_month$Month[temp_month$Month == "März"] <- "March"
temp_month$Month[temp_month$Month == "Mai"] <- "May"
temp_month$Month[temp_month$Month == "Juni"] <- "June"
temp_month$Month[temp_month$Month == "Juli"] <- "July"
temp_month$Month[temp_month$Month == "Oktober"] <- "October"
temp_month$Month[temp_month$Month == "Dezember"] <- "December"

# rearrange month order
temp_month$Month = factor(temp_month$Month, levels = month.name)

#define breaks
breaks <- c("January", "February", "March", "April", "May", "June", "July", "August",
            "September", "October", "November", "December")

#define colours
cols <- c("#652F72","#684182","#606D9D","#59C290","#83D278","#E0E542",
          "#E0E542","#83D278","#59C290","#606D9D","#684182","#652F72")


ggplot(temp_month, aes(x = Month, y = meanTemp)) +
  geom_flat_violin(aes(fill = Month), color = NA, position = position_hnudge(x = 0.1), 
                   adjust = 1.25, trim = FALSE) +
  geom_boxplot(outlier.shape = NA, width = 0.1, colour = "gray20", fill = "NA") +
  geom_point(aes(x = as.numeric(Month) - 0.25, y = meanTemp, color = Month), 
             position = position_jitter(width = 0.15), size = 2, alpha = 0.35) +
  labs(title = 'Monthly mean Temperature Freibug (Brsg) 1999-2017',
       subtitle = "Data: Open Data Portal Freiburg",
       caption = "Author: stefan.reifenberg@gmail.com",
       y = "Temperature °C", x = "") +
  scale_fill_manual(breaks = breaks, values = cols) + 
  scale_color_manual(breaks = breaks, values = cols) +
  scale_y_continuous(breaks=seq(-6,30,2), expand = c(0, 0), limits = c(-6,30)) +
  geom_hline(yintercept = 0, linetype = "dashed") +
  theme_bw() +
  theme(legend.position = "none",
        axis.text.x = element_text(angle = 0, hjust = 0.5))
 