**Urban Growth Modeling in the Denver Area** 

Johnathan Clementi and Henry Feinstein CPLN 675 Homework 5 

May 10, 2022 

**Introduction** 

This report presents the findings of an urban growth model for the Denver Regional Council of Governments (DRCOG), a group of nine counties in the Denver area. This area is experiencing consistent population growth which has contributed to sprawl and the destruction of vulnerable landscapes such as forests and wetlands. In order to better understand how these issues might be avoided in the future, the model presented here predicts the quantity and location of development over the next ten years. These findings can be leveraged in DRCOG’s upcoming comprehensive planning process to help mitigate sprawl.  

![](README_imgs/Aspose .Words.91f65cdf-46fa-4ab1-ae6c-38dfaca31566.001.jpeg)

**Model Structure and Key Variables** 

In this report, new development is modeled by dividing the DRCOG region into evenly-sized cells in a grid or “fishnet” pattern. Each cell is given a value for each of the variables included in the model. The model’s dependent variable is whether a given cell changed land cover type (which, for our purposes, almost always means the cell changed from “undeveloped” to “developed”) between two time periods–2009 and 2019. The model returns a probability that a given cell changed land cover and uses the following independent variables to make that prediction: 

Land cover in 2009: The existing land cover of a cell is a strong indicator of whether it is likely to change status. The model includes variables indicating whether a cell was wetlands, farm, forest, or other undeveloped land in 2009.  

![](README_imgs/Aspose .Words.91f65cdf-46fa-4ab1-ae6c-38dfaca31566.002.jpeg)

Spatial lag of development: “Spatial lag” is a term that refers to the relationship between a cell and its neighboring cells. The spatial lag of development demand for one cell captures the development demand of the cells nearby.  

![](README_imgs/Aspose .Words.91f65cdf-46fa-4ab1-ae6c-38dfaca31566.003.jpeg)

Population change: We pulled population at the Census tract level for both 2009 and 2019 and distributed it proportionally among the fishnet cells. The model includes population change per cell between the two years, anticipating that population increases lead to more development. 

![](README_imgs/Aspose .Words.91f65cdf-46fa-4ab1-ae6c-38dfaca31566.004.jpeg)

Distance to highways: The model includes the distance to the closest highway for each cell, given that development often appears around existing infrastructure.  

![](README_imgs/Aspose .Words.91f65cdf-46fa-4ab1-ae6c-38dfaca31566.005.jpeg)

Distance to rail: Similar to highways, the model includes the distance of each cell to the closest rail line.  

![](README_imgs/Aspose .Words.91f65cdf-46fa-4ab1-ae6c-38dfaca31566.006.jpeg)

**Model Development and Validation** 

Using the variables presented above, our model predicts the likelihood of a given cell changing land cover category between 2009 and 2019. The next step is to validate the model by comparing its predictions to the actual land cover changes over that time period. This process gives a sense of the model’s overall accuracy and generalizability to different scenarios.  

![](README_imgs/Aspose .Words.91f65cdf-46fa-4ab1-ae6c-38dfaca31566.007.jpeg)

The table above presents the regression results of the model, where every independent variable is a statistically significant predictor. One key takeaway is that cells with wetlands, forest, and farm in 2009 were less likely to become developed in 2019; this makes sense given that many of these “natural” cells are in parks or otherwise difficult to develop. Population increases and proximity to existing development and highways, on the other hand, are associated with a greater likelihood of development.  

![](README_imgs/Aspose .Words.91f65cdf-46fa-4ab1-ae6c-38dfaca31566.008.jpeg)

To evaluate the model’s accuracy, a threshold must be decided at which the probability of a cell being developed is high enough to be considered an official “developed” prediction. The chart above plots the probabilities of development for cells that *actually* developed between 2009 and 2019 (in dark blue) and cells that didn’t (in light blue). We can see that the model predicts the two categories differently, giving cells that actually developed generally higher probabilities. We set the prediction threshold at 0.3 given that this is where the two categories intersect on this plot. Using this threshold, we can calculate that the model performs well, achieving 80% accuracy overall. The model, however, is better at predicting when cells will not change in land use (Specificity: 81%) versus predicting when cells will change in land use (Sensitivity: 76%).  

