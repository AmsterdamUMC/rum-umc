# Load necessary library
library(ggplot2)


# highlight category ------------------------------------------------------

# Sample data for illustration
data <- data.frame(category = c("A", "B", "A", "C", "B", "A", "C"))
ggplot(data, aes(x = category)) + geom_bar()

# Create a new column 'highlight' to specify the color condition
data$highlight <- ifelse(data$category == "A", "yes", "no")

# Plot the bar chart, highlighting category "A"
ggplot(data, aes(x = category, fill = highlight)) +
  geom_bar() +
  scale_fill_manual(values = c("no" = "grey", "yes" = "darkgreen")) +
  theme(legend.position = "none")


# highlight value ---------------------------------------------------------

# Sample data for illustration
set.seed(123)
data <- data.frame(
  x = rnorm(10)
)

# highlight the 3th value
data$highlight <- "no"
data$highlight[3] <- "yes"


ggplot(data, aes(x=x, fill=highlight)) + geom_histogram(bins = length(data$highlight), stat="bin") + 
  scale_fill_manual(values = c("no" = "grey", "yes"= "blue")) +
  theme(legend.position = "none")

## add dodge (prevents stacking)
ggplot(data, aes(x=x, fill=highlight)) + geom_histogram(bins = length(data$highlight), stat="bin", position="dodge") +  # dodge prevents stacking
  scale_fill_manual(values = c("no" = "grey", "yes"= "blue")) +
  theme(legend.position = "none")





# add length --------------------------------------------------------------

# Load necessary libraries
library(ggplot2)
#library(ggforce) ## extends ggplot by offering more options for visualization


### LENGTH
# Example data
data <- data.frame(
  x = 1:10,
  y = c(1, 4, 6, 7, 8, 6, 7, 9, 10, 11)
)

# Base plot: Scatter plot of data
p <- ggplot(data, aes(x, y)) +
  geom_point(color = "blue", size = 3) +  # Scatter plot
  theme_minimal() +
  labs(title = "Adding a Line to Indicate the End")

# Add a line to indicate the end (e.g., vertical line at x = 10)
p
p + geom_vline(xintercept = 10, color = "red", linetype = "dashed", size = 1)
p + geom_hline(yintercept = 6, color = "red", linetype = "dashed", size = 1.5)



# add size ---------------------------------------------------------------

# Example data
data <- data.frame(
  x = 1:10,
  y = c(1, 4, 6, 7, 8, 6, 7, 9, 10, 11)
)

# Base scatter plot
p <- ggplot(data, aes(x, y)) +
  geom_point(color = "blue", size = 3) +  # Scatter plot points
  theme_minimal() +
  labs(title = "Highlighting a Specific Point")

# Highlight the point where x = 5 (for example)
p
p + geom_point(data = subset(data, x == 5), aes(x, y), color = "red", size = 6)
p + geom_point(data = subset(data, x == 5), aes(x, y), color = "red", size = 6, shape = 17)  # Red triangle at x=5


# add orientation ---------------------------------------------------------

# Create a scatter plot with a line at a specific orientation (slope)
p
p + geom_abline(slope = 1, intercept = 0, color = "red", size = 1)  # Line with slope = 1 (45-degree angle)

# Add an arrow showing orientation
p + geom_segment(aes(x = 5, y = 8, xend = 6, yend = 6), 
               arrow = arrow(type = "closed"), 
               color = "red", size = 1.5) 



# add width ---------------------------------------------------------------

# Example data for bar chart
bar_data <- data.frame(
  category = c("A", "B", "C"),
  value = c(10, 20, 30)
)

# Create the base bar chart
p <- ggplot(bar_data, aes(x = category, y = value)) +
  geom_bar(stat = "identity", fill = "steelblue", width = 0.5) +  # Regular bars with width = 0.5
  theme_minimal() +
  labs(title = "Highlighting a Single Bar by Changing its Width")

# Highlight bar 'B' with a wider width (e.g., width = 0.8)
p
p + 
  geom_bar(data = subset(bar_data, category == "B"), 
           aes(x = category, y = value), 
           stat = "identity", 
           fill = "red", width = 0.8)  # Highlight bar 'B' with different width



# add position ------------------------------------------------------------

# Example data
bar_data <- data.frame(
  category = c("A", "B", "C"),
  value = c(10, 20, 30)
)

# Base vertical bar plot
p <- ggplot(bar_data, aes(x = category, y = value)) +
  geom_bar(stat = "identity", fill = "steelblue", width = 0.5) +  # Regular vertical bars
  theme_minimal() +
  labs(title = "Vertical Bar Plot")

# Flip to horizontal bar plot
p
p + coord_flip()  # Flip the axes


# add curvature -----------------------------------------------------------

# Example data with multiple points
data <- data.frame(
  x = 1:10,
  y = c(2, 3, 4, 7, 5, 6, 9, 8, 10, 12)
)

# Base scatter plot with lines connecting the points
p <- ggplot(data, aes(x, y)) +
  geom_point(color = "blue", size = 4) +  # Points
  theme_minimal() +
  labs(title = "Highlight Space Between Two Points with Curvature")

# Add a curved line between x = 4 and x = 7 to highlight the space between them
p
p +   geom_line(color = "gray") # Connect points with a straight line

p + 
  geom_curve(aes(x = 4, y = 7, xend = 7, yend = 9),  # Curve between these two points
             color = "red", size = 1.5, curvature = 0.9)  # Curved line with specified curvature


