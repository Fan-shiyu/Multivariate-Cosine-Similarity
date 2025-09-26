# Multivariate Cosine Similarity: A Method for Comparing Dataset Similarities

[![R package](https://img.shields.io/badge/R_package-GitHub-276DC3?logo=R&logoColor=white)](https://github.com/Fan-shiyu/Multivariate-Cosine-Similarity)
[![Python package](https://img.shields.io/badge/Python_Package-GitHub-3776AB?logo=python&logoColor=white)](https://github.com/Fan-shiyu/adtpy)
[![Web App](https://img.shields.io/badge/Web_App-Live-orange?logo=google-chrome&logoColor=white)](https://5683wm-shiyu-fan.shinyapps.io/Multivariate_Cosine_Similarity/)

For the theoretical background of this method, please refer to: [Multivariate Cosine Similarity Research](https://researchspace.auckland.ac.nz/items/7c97b5ae-985c-43c7-9c65-705caa7ac853) 

## Tutorial

This is one **R** package which can be used to compare the similarity of two data sets. The method is based on projection, and it starts with the results of PCA (Principal Component Analysis). 

To install this package, please run:


```R
install.packages("devtools")
devtools::install_github('Fan-shiyu/adt')
```

### Data Simulation

Firstly, two similar data sets are simulated by adding some noise to a reference data set. Here the reference data set is [mtcars](https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/mtcars).


```R
library(adt)
```


```R
df1 <- mtcars
df2 <- simulation(df1, sd=0.6, seed=123)
```

### PCA

To run a PCA method, here the number of principle components requires to be defined, these PCs (principle components) will be used in the following analysis.

Function `get_loadings()` can be implemented to choose how many principle components(PCs) you need. One way is to through the cumulative proportion of variance explained. This function provides argument `explain` to determine the lower bound on the cumulative proportion of variance explained of PCs. 

In addition, you can set the number of PCs that you want, but it should be less than 3. Such as `n_loadings=3`, that means you want to reserve three PCs. By setting `scree_plot=TRUE`, a scree plot is drawn, and you can see the cumulative proportion of variance explained for each PC.


```R
# run pca for exch data sets
d1_PCs <- get_loadings(df1, n_loadings=3, scree_plot=TRUE)
d2_PCs <- get_loadings(df2, n_loadings=3, scree_plot=TRUE)
```

<img src="https://user-images.githubusercontent.com/57004009/215372926-e023ba7b-d060-49f8-b363-6c5105936985.png"  width="400" height="400">
<img src="https://user-images.githubusercontent.com/57004009/215372978-cc5398d7-fffc-4787-8302-bdf7e3423a42.png"  width="400" height="400">   


### Projection

Class 'proj' contains the information of projection. Function `proj()` can transform PCs into the class 'proj'. To run function `proj_compute()`, you can get the results of projection.


```R
proj3 <- proj(d1_PCs, d2_PCs)
proj3 <- proj_compute(proj3)
proj3
```


    $similarity
    [1] 0.7109389
    
    $n_loadings
    [1] 3
    
    $proj_coords
                 x           y         z
    p1  0.92479800  0.03732307 0.2179105
    p2 -0.09518999  0.82125470 0.4195420
    p3 -0.32169802 -0.01490284 0.3940878



`d1_PCs()` is applied to access the PCs in data1; `d2_PCs()` is applied to access the PCs in data2.

If you want to check the number of PCs, try `n_loadings()`. Note, if the number of PCs differs in the two data sets that you used, class 'proj' will only keep the smaller number of PCs. 

`proj_coords()` returns the coordinates of the projected vectors.
`length()` returns the lengths of the projected vectors.
`angles()` returns the angles between the projected vectors.
`similarity` returns the similarity of two data sets. 


```R
n_loadings(proj3)
```


3



```R
proj_coords(proj3)
```


<table class="dataframe">
<caption>A matrix: 3 × 3 of type dbl</caption>
<thead>
	<tr><th></th><th scope=col>x</th><th scope=col>y</th><th scope=col>z</th></tr>
</thead>
<tbody>
	<tr><th scope=row>p1</th><td> 0.92479800</td><td> 0.03732307</td><td>0.2179105</td></tr>
	<tr><th scope=row>p2</th><td>-0.09518999</td><td> 0.82125470</td><td>0.4195420</td></tr>
	<tr><th scope=row>p3</th><td>-0.32169802</td><td>-0.01490284</td><td>0.3940878</td></tr>
</tbody>
</table>



p1,p2,p3 are projected vectors from PC1，PC2，PC3 in data2 to data1. x,y,z are their coordinates in x-axis, y-axis and z-axis.


```R
lengths(proj3)
angles(proj3)
similarity(proj3)
```



<dl class=dl-inline><dt>p1_l</dt><dd>0.950857153562906</dd><dt>p2_l</dt><dd>0.927111585082811</dd><dt>p3_l</dt><dd>0.508936996617939</dd></dl>


<dl class=dl-inline><dt>p1_p2_deg</dt><dd>87.7868593909368</dd><dt>p1_p3_deg</dt><dd>116.006150215882</dd><dt>p2_p3_deg</dt><dd>67.084842441719</dd></dl>




0.710938857202577


Venn Diagram can be plotted to show data similarity.


```R
venn_plot(proj3, fill=c("Red","Yellow"), label=TRUE, title=TRUE, anno=TRUE)
```

<img src="https://user-images.githubusercontent.com/57004009/215373584-c80c28c9-e0fa-4609-833e-2876e278dbf4.png"  width="400" height="400">  

    


Run `proj_plot()` to plot the projection of PCs.

The projection for the first PC.


```R
d1_PCs <- get_loadings(df1, n_loadings=1)
d2_PCs <- get_loadings(df2, n_loadings=1)
proj1 <- proj(d1_PCs, d2_PCs)
proj1 <- proj_compute(proj1)
```


```R
proj_plot(proj1, arrow.col=c('#67a9cf','#ef8a62'), lwd=3.5, cex=1.2, 
          label=TRUE, anno=TRUE, title='Projection in 1D')
```

<img src="https://user-images.githubusercontent.com/57004009/215373610-23e97789-86da-4e0c-ba55-6f28fc11fcb7.png"  width="400" height="400">  

The projection for the first two PCs.


```R
d1_PCs <- get_loadings(df1, n_loadings=2)
d2_PCs <- get_loadings(df2, n_loadings=2)
proj2 <- proj(d1_PCs, d2_PCs)
proj2 <- proj_compute(proj2)
```


```R
proj_plot(proj2, arrow.col='#e41a1c98', pol.col='#e41a1c20',
          label=TRUE, anno=TRUE, title='Projection in 2D')
```

<img src="https://user-images.githubusercontent.com/57004009/215373632-1cd2792f-6b03-4cb6-93ec-a94d7972e61a.png"  width="400" height="400">  

The projection for the first three PCs.


```R
proj_plot(proj3, edge.col='#6731f610', arrow.col='#6731f650', 
          label=TRUE, anno=TRUE, title='Projection in 3D')
```

<img src="https://user-images.githubusercontent.com/57004009/215373660-10b0c06e-b8b0-4d01-89f3-9d7f92297a84.png"  width="400" height="400">      


### Some Plots for Data Exploration

Here are some functions to visualize the relationships between PCs.

Run `pair_density_plot()` to plot paired density plot.


```R
pair_density_plot(proj3, cols=c(2,'blue'), lwd=3, xlim=c(-1,1), ylim=c(-1,2),
                  legend=TRUE, title='Density Plot')
```

<img src="https://user-images.githubusercontent.com/57004009/215373676-4ea519ba-2527-4533-a718-7218cf79cdd4.png"  width="400" height="400">   



Run `pair_correlation_plot()` to plot regression scatter plot.


```R
pair_correlation_plot(proj3,  legend=TRUE, point.col=1, line.col='blue', 
                      title='Data Correlation')
```

<img src="https://user-images.githubusercontent.com/57004009/215373691-221cc027-3791-414d-8f27-fb9ab762ddcb.png"  width="400" height="400">   


Run `pair_boxplot()` to plot paired boxplot.


```R
pair_boxplot(proj3, cols=c('#fbb4ae','#b3cde3'), title='Box Plot', legend=TRUE,
             legend.text=c('data1','data2'), points=TRUE)
```


<img src="https://user-images.githubusercontent.com/57004009/215373716-4b48a5b7-8d85-4930-9980-924ad4ac72a8.png"  width="400" height="400">       
    


Run `pair_vioplot()` to plot paired violin plot.


```R
pair_vioplot(proj3, cols=3:4, title='Violin Plot', legend=TRUE,
             legend.text=c('data1','data2'))
```

<img src="https://user-images.githubusercontent.com/57004009/215373732-c19dfc93-fb2a-4e92-a51f-6d663c505e33.png"  width="400" height="400">    
    
### Summary  

The **`adt`** package offers a complete workflow for comparing the similarity of two datasets using a projection-based approach. It allows users to extract principal components, project them between datasets, and compute similarity scores through cosine-based metrics. In addition to numerical outputs such as similarity values, vector lengths, and angles, the package provides a variety of visualization tools including scree plots, Venn diagrams, projection plots (1D/2D/3D), and exploratory plots such as density, correlation, box, and violin plots, making it straightforward to assess dataset similarity both quantitatively and visually.  

