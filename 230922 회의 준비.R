listing <- read.csv(file.choose(), header=TRUE)
calendar <- read.csv(file.choose())

head(listing, 5)
head(calendar,5)

colnames(listing)
colnames(calendar)

str(listing)
str(calendar)

sum(is.na(listing))
sum(is.na(calendar))

# merge datas with column 'id' and 'listing_id'
merged <- merge(listing, calendar, by.x = "id", by.y = "listing_id")

head(merged, 5)
colnames(merged)
str(merged)
sum(is.na(merged))

columns_to_remove <- c("price.y", "minimum_nights.y")
merged_1 <- merged %>%
  select(-columns_to_remove)

colnames(merged_1)

merged_2 <- merged_1 %>%
  rename(
    "price" = "price.x",
    "minimum_nights" = "minimum_nights.x"
  )

colnames(merged_2)

merged_2[c("availability_365", "available")]  # 둘은 다른 의미를 띄고 있다. 똑같은 363도 f인지 t인지 다르기 때문



# 해야하는 것
# adjusted_price의 $ 없애고 int형으로 바꾸기기