library(docopt)
library(DecisionAnalysis)

'Validation of features (probes) on new Nanostring data

Usage: Validate.R -t <train_file> -v <validate_file> -o <outdir> -p <prefix> [--feature_count <feature_count> --sep <sep>]

options:
  -t <train_file> --train_file <train_file>
  -v <validate_file> --validate_file <validate_file>
  -o <outdir> --outdir <outdir>
  -p <prefix> --prefix <prefix>
  --feature_count <feature_count> [default: -1]
  --sep <sep> [default: comma]' -> doc

opts <- docopt(doc)
print(opts)

train_file <- opts$train_file
validate_file <- opts$validate_file
outdir <- opts$outdir
prefix <- opts$prefix
sep <- opts$sep
feature_count <- as.numeric(opts$feature_count)

print(paste0("train_file: ", train_file))
print(paste0("validate_file: ", validate_file))
print(paste0("outdir: ", outdir))
print(paste0("prefix: ", prefix))
print(paste0("feature_count: ", feature_count))
print(paste0("sep: ", sep))

lsep <- NA
if (sep == "comma") {
    lsep = ","
} else if (sep == "tab") {
    lsep = "\t"
}

dir.create(outdir)
logfile <- paste0(outdir, "/", prefix , "_log.txt")
sink(logfile)
validate(train_file = train_file, validate_file = validate_file, outdir = outdir, prefix = prefix, feature_count = feature_count, sep = lsep)
sink()
