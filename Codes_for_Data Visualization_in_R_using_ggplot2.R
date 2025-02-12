# 1. Set Working Directory
# Displays the current working directory
getwd()

# 2. Load Data
# Read data from a CSV file
data <- read.csv("New_Data.csv", stringsAsFactors = FALSE)

# 3. View Data
head(data)

# 4. Load Required Libraries
install.packages("tidyverse")  # Install tidyverse if not installed
library(tidyverse)

# 5. Create and Save Scatter Plots
Plot1 <- ggplot(data = data) +
  geom_point(mapping = aes(x = PAScore, y = VAScore))
ggsave("Plot1.png", plot = Plot1, width = 6, height = 4, dpi = 300)

Plot2 <- ggplot(data = data) +
  geom_point(mapping = aes(x = PAScore, y = VAScore, color = Gender))
ggsave("Plot2.png", plot = Plot2, width = 6, height = 4, dpi = 300)

Plot3 <- ggplot(data = data) +
  geom_point(mapping = aes(x = PAScore, y = VAScore, size = Gender))
ggsave("Plot3.png", plot = Plot3, width = 6, height = 4, dpi = 300)

# 6. Create and Save Faceted Plot
Plot_facet <- ggplot(data = data) +
  geom_point(mapping = aes(x = PAScore, y = VAScore, color = Gender)) +
  facet_wrap(~ Education, nrow = 2)
ggsave("Plot_facet.png", plot = Plot_facet, width = 6, height = 4, dpi = 300)

# 7. Create and Save Smooth Line Plot
Plot_smooth <- ggplot(data = data) +
  geom_smooth(mapping = aes(x = PAScore, y = VAScore, color = Gender))
ggsave("Plot_smooth.png", plot = Plot_smooth, width = 6, height = 4, dpi = 300)

# 8. Create and Save Bar Charts
Bar_Plot1 <- ggplot(data = data) +
  geom_bar(mapping = aes(x = State, y = PAScore), stat = "identity")
ggsave("Bar_Plot1.png", plot = Bar_Plot1, width = 6, height = 4, dpi = 300)

Bar_Plot2 <- ggplot(data = data) +
  geom_bar(mapping = aes(x = State, fill = Education))
ggsave("Bar_Plot2.png", plot = Bar_Plot2, width = 6, height = 4, dpi = 300)

# 9. Create and Save Box Plots
Box_Plot1 <- ggplot(data = data, mapping = aes(x = Education, y = PAScore)) +
  geom_boxplot()
ggsave("Box_Plot1.png", plot = Box_Plot1, width = 6, height = 4, dpi = 300)

Box_Plot2 <- ggplot(data = data, mapping = aes(x = Education, y = PAScore)) +
  geom_boxplot() + coord_flip()
ggsave("Box_Plot2.png", plot = Box_Plot2, width = 6, height = 4, dpi = 300)

# 10. Create and Save Coxcomb Chart
Coxcomb_chart <- ggplot(data = data) +
  geom_bar(mapping = aes(x = Education, fill = Education),
           show.legend = FALSE, width = 1) +
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)
ggsave("Coxcomb_chart.png", plot = Coxcomb_chart, width = 6, height = 4, dpi = 300)

# 11. Create and Save Combined Bar Charts Using Patchwork
install.packages("patchwork")
library(patchwork)

bar_plot4 <- ggplot(data = data) +
  geom_bar(mapping = aes(x = Education, fill = Education),
           show.legend = FALSE, width = 1) +
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar_flipped <- bar_plot4 + coord_flip()
bar_polar <- bar_plot4 + coord_polar()

combined_plot <- bar_flipped | bar_polar
ggsave("combined_chart.png", plot = combined_plot, width = 10, height = 5, dpi = 300)

# 12. Create and Save Heatmap
heatmap1 <- data %>%
  count(State, Education) %>%
  ggplot(mapping = aes(x = State, y = Education)) +
  geom_tile(mapping = aes(fill = n))
ggsave("heatmap1.png", plot = heatmap1, width = 6, height = 4, dpi = 300)










































