# Assaults Against a Peace Officer by Province vs. Canada, 2008-2012

# Dataset: Violent crime rates (2008-2012), Ontario Data Catalogue
# https://data.ontario.ca/dataset/violent-crime-rates/resource/574e4981-aeff-45bb-9794-a9ed56df5042
# This script builds a grouped bar chart comparing the rate of "Total assaults
# against a peace officer" (per 100,000 population) across the Canadian
# provinces and the national total, for each year 2008-2012.Note that I dropped 
# the Terrotories as they dominate the graph if not.


#Load packages 
# tidyverse gives us readr (read_csv), dplyr (wrangling), tidyr (pivoting),
# ggplot2 (plotting). scales is used for nicer axis formatting.
library(tidyverse)
library(scales)


# Read the data
# The CSV has a TITLE row above the real header ("Violent Crime Rates ...").
# skip = 1 drops that title row so the true column names load correctly.

DATA_PATH <- "/Users/ethanchurchill/Desktop/Data Science visualization/02_activities/violent_crime_rates_csv_2008-12 .csv"

raw <- read_csv(DATA_PATH, skip = 1, show_col_types = FALSE)

# The first two columns have long names, I've renamed them 
# (The remaining columns are already named 2008, 2009, 2010, 2011, 2012.)
raw <- raw %>%
  rename(
    Geography = 1,   # rename by position: 1st column
    Violation = 2    # 2nd column
  )

glimpse(raw)   # quick look at structure


#Filter to the violation and geographies we want 
# We want ONE violation type: total assaults against a peace officer.
# The exact label in the data (including its footnote numbers) is below.
peace_label <- "Total assaults against a peace officer (25,35)"

# We compare the 10 provinces + the Canada total. We deliberately EXCLUDE the
# three territories (Nunavut, NWT, Yukon): their rates are an order of magnitude
# higher (Nunavut averages ~420 vs Canada ~35), which would dwarf the provinces
# and make the chart unreadable. We also exclude the Ontario city breakdowns so
# we are comparing like-for-like (province-level units only).
keep_geographies <- c(
  "Canada (50)", "Newfoundland and Labrador", "Prince Edward Island (51)",
  "Nova Scotia", "New Brunswick", "Quebec (50)", "Ontario (7)",
  "Manitoba", "Saskatchewan (11)", "Alberta", "British Columbia (28,41,49)"
)

dat <- raw %>%
  filter(Violation == peace_label,
         Geography %in% keep_geographies)


# Reshape to long format 
# ggplot wants long data one row per Geography-Year combination.
# Note something like Jasp prefers wide data frames. I am more accustomed to R.
# We pivot the five year columns into two columns Year and Rate.
dat_long <- dat %>%
  pivot_longer(
    cols = c(`2008`, `2009`, `2010`, `2011`, `2012`),
    names_to  = "Year",
    values_to = "Rate"
  ) %>%
  mutate(
    Year = as.integer(Year),
    Rate = as.numeric(Rate)
  )


#Clean up the geography labels
# province names to standard abbreviations so 11 labels fit along the axis.
label_map <- c(
  "Canada (50)"                 = "Canada",
  "Newfoundland and Labrador"   = "N.L.",
  "Prince Edward Island (51)"   = "P.E.I.",
  "Nova Scotia"                 = "N.S.",
  "New Brunswick"               = "N.B.",
  "Quebec (50)"                 = "Quebec",
  "Ontario (7)"                 = "Ontario",
  "Manitoba"                    = "Manitoba",
  "Saskatchewan (11)"           = "Sask.",
  "Alberta"                     = "Alberta",
  "British Columbia (28,41,49)" = "B.C."
)

dat_long <- dat_long %>%
  mutate(Geo = recode(Geography, !!!label_map))

# Order the geographies on the x-axis by their 2012 rate (highest -> lowest),

order_2012 <- dat_long %>%
  filter(Year == 2012) %>%
  arrange(desc(Rate)) %>%
  pull(Geo)

dat_long <- dat_long %>%
  mutate(Geo = factor(Geo, levels = order_2012))


# Define a colourblind-safe palette 
# Okabe-Ito colours are used as I used them in python. Could use Rcolorbrewer
# Here as well but felt I'd keep it similar. 

okabe_ito <- c(
  "2008" = "#0072B2",  # blue
  "2009" = "#E69F00",  # orange
  "2010" = "#009E73",  # bluish green
  "2011" = "#CC79A7",  # reddish purple
  "2012" = "#D55E00"   # vermillion
)


# Build the grouped bar chart 
# Note in my complete originality that I called the plot p. 
# This was done because it short to type and saves me a headache when mistakes
# happen. Thank you for understanding :)

p <- ggplot(dat_long, aes(x = Geo, y = Rate, fill = factor(Year))) +
  # position = "dodge" places the 5 yearly bars side by side within each region.
  geom_col(position = position_dodge(width = 0.8),
           width = 0.7, colour = "white", linewidth = 0.2) +
  scale_fill_manual(values = okabe_ito, name = "Year") +
  # Start the y-axis at 0 (honest bar lengths) and give a little headroom.
  scale_y_continuous(expand = expansion(mult = c(0, 0.05))) +
  labs(
    title    = "Assaults against a peace officer: provinces vs. Canada, 2008-2012",
    subtitle = "Rate per 100,000 population. Territories excluded (off-scale).",
    x        = NULL,
    y        = "Rate per 100,000 population",
    caption  = paste0(
      "Source: Ontario Data Catalogue / Statistics Canada, Violent Crime Rates (2008-2012).\n",
      "Note: a 2010 coding change may overstate peace-officer assaults that year; compare 2010 with caution."
    )
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title    = element_text(face = "bold", size = 14),
    plot.caption  = element_text(size = 8, colour = "grey40", hjust = 0),
    panel.grid.major.x = element_blank(),     # vertical gridlines add clutter
    panel.grid.minor   = element_blank(),
    legend.position = "top",
    axis.text.x = element_text(angle = 0)
  )

# Display the plot.
print(p)


# Save PNG 

ggsave(
  filename = "peace_officer_assaults_by_province_2008_2012.png",
  plot     = p,
  width    = 11, height = 6.5, dpi = 300, bg = "white"
)

cat("Saved: peace_officer_assaults_by_province_2008_2012.png\n")


# Reproducibility note 
sessionInfo()   # records R + package versions for full reproducibility