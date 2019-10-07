# Load software libraries
library(readr)
library(jsonlite)

# Load code files
source("./code/retrieve.R")

# Grab all the top-level categories, clean, and thence get their subcategories!
main_categories <- get_categories()
subcats <- lapply(main_categories, loop_func, func = get_subcategories)

# Clean up the subcategory data, producing a list of vectors of subcategories
subcats <- lapply(subcats, function(x){
  if(length(x) == 0){
    return(character())
  }
  return(unlist(lapply(x, rlist::list.extract, "title")))
})

# Retrieve the actual pages, producing a data.frame of 2 columns -
# top-level category and page name
page_data <- mapply(function(category, subcats){
  
  # Get the pages, extract the titles and turn the titles overall into
  # a vector
  pages <- lapply(c(subcats, category), loop_func, func = get_pages) %>%
    unlist(recursive = FALSE) %>%
    lapply(rlist::list.extract, "title") %>%
    unlist
  
  # If there are no pages, silently return nothingness
  if(!length(pages)){
    return(NULL)
  }
  
  # Construct the data.frame and return it.
  return(data.frame(country = category,
                    page = pages,
                    stringsAsFactors = FALSE))
}, main_categories, subcats, SIMPLIFY = FALSE, USE.NAMES = FALSE) %>%
  do.call("rbind", .)

# De-duplicate the data
page_data <- page_data[!duplicated(page_data$page),]

# Clean the categories
page_data$country <- gsub(x = page_data$country, pattern = "(Category:| politicians)",
                          replacement = "")

