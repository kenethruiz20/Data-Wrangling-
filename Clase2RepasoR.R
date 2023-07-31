#Data Frames
df <- data.frame(
  col1= c("This", "is", "a", "vector", "of", "strings"),
  col2 = 1:6,
  col3 = letters[1:6],
  stringsAsFactors = FALSE
)
df[,2]
df$col2

str(df)
names(df)
head(df, 10)
nrow(df)
ncol

colSums(is.na(df))


df_2 <- rbind(df, c("!", NA, NA))

df_2[!is.na(df_2$col3),]

#Functions
find_mean <- function(x){
  return(sum(x)/length(x))
}
vec <- 1:10
find_mean(data.frame(col1=1:10, col2=5:14))

data <- data.frame(
  a = 1:10,
  b = sample(c("GT", "US", "CA"), size = 10, replace = FALSE)
)

find_sample<- 
  
generate_df<- function (x) { return
  data.frame(
    a = sample(letters, size = 10, replace = TRUE),
    
  )}

