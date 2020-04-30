get_historic_tweets <- function()
{
  files <- file.info(list.files("data/", full.names = TRUE))

  most_recent_file_str <- rownames(files)[which.max(files$mtime)]

  most_recent_file <- readRDS(most_recent_file_str)

  min_id <- min(most_recent_file$status_id)

  charge <-
    rtweet::get_timeline(user = "elhotzo", n = 3200L, max_id = min_id)

  saveRDS(object = charge, file = paste("data/charge_bis_", as.character(zoo::as.Date(max(charge$created_at))), ".RDS"))
}
