library(rword2vec)
setwd('/home/ben/Documents/github/nlp_foot')

model <- word2vec(train_file = "/home/ben/Documents/data/text_blog.txt",output_file = "/home/ben/Documents/data/text_blog.bin",binary=1)
vocab_count(file_name="/home/ben/Documents/data/text_blog.txt",vocab_file="/home/ben/Documents/data/vocab.txt",min_count = 20)

dist <- distance(file_name = "/home/ben/Documents/data/chap.bin",search_word = "marseille",num = 20)


word_analogy(file_name = "/home/ben/Documents/data/fasttext/cc.fr.300.bin",search_word = "le",num = 20)

#frWac2Vec
word_analogy(file_name = "/home/ben/Documents/data/word2vec/frWac_no_postag_phrase_500_cbow_cut10.bin",
             search_word = "roi reine homme",num = 20)

word_analogy(file_name = "/home/ben/Documents/data/word2vec/frWac_non_lem_no_postag_no_phrase_200_skip_cut100.bin",
             search_word = "roi reine homme",num = 20)

distance(file_name = "/home/ben/Documents/data/word2vec/frWac_no_postag_phrase_500_cbow_cut10.bin",
             search_word = "paris",num = 20)

distance(file_name = "/home/ben/Documents/data/word2vec/frWac_non_lem_no_postag_no_phrase_200_skip_cut100.bin",
         search_word = "paris",num = 20)

bin_to_txt("/home/ben/Documents/data/word2vec/frWac_no_postag_phrase_500_cbow_cut10.bin",
           "/home/ben/Documents/data/word2vec/frWac_no_postag_phrase_500_cbow_cut10.txt")


bin_to_txt("/home/ben/Documents/data/word2vec/frWac_non_lem_no_postag_no_phrase_200_skip_cut100.bin",
           "/home/ben/Documents/data/word2vec/frWac_non_lem_no_postag_no_phrase_200_skip_cut100.txt")

# read embedding, dim 500, 1081995 words
lines <- readLines("/home/ben/Documents/data/word2vec/frWac_no_postag_phrase_500_cbow_cut10.txt",n=100)

embeddings_index <- new.env(hash = TRUE, parent = emptyenv())

for (i in 1:length(lines)) {
  line <- lines[[i]]
  values <- strsplit(line, " ")[[1]]
  word <- values[[1]]
  embeddings_index[[word]] <- as.double(values[-1])
}

cat("Found", length(embeddings_index), "word vectors.\n")

