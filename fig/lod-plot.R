library(qtl2)
iron <- read_cross2(file = system.file("extdata", "iron.zip", package="qtl2geno") )
map <- insert_pseudomarkers(map=iron$gmap, step=1)
pr <- calc_genoprob(cross=iron, map=map, error_prob=0.002)
Xcovar <- get_x_covar(iron)
out <- scan1(genoprobs = pr, pheno = iron$pheno, Xcovar=Xcovar)
png(filename = "lod-plot.png", width = 600, height = 600)
plot_scan1(out, map = map, lodcolumn = "liver")
dev.off()