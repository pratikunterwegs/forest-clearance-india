# WithdrawEIA2020
This repository contains data, scripts and figures pertaining to environmental clearances (as obtained from the PARIVESH portal hosted by the MOEF&amp;CC)

*The first two paragraphs have been copied from this handy resource, the [EIA Toolkit](https://coda.io/d/SAVE-EIA-TOOLKIT_dWwI4b9FeBu/EIA-Toolkit_suyhn#_luB6C). Please visit this link to know more about what you can do to help #WithdrawEIA2020*

## What is EIA? Why is our EIA being diluted ?

To provide short term economic stimulus at the expense of long term  ecological resource depletion the Indian Govt is changing the Environmental Impact Assessment (EIA) a process/tool of evaluating the likely environmental impacts of a proposed project or development which was created by the World Bank for evaluating new industrial projects in a world of real time climate crisis.  

## Blurb on what’s going on  

*The EIA notification is an important set of guidelines and safeguards for environmental and public welfare. The currently proposed Draft EIA 2020 by the government systematically dilutes these safeguards to favour industrial projects and their ease of doing business. If it came to pass, vast tracts of the country's wilderness will be quickly taken over by corporates, while public and local communities will have very little say in the matter. We live at a time of climate breakdown. The present pandemic has shown us the stark social inequities which exist in our society. The cause of the Covid pandemic is also being strongly linked to rampant loss of habitats, which buffer zoonotic diseases. If the proposed EIA draft came into force, these circumstances in India will worsen far more*
ー it is being forced by MOEFCC, Environment Minister, Coal Lobby, PMOs Office, Industrialists  

## So what's this repository about?

Well, we decided to obtain and analyze the raw data on clearances from [PARIVESH](http://parivesh.nic.in/), a portal hosted by the MOEF&CC. A summary of the analysis follows. However, all data, figures and scripts emerging from the exploratory data analysis can be obtained from the respective folders.

## Data on Environmental Clearances

Environmental clearance data is organized under three sub-headings on the PARIVESH portal, hosted by the MOEF&CC. These include: Environmental, Forests and Wildlife. The data for Forests and Wildlife are quantifiable, while the data for 'Environmental clearances' does not have any quantifiable information associated with it. In other words, these proposals lack any information on the area of forests stated to be cleared. At present, data for forests are available as an excel file on the portal (albeit, after much digging and searching). Data for Wildlife clearances was not available as an excel file and this information *is currently being scraped* from their website. 

All analysis was performed through the R programming environment. Please feel free to edit and use the code as you please. The data used for this purpose is available through the 'Data' folder. *This folder will be updated as more data is collected*

### Forest Clearances

The data on forest clearances has been stored in 5 separate excel files:

1. All data prior to 2014
2. Data post 2014 is subdivided by the MOEF&CC into:  
    a) Allocation of fresh forest land (Form-A)	   
    b) Application Under Section 2(iii)	     
    c) Renewal of lease (Form-B)         	  
    d) Prospecting of Minerals (Form-C)    

For the sake of the analysis, we clubbed the above four categories into a single category on clearances post 2014. Secondly, the analysis only includes area in hectares across those proposals that have been categorized as currently approved / pending to be approved (*See code for further details*).

**Between 1975 and 2014, 84.68% of proposals submitted to the MOEF&CC were approved or pending to be approved. Over 21,63,215 hectares of forests were approved / pending approval to be cleared.**  

**Between 2014 to 2020, 99.3% of proposals submitted to the MOEF&CC were approved or pending to be approved. Over 14,82,247 hectares of forests were approved/pending approval to be cleared.**  

Prior to 2014, majority of forest land was approved towards encroachments and mining assicated projects

![Area by Category pre 2014](https://github.com/vjjan91/WithdrawEIA2020/blob/master/Figures/pre2014_Area_vs_Category.png)

Post 2014, majority of forest land was approved towards mining projects

![Area by Category post 2014](https://github.com/vjjan91/WithdrawEIA2020/blob/master/Figures/post2014_Area_vs_Category.png)

Prior to 2014, large chunks of forested land were approved for clearing in the years 1984, 1989, 1995 and 2006

![Area by Year pre 2014](https://github.com/vjjan91/WithdrawEIA2020/blob/master/Figures/pre2014_Area_by_Year.png)

Post 2014, large chunks of forested land were approved for clearing in the year 2016. Notice, that **the amount of forest area approved for clearing in 2016 was more than double the amount of forest area approved for clearing in 2006 alone.** 

![Area by Year post 2014](https://github.com/vjjan91/WithdrawEIA2020/blob/master/Figures/post2014_Area_by_Year.png)

Prior to 2014, a large area of forests were approved/pending to be cleared in Madhya Pradesh followed by Arunachal Pradesh - two states that possess an astounding level of biodiversity.

![Area by State pre 2014](https://github.com/vjjan91/WithdrawEIA2020/blob/master/Figures/pre2014_Area_by_State.png)

Post 2014, Andhra Pradesh and Telangana are stated to lose the most chunks of forest land. 

![Area by State post 2014](https://github.com/vjjan91/WithdrawEIA2020/blob/master/Figures/post2014_Area_by_State.png)

**The analysis suggests that there has been a significant increase in the rate of environmental clearances for the forest category alone since 2014. Further, the rate of rejection for proposals since 2014 is less than 1%. In addition, the proportion of area stated to be cleared since 2014 is over 68% of what was stated to be cleared between 1975 and 2014.**

*For further analysis on area lost by category by state across two time periods, please visit the figures folder*



