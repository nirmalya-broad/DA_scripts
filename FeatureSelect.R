library(docopt)
library(DecisionAnalysis)


'Selection of features (probes) from NanoString data

Usage: FeatureSelect.R -i <infile> -o <outdir> [--feature_count <feature_count> --use_all --no_probe_anno --sep <sep>]

options:
  -i <infile> --infile <infile>
  -o <outdir> --outdir <outdir>
  --feature_count <feature_count> [default: 10]
  --sep <sep> [default: comma]
  --use_all
  --no_probe_anno' -> doc

opts <- docopt(doc)
print(opts)

infile <- opts$infile
outdir <- opts$outdir
feature_count <- as.numeric(opts$feature_count)
sep <- opts$sep
use_all <- opts$use_all
no_probe_anno <- opts$no_probe_anno

print(paste0("infile: ", infile))
print(paste0("outdir: ", outdir))
print(paste0("feature_count: ", feature_count))
print(paste0("sep: ", sep))
print(paste0("use_all: ", use_all))
print(paste0("no_probe_anno: ", no_probe_anno))

lsep <- NA
if (sep == "comma") {
    lsep = ","
} else if (sep == "tab") {
    lsep = "\t"
} 

featureSelect(infile = infile, outdir = outdir, feature_count = feature_count, use_all = use_all, no_probe_anno = no_probe_anno, sep = lsep)
