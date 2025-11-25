# Load packages required to define the pipeline:
library(targets)
library(tarchetypes)

# Set target options:
tar_option_set(
  packages = c(
    "readr",
    "tibble"
  ),
  format = tar_format_nanoparquet()
)

# Run the R scripts in the R/ folder:
tar_source()

# Targets:
list(
  tar_file_read(
    data_redcard,
    "data-raw/CrowdstormingDataJuly1st.csv",
    read = read_csv(
      !!.x,
      col_types = cols(
        .default = col_integer(),
        player_short = col_character(),
        player = col_skip(),
        club = col_character(),
        league_country = col_character(),
        birthday = col_date(format = "%d.%m.%Y"),
        position = col_character(),
        photo_id = col_skip(),
        rater1 = col_double(),
        rater2 = col_double(),
        alpha_3 = col_character(),
        mean_iat = col_double(),
        se_iat = col_double(),
        mean_exp = col_double(),
        se_exp = col_double()
      ),
      name_repair = janitor::make_clean_names
    )
  )
)