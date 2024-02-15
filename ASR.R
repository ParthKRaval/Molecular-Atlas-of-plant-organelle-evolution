x<-read.csv('input.csv',row.names=1) ##input csv with a single colum, to be looped across column for a large scale ASR
csvname <- colnames(x)
x<-as.matrix(x)
#get ASR
pdf(paste(csvname, "ASR.pdf"), width = 10, height = 20)
col=c("black","darkolivegreen4")
tree <- read.tree("SpeciesTree_rooted_node_label_MAD_Rooted_branch_ordered_increasing_branchlength.txt")
tree<-rotateNodes(tree,"all")
plotTree(tree,fsize=0.8,ftype="i",cex = 5.5)
tree <- phytools::rotateNodes(tree, "all")
fitER<-ace(x,tree,model="ER",type = "discrete")
nodelabels(node=1:tree$Nnode+Ntip(tree),pie=fitER$lik.anc,piecol=col,cex=0.55)
dev.off()
