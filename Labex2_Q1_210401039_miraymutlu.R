
#??zellik 1:

install.packages("httr")
library(httr)

# SPOTIFY_ID ve SPOTIFY_SECRET environment ayarlamak
Sys.setenv(SPOTIFY_ID = "fda3d042c7314aafb35219332ac45d89")
Sys.setenv(SPOTIFY_SECRET = "8da88c6359d74d0493d082db3eafe45a")

# Ard??ndan, fonksiyonu
library(httr)

spotify_token <- function() {
  # Spotify API token alma URL
  token_url <- "https://accounts.spotify.com/api/token"
  
  # Spotify uygulama bilgileri environment variable'lardan alınıyor
  client_id <- Sys.getenv("SPOTIFY_ID")
  client_secret <- Sys.getenv("SPOTIFY_SECRET")
  
  if (client_id == "" || client_secret == "") {
    stop("SPOTIFY_ID ve SPOTIFY_SECRET environment variable'larını ayarlayın.")
  }
  
  # Token alma isteği için body
  body <- list(
    grant_type = "client_credentials",
    client_id = client_id,
    client_secret = client_secret
  )
  
  # Token alma isteği g??nderme
  response <- POST(
    url = token_url,
    body = body,
    encode = "form",
    add_headers("Content-Type" = "application/x-www-form-urlencoded")
  )
  
  # HTTP status code'u alma
  status_code <- status_code(response)
  
  # Token değerini alma
  token <- content(response)$access_token
  
  # Bearer token stringini oluşturma
  bearer_token <- paste("Bearer", token)
  
  # Sonuçlar liste olacak
  result <- list(
    status_code = status_code,
    token = bearer_token
  )
  
  return(result)
}

# Kullanım 
token_result <- spotify_token()
print(token_result)


