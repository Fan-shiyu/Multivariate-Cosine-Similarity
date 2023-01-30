setGeneric('venn_plot', function(obj,...)  standardGeneric('venn_plot'))
setMethod('venn_plot', signature(obj='proj'),
          function(obj, area1=1, area2=1, cat.cex=1.5, cex=1.6, 
                   col=grey(0.2,0.7), fill=c("Red","Yellow"),
                   label=FALSE, title=FALSE, anno=FALSE,...){
          
          plot.new()
          VennDiagram::draw.pairwise.venn(area1=area1, area2=area2, 
          cat.cex=cat.cex, cex=cex, cross.area=round(similarity(obj),2), 
          col=col, fill=fill, 
          category=if(label) {c('data1','data2')} else {''},...)
        
          if (title){
              title(main='Similarity between data1 and data2', cex.main=1.4)
              if (n_loadings(obj)==1)
              mtext('--based on PC1', line=0.1, cex=1.3)
              if (n_loadings(obj)==2)
              mtext('--based on PC1 and PC2', line=0.1, cex=1.3)
              if (n_loadings(obj)==3)
              mtext('--based on PC1, PC2 and PC3', line=0.1, cex=1.3)
         }
              
         if (anno){
             if (n_loadings(obj)==1)
             mtext('Similarity equals the length of the projection,  
where the projection is from vector2 (PC1 in data2) to vector1 (PC1 in data1)', 
      side=1, line=2.6, cex=.9)
             if (n_loadings(obj)==2)
             mtext('Similarity equals the square root of the area of the projected plane,
where the projection is  from plane2 (PC1 and PC2 in data2) to plane1 (PC1 and PC2 in data1)', 
      side=1, line=2.6, cex=.9)
             if (n_loadings(obj)==3)
             mtext('Similarity equals the cube root of the volume of the projected cube,
where the projection is from cube2 (PC1, PC2, PC3 in data2) to cube1 (PC1, PC2, PC3 in data1)', 
      side=1, line=2.6, cex=.9)
        }       
})