To get a sense of how the model performs across different areas, an approach called “spatial cross-validation” is used. This method cycles through different areas–in our case, the nine DRCOG counties–holding one area out and training the model’s predictions on the remaining data. The model then predicts for the holdout region; if it predicts well across all areas, the model is considered generalizable.  

![](README_imgs/Aspose .Words.91f65cdf-46fa-4ab1-ae6c-38dfaca31566.009.png)

The table above shows that the model is consistent across all counties except Denver. This makes sense given that Denver is uniquely dense and urban while the other counties are suburban or rural and more similar to each other than to the large city. 

![](README_imgs/Aspose .Words.91f65cdf-46fa-4ab1-ae6c-38dfaca31566.010.jpeg)The model’s predictions are unsurprising, following the general patterns of development seen in the training period: highways, rail, and existing development strongly inform where new development is likely to happen. In the second scenario, the model predicts slightly more development south of Denver where the new highway was inserted.  

**Predicting for 2029: Two Scenarios** 

The trained model can now be used to predict which cells will become developed in 2029. Here, two scenarios are presented: one in which population increases based on projections published by DRCOG; and a second with the same population projections and an added infrastructural change, which is a new beltway connecting towns to the south of Denver including Roxborough Park, Castle Pines, and Parker. This infrastructural project was chosen given the lack of existing connections between these towns and the likelihood of development in this area in the next ten years. The next section details the methodology for deciding on the proposed locations of development under these two scenarios. 

**Allocation** 

Merely predicting which cells will develop has limited use, given that some cells cannot or should not be developed on. This final section presents an allocation schema which takes into account the model’s results along with other factors to suggest which fishnet cells should be developed to accommodate the increasing population in the coming decade. The number of cells to allocate was determined by dividing the 2019 population by the number of developed cells in 2019, then dividing the projected change in population in 2029 by that “per-cell” rate. This calculation resulted in needing to allocate 1,253 cells (5,824 acres) to new development. To determine which cells should be allocated, we normalize, weight, and add the following values to create an allocation score: 

Development demand: The model’s probability that a cell will be developed. 

Distance to sensitive regions: The distance of each cell to forest or wetland. The score seeks to maximize distance from these vulnerable natural areas. 

Distance to highways: The distance of each cell to existing highways. The score seeks to minimize distance to highways, since it is efficient to build new development near existing infrastructure.  

Spatial lag of development: The distance of each cell to the closest already-developed cell. Similar to highways, the score seeks to minimize the distance between new development and existing development.  

After the cells are scored, cells that are “impossible” to develop because they are sensitive land or already developed are removed. The following maps present the remaining  top 1,253 cells by allocation score for the two planning scenarios:  

![](README_imgs/Aspose .Words.91f65cdf-46fa-4ab1-ae6c-38dfaca31566.011.jpeg)

![](README_imgs/Aspose .Words.91f65cdf-46fa-4ab1-ae6c-38dfaca31566.012.jpeg)

The model clearly puts a high value on developing near highways, as the strip of new development to the east shows. The model also suggests a lot of development should happen in and around Denver on cells surrounded by existing development. In the second scenario, the model suggests allocating slightly more cells near the new highway compared to the first scenario. In general, the model’s results resemble the patterns of development seen in the Denver area today.  

**Conclusion** 

Unsurprisingly, the model presented here reflects the history of development in the Denver metro area. If current practices continue, Colorado is likely to see a worsening problem of sprawl around its capital, threatening to disrupt ecological systems and encourage unsustainable, car-dependent living. This report can be used to inform how local governments might leverage zoning and policy strategies to reduce sprawl while accommodating future population growth.  
