library(tidyverse)

source("data.R")
source("geom_flat_violin.R")
source("hnudge.R")
source("ggtheme.R")

breaks <- c("OFF", "CRW", "HD", "FD")
cols <- c("#BF616A", "#D08770", "#A3BE8C", "#B48EAD")

ggplot(dat, aes(x = Move, y = Infect)) +
  geom_flat_violin(aes(fill = Move), color = NA, position = position_hnudge(x = 0.1), 
                   adjust = 1.25, trim = FALSE) +
  geom_boxplot(outlier.shape = NA, width = 0.1, colour = "gray20", fill = "NA") +
  geom_point(aes(x = as.numeric(Move) - 0.25, y = Infect, color = Move), 
             position = position_jitter(width = 0.15), size = 2, alpha = 0.35) +
  theme(legend.position = "none",
        axis.text.x = element_text(angle = 0, hjust = 0.5)) +
  labs(y = "# Infections", x = "Movement Model") +  
  scale_fill_manual(breaks = breaks, values = cols) + 
  scale_color_manual(breaks = breaks, values = cols) +
  theme_classic()