# Awful impossible to manipulate code goes here; basically what I did was look at the unique
# values and manually, one by one, change all matching entries. Sometimes you can't automate things
# properly.
page_data$country[page_data$country == "Abkhaz"] <- "Abkhazia"
page_data$country[page_data$country == "Afghan"] <- "Afghanistan"
page_data$country[page_data$country == "Albanian"] <- "Albania"
page_data$country[page_data$country == "Algerian"] <- "Algeria"
page_data$country[page_data$country == "American"] <- "United States"
page_data$country[page_data$country == "Andorran"] <- "Andorra"
page_data$country[page_data$country == "Angolan"] <- "Angola"
page_data$country[page_data$country == "Argentine"] <- "Argentina"
page_data$country[page_data$country == "Armenian"] <- "Armenia"
page_data$country[page_data$country == "Australian"] <- "Australia"
page_data$country[page_data$country == "Austrian"] <- "Austria"
page_data$country[page_data$country == "Azerbaijani"] <- "Azerbaijan"
page_data$country[page_data$country == "Bahamian"] <- "Bahamas"
page_data$country[page_data$country == "Bahraini"] <- "Bahrain"
page_data$country[page_data$country == "Bangladeshi"] <- "Bangladesh"
page_data$country[page_data$country == "Barbadian"] <- "Barbados"
page_data$country[page_data$country == "Belarusian"] <- "Belarus"
page_data$country[page_data$country == "Belgian"] <- "Belgium"
page_data$country[page_data$country == "Belizean"] <- "Belize"
page_data$country[page_data$country == "Beninese"] <- "Benin"
page_data$country[page_data$country == "Bissau-Guinean"] <- "Guinea-Bissau"
page_data$country[page_data$country == "Bhutanese"] <- "Bhutan"
page_data$country[page_data$country == "Bolivian"] <- "Bolivia"
page_data$country[page_data$country == "Bosnia and Herzegovina"] <- "Bosnia-Herzegovina"
page_data$country[page_data$country == "Brazilian"] <- "Brazil"
page_data$country[page_data$country == "British"] <- "United Kingdom"
page_data$country[page_data$country == "Burmese"] <- "Myanmar"
page_data$country[page_data$country == "Bulgarian"] <- "Bulgaria"
page_data$country[page_data$country == "Burkinabé"] <- "Burkina Faso"
page_data$country[page_data$country == "Burundian"] <- "Burundi"
page_data$country[page_data$country == "Cambodian"] <- "Cambodia"
page_data$country[page_data$country == "Cameroonian"] <- "Cameroon"
page_data$country[page_data$country == "Canadian"] <- "Canada"
page_data$country[page_data$country == "Cape Verdean"] <- "Cape Verde"
page_data$country[page_data$country == "Chadian"] <- "Chad"
page_data$country[page_data$country == "Chilean"] <- "Chile"
page_data$country[page_data$country == "Chinese"] <- "China"
page_data$country[page_data$country == "Colombian"] <- "Colombia"
page_data$country[page_data$country == "Comorian"] <- "Comoros"
page_data$country[page_data$country == "Republic of the Congo"] <- "Congo"
page_data$country[page_data$country == "Democratic Republic of the Congo"] <- "Congo, Dem. Rep. of"
page_data$country[page_data$country == "Costa Rican"] <- "Costa Rica"
page_data$country[page_data$country == "Croatian"] <- "Croatia"
page_data$country[page_data$country == "Cuban"] <- "Cuba"
page_data$country[page_data$country == "Cypriot"] <- "Cyprus"
page_data$country[page_data$country == "Czech"] <- "Czech Republic"
page_data$country[page_data$country == "Danish"] <- "Denmark"
page_data$country[page_data$country == "Djiboutian"] <- "Djibouti"
page_data$country[page_data$country == "Dutch"] <- "Netherlands"
page_data$country[page_data$country == "Ecuadorian"] <- "Ecuador"
page_data$country[page_data$country == "Egyptian"] <- "Egypt"
page_data$country[page_data$country == "Emirati"] <- "United Arab Emirates"
page_data$country[page_data$country == "Equatoguinean"] <- "Equatorial Guinea"
page_data$country[page_data$country == "Eritrean"] <- "Eritrea"
page_data$country[page_data$country == "Ethiopian"] <- "Ethiopia"
page_data$country[page_data$country == "Estonian"] <- "Estonia"
page_data$country[page_data$country == "Fijian"] <- "Fiji"
page_data$country[page_data$country == "Filipino"] <- "Philippines"
page_data$country[page_data$country == "Finnish"] <- "Finland"
page_data$country[page_data$country == "French Guianan"] <- "French Guiana"
page_data$country[page_data$country == "French"] <- "France"
page_data$country[page_data$country == "Gabonese"] <- "Gabon"
page_data$country[page_data$country == "Gambian"] <- "Gambia"
page_data$country[page_data$country == "German"] <- "Germany"
page_data$country[page_data$country == "Ghanaian"] <- "Ghana"
page_data$country[page_data$country == "Greek"] <- "Greece"
page_data$country[page_data$country == "Grenadian"] <- "Grenada"
page_data$country[page_data$country == "Guadeloupean"] <- "Guadeloupe"
page_data$country[page_data$country == "Guatemalan"] <- "Guatemala"
page_data$country[page_data$country == "Guinean"] <- "Guinea"
page_data$country[page_data$country == "Guyanese"] <- "Guyana"
page_data$country[page_data$country == "Haitian"] <- "Haiti"
page_data$country[page_data$country == "Honduran"] <- "Hondura"
page_data$country[page_data$country == "Hungarian"] <- "Hungary"
page_data$country[page_data$country == "Icelandic"] <- "Iceland"
page_data$country[page_data$country == "Indian"] <- "India"
page_data$country[page_data$country == "Indonesian"] <- "Indonesia"
page_data$country[page_data$country == "Iranian"] <- "Iran"
page_data$country[page_data$country == "Iraqi"] <- "Iraq"
page_data$country[page_data$country == "Irish"] <- "Ireland"
page_data$country[page_data$country == "Jamaican"] <- "Jamaica"
page_data$country[page_data$country == "Israeli"] <- "Israel"
page_data$country[page_data$country == "Italian"] <- "Italy"
page_data$country[page_data$country == "Japanese"] <- "Japan"
page_data$country[page_data$country == "Jordanian"] <- "Jordan"
page_data$country[page_data$country == "Kazakhstani"] <- "Kazakhstan"
page_data$country[page_data$country == "Kenyan"] <- "Kenya"
page_data$country[page_data$country == "Korean"] <- "Korea, South"
page_data$country[page_data$country == "I-Kiribati"] <- "Kiribati"
page_data$country[page_data$country == "Kosovan"] <- "Kosovo"
page_data$country[page_data$country == "Kuwaiti"] <- "Kuwait"
page_data$country[page_data$country == "Kyrgyzstani"] <- "Kyrgyzstan"
page_data$country[page_data$country == "Laotian"] <- "Laos"
page_data$country[page_data$country == "Latvian"] <- "Latvia"
page_data$country[page_data$country == "Lebanese"] <- "Lebanon"
page_data$country[page_data$country == "Liberian"] <- "Liberia"
page_data$country[page_data$country == "Libyan"] <- "Libya"
page_data$country[page_data$country == "Lithuanian"] <- "Lithuania"
page_data$country[page_data$country == "Luxembourgian"] <- "Luxembourg"
page_data$country[page_data$country == "Macedonian"] <- "Macedonia"
page_data$country[page_data$country == "Malagasy"] <- "Madagascar"
page_data$country[page_data$country == "Malawian"] <- "Malawi"
page_data$country[page_data$country == "Malaysian"] <- "Malaysia"
page_data$country[page_data$country == "Maldivian"] <- "Maldives"
page_data$country[page_data$country == "Malian"] <- "Mali"
page_data$country[page_data$country == "Maltese"] <- "Malta"
page_data$country[page_data$country == "Marshallese"] <- "Marshall Islands"
page_data$country[page_data$country == "Martiniquais"] <- "Martinique"
page_data$country[page_data$country == "Mauritanian"] <- "Mauritania"
page_data$country[page_data$country == "Mauritian"] <- "Mauritius"
page_data$country[page_data$country == "Mexican"] <- "Mexico"
page_data$country[page_data$country == "Moldovan"] <- "Moldova"
page_data$country[page_data$country == "Monegasque"] <- "Monaco"
page_data$country[page_data$country == "Mongolian"] <- "Mongolia"
page_data$country[page_data$country == "Montenegrin"] <- "Montenegro"
page_data$country[page_data$country == "Moroccan"] <- "Morocco"
page_data$country[page_data$country == "Mozambican"] <- "Mozambique"
page_data$country[page_data$country == "Namibian"] <- "Namibia"
page_data$country[page_data$country == "Nauruan"] <- "Nauru"
page_data$country[page_data$country == "Nepalese"] <- "Nepal"
page_data$country[page_data$country == "Nicaraguan"] <- "Nicaragua"
page_data$country[page_data$country == "Nigerien"] <- "Niger"
page_data$country[page_data$country == "Nigerian"] <- "Nigeria"
page_data$country[page_data$country == "North Korean"] <- "Korea, North"
page_data$country[page_data$country == "Norwegian"] <- "Norway"
page_data$country[page_data$country == "Pakistani"] <- "Pakistan"
page_data$country[page_data$country == "Palestinian"] <- "Palestinian Territory"
page_data$country[page_data$country == "Panamanian"] <- "Panama"
page_data$country[page_data$country == "Papua New Guinean"] <- "Papua New Guinea"
page_data$country[page_data$country == "Paraguayan"] <- "Paraguay"
page_data$country[page_data$country == "Peruvian"] <- "Peru"
page_data$country[page_data$country == "Polish"] <- "Poland"
page_data$country[page_data$country == "Portuguese"] <- "Portugal"
page_data$country[page_data$country == "Qatari"] <- "Qatar"
page_data$country[page_data$country == "Romanian"] <- "Romania"
page_data$country[page_data$country == "Russian"] <- "Russia"
page_data$country[page_data$country == "Rwandan"] <- "Rwanda"
page_data$country[page_data$country == "Sammarinese"] <- "San Marino"
page_data$country[page_data$country == "São Tomé and Príncipe"] <- "Sao Tome and Principe"
page_data$country[page_data$country == "Saudi Arabian"] <- "Saudi Arabia"
page_data$country[page_data$country == "Senegalese"] <- "Senegal"
page_data$country[page_data$country == "Serbian"] <- "Serbia"
page_data$country[page_data$country == "Seychellois"] <- "Seychelles"
page_data$country[page_data$country == "Sierra Leonean"] <- "Sierra Leone"
page_data$country[page_data$country == "Singaporean"] <- "Singapore"
page_data$country[page_data$country == "Slovak"] <- "Slovakia"
page_data$country[page_data$country == "Slovenian"] <- "Slovenia"
page_data$country[page_data$country == "South African"] <- "South Africa"
page_data$country[page_data$country == "Somalian"] <- "Somalia"
page_data$country[page_data$country == "South Sudanese"] <- "South Sudan"
page_data$country[page_data$country == "Spanish"] <- "Spain"
page_data$country[page_data$country == "Sudanese"] <- "Sudan"
page_data$country[page_data$country == "Sri Lankan"] <- "Sri Lanka"
page_data$country[page_data$country == "Surinamese"] <- "Suriname"
page_data$country[page_data$country == "Swazi"] <- "Swaziland"
page_data$country[page_data$country == "Swedish"] <- "Sweden"
page_data$country[page_data$country == "Swiss"] <- "Switzerland"
page_data$country[page_data$country == "Syrian"] <- "Syria"
page_data$country[page_data$country == "Taiwanese"] <- "Taiwan"
page_data$country[page_data$country == "Tajikistani"] <- "Tajikistan"
page_data$country[page_data$country == "Tanzanian"] <- "Tanzania"
page_data$country[page_data$country == "Thai"] <- "Thailand"
page_data$country[page_data$country == "Togolese"] <- "Togo"
page_data$country[page_data$country == "Tongan"] <- "Tonga"
page_data$country[page_data$country == "Tunisian"] <- "Tunisia"
page_data$country[page_data$country == "Turkish"] <- "Turkey"
page_data$country[page_data$country == "Tuvaluan"] <- "Tuvalu"
page_data$country[page_data$country == "Ugandan"] <- "Uganda"
page_data$country[page_data$country == "Ukrainian"] <- "Ukraine"
page_data$country[page_data$country == "Uruguayan"] <- "Uruguay"
page_data$country[page_data$country == "Uzbekistani"] <- "Uzbekistan"
page_data$country[page_data$country == "Vanuatuan"] <- "Vanuatu"
page_data$country[page_data$country == "Venezuelan"] <- "Venezuela"
page_data$country[page_data$country == "Vietnamese"] <- "Vietnam"
page_data$country[page_data$country == "Yemeni"] <- "Yemen"
page_data$country[page_data$country == "Zambian"] <- "Zambia"
page_data$country[page_data$country == "Zimbabwean"] <- "Zimbabwe"

# Incorporate edit data
last_edit_data <- get_last_edit(page_data$page)
final_dataset <- merge(page_data, last_edit_data)

# Reorder to deal with Wikimedia's API...nonsense
final_dataset <- final_dataset[order(final_dataset$rev_id), ]

# Write out!
readr::write_csv(final_dataset, path = "./data/page_data.csv")