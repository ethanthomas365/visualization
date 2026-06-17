For each visualization, describe and justify: 
   
    > What software did you use to create your data visualization?
    
    I used python to create the first visualization mainly using pandas and matplotlib.         

    > Who is your intended audience? 
    
    the audience is for those who are interested in environmental impact of Co2 and the emmission by all facilities across the years. Its for those who want to keep track of trends of emmissions to see how we are doing with overall carbon footprint as a country.

    > What information or message are you trying to convey with your visualization? 
    I am just trying to convey that the reported facility-level CO₂ emissions in Ontario fell substantially from a 2010 peak (~54 Mt) to a low around 2017 (~37 Mt), dipped again during the 2020 pandemic, and have partially rebounded to ~44 Mt by 2023 — a net decline over the period, but not a steady downward trend. The chart pushes back on a simple "emissions just keep rising" or "we've solved it" narrative; the real shape is decline-then-partial-rebound

    > What aspects of design did you consider when making your visualization? How did you apply them? With what elements of your plots? 
    
    Here's where I'd lean on the perceptual/aesthetic/substantive framing. For perceptual, I encoded the quantity as bar length on a common baseline at zero, the encoding humans read most accurately so year-to-year comparisons are easy. Value labels sit above each bar so exact figures don't have to be estimated off the axis. For the aesthetic: I removed the top and right spines and used light horizontal gridlines so the data, not the chart frame, draws the eye. One consistent colour avoids a distracting rainbow. In terms of being substantive I highlighted 2020 in a contrasting colour to flag the pandemic dip, and stated units (megatonnes CO₂e) and the data source directly on the figure so the chart is honest and self-contained.

    > How did you ensure that your data visualizations are reproducible? If the tool you used to make your data visualization is not reproducible, how will this impact your data visualization? 

    The code is reproducible as it is all in pandas and matplotlip and will be uploaded to the github to be reproducible. The issue is where the relative path of the data is but I am unsure how to fix that without the dataset already being on github, so outside of that, I believe my graph and code is fully reproducible. 
    
    > How did you ensure that your data visualization is accessible? 
    
    I used a colourblind-safe palette (Okabe–Ito blue and vermillion). I didn't rely on colour alone to carry meaning. Everything in the plot itself should be clean, and if it were to be printed in black and white I believe the same message would carry. Numbers are present and legible. 
    
    > Who are the individuals and communities who might be impacted by your visualization?  

    Communities living near major industrial emitters who are disproportionately working-class and, in some Ontario regions, Indigenous and racialized communities who continue to bear the local health burden of these emissions, so they have a stake in how this data is framed. Policymakers and the facilities themselves are also affected, since aggregate charts like this shape public pressure and regulation
    
    > How did you choose which features of your chosen dataset to include or exclude from your visualization? 

    I focused on a single variable — non-biomass CO₂ — aggregated to the provincial level per year. I deliberately excluded biogenic (biomass) CO₂, because GHG accounting convention reports it separately as part of the short-term carbon cycle; including it would overstate the net warming contribution. I also excluded the other gases (methane, N₂O, etc.) to keep one clear message, and didn't break out by facility or sector here. An important caveat I'd note: the number of reporting facilities grew over the period as reporting thresholds changed, so totals aren't a perfectly like-for-like comparison year to year.
    
    > What ‘underwater labour’ contributed to your final data visualization product?

    The people who collected the data year in and year out, the ministry staff compiling and pubkishing the data for all to have access. For the work I did it's taking this data given to me by others and telling a hopefully compelling and real story that is not in any way misleading. 
