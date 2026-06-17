For each visualization, describe and justify: 

    > What software did you use to create your data visualization?

    R, using the tidyverse which has readr to load the CSV, dplyr and tidyr to filter and reshape the data, and ggplot2 to build the chart. I worked in RStudio so the data wrangling, plot, and commentary stay together in one reproducible script.

    > Who is your intended audience? 
    A general public and policy-interested audience. Citizens, journalists, and students who want to compare how often peace officers are assaulted across the provinces, without needing a criminology background. Anyone who is interested in the statistic really, as I find it to just be an interesting read. 
    
    > What information or message are you trying to convey with your visualization? 

    That the rate of assaults against a peace officer varies substantially across provinces. Saskatchewan and Manitoba run consistently high, while Ontario sits below the national average and that 2010 shows an anomalous spike across nearly every province. The chart invites comparison against the Canadian total as a benchmark. It also I belive shows how each province contributes to the average. 


    > What aspects of design did you consider when making your visualization? How did you apply them? With what elements of your plots? 

    For our perceptual dimension, I encoded rates as bar length on a common zero baseline (the encoding people read most accurately) and grouped the five yearly bars within each province so both cross-province and across-year comparisons are possible. Geographies are ordered by their 2012 rate rather than alphabetically, giving a clear visual ranking.
    For our aesthetic dimension, I used theme_minimal, removed vertical gridlines and minor gridlines, and added thin white borders between bars to reduce clutter so the data leads. Colours are also picked importantly this time and contribute both to the story and the aesthetic of the plot. 
    For our substantive dimension, I used rates per 100,000, not raw counts, so populations of very different sizes compare fairly; I stated units in the axis and subtitle; and I put the 2010 data caveat directly in the caption so the chart is honest and self-contained.
    
    > How did you ensure that your data visualizations are reproducible? If the tool you used to make your data visualization is not reproducible, how will this impact your data visualization? 

    The whole pipeline is code read the CSV (skipping the title row), filter to the one violation and the province-level geographies, pivot to long format, and plot with no manual edits to the data.
    Also session info is included so you can see all the packages I used, my computer and what everything was coded on.  

    > How did you ensure that your data visualization is accessible?  

    I used the Okabe–Ito palette again here, which is engineered to stay distinguishable under the common forms of colour-vision deficiency, and suited to nominal categories like distinct years. Colour isn't the sole carrier of meaning as bar height encodes the rates, and the axis labels and legend identify everything independently of colour.
    
    > Who are the individuals and communities who might be impacted by your visualization?  

    Peace officers and the communities they work in have a direct stake, as do provincial policymakers, since cross-province comparisons can shape funding and policy narratives. There's a real risk of misreading this data as well (which we should be careful to do). A high rate could be used to stigmatize a province or its communities, when differences may reflect reporting practices, enforcement patterns, or the 2010 coding artifact rather than underlying behaviour which is mentioned in the data source.
    
    > How did you choose which features of your chosen dataset to include or exclude from your visualization? 

    My visualization was carried as a comparison of all provinces and the total of Canada for one type of offense (assaults against peace officer). I do not include the three territories (Nunavut, Northwest Territories, and Yukon) because the rate of peace officer assaults in all three territories is extremely disproportionately high (i.e. Nunavut — 420 per 100K vs. 35 across Canada), and because including these three territories in the chart would create such overwhelming totals that the provinces would not be legible. I indicated this exclusion in the subtitle and did not try to cover it up. I also do not include the city Results for Ontario because I wanted the provincial comparison to be strictly like-for-like. Furthermore, all five years of data base years (2008 - 2012) were included in this research (including 2010), while 2010 was flagged for the known coding error when the database was compiled.
    
    > What ‘underwater labour’ contributed to your final data visualization product?

    There is the labour of the crimes being reported and these reports being maintained and logged over the years for this specific crime. Same as before there is the government bodies who compile this data across provinces and territories and keep the data clean and usuable for everyone who needs. On my end it is the coding and inspection of the data that goes into making the plot.