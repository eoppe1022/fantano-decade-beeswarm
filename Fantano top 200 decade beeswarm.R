
library(tidyverse)
library(extrafont)
library(ggbeeswarm)

mydata <- read_csv("fantano top 200 decade.csv")

mydata %>%
  mutate(year = as.character(year)) %>%
  ggplot(aes(y = ranking, x = ordered(year, levels = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019)))) + 
  ggbeeswarm::geom_beeswarm(groupOnX = TRUE, aes(color = year), size = 4) + 
  guides(color = FALSE) +
  labs(title = "Anthony Fantano's Top 200 Albums of the Decade by Year", 
       subtitle = 'Data and inspiration from u/asgafrat',
       y = "Rank",
       x = "",
       caption = "@OppenheimerEvan") +
  theme_minimal(base_family = "Tw Cen MT Condensed") +
  theme(plot.title = element_text(hjust = 0, face = "bold", size = 50, margin = margin(1, 0, 20, 0)),
        axis.title = element_text(face = "bold", size = 36),
        axis.text.y = element_text(face = "bold", size = 27),
        axis.text.x = element_text(face = "bold", size = 23),
        axis.title.x = element_text(margin = margin(35, 0, 0, 0)),
        axis.title.y = element_text(margin = margin(0, 35, 0, 0)),
        plot.margin = margin(25, 15, 25, 15),
        axis.line = element_blank(),
        axis.ticks.length = unit(0.7, "cm"),
        panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.spacing = unit(1.5, "lines"),
        plot.caption = element_text(size = 19, face = "bold", hjust = 0.95),
        plot.subtitle = element_text(size = 32, face = "bold", margin = margin(0, 0, 30, 0))) +
  scale_y_reverse(breaks = c(200, 150, 100, 50, 1))

ggsave("fantano_rankings.png", dpi = 320, height = (2.72 * 4), width = (4.17 * 4))

