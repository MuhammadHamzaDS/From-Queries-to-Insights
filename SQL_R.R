install.packages(c("DBI", "RMariaDB", "dplyr", "ggplot2", "lubridate", "scales"))
library(DBI)
library(RMariaDB)
library(dplyr)
library(ggplot2)
library(lubridate)
library(scales)
# ya phir library(RMariaDB)

# Replace values with your MySQL setup
con <- dbConnect(
  RMySQL::MySQL(),
  dbname   = "ecommerce_db",  
  host     = "localhost",     
  port     = 3306,          
  user     = "root",        
  password = "lenovo&9090"  
)
dbListTables(con)

customers <- dbReadTable(con, "customers")
products <- dbReadTable(con, "products")
orders <- dbReadTable(con, "orders")
order_items <- dbReadTable(con, "order_items")
payments <- dbReadTable(con, "payments")
website_visits <- dbReadTable(con, "website_visits")


order_details <- orders %>%
  inner_join(order_items, by = "order_id") %>%
  inner_join(products, by = "product_id") %>%
  inner_join(customers, by = "customer_id")



top_products <- order_details %>%
  group_by(product_name) %>%
  summarise(total_sales = sum(price * quantity)) %>%
  arrange(desc(total_sales)) %>%
  head(5)

print(top_products)

# Plot
ggplot(top_products, aes(x = reorder(product_name, total_sales), y = total_sales, fill = product_name)) +
  geom_col() +
  coord_flip() +
  labs(title = "Top 5 Best Selling Products", x = "Product", y = "Total Sales (PKR)") +
  theme_minimal()




customer_segments <- orders %>%
  inner_join(customers, by = "customer_id") %>%
  group_by(name, membership_level) %>%
  summarise(total_spent = sum(total_amount)) %>%
  arrange(desc(total_spent))

print(customer_segments)

ggplot(customer_segments, aes(x = reorder(name, total_spent), y = total_spent, fill = membership_level)) +
  geom_col() +
  coord_flip() +
  labs(title = "Customer Spending by Membership Level", x = "Customer", y = "Total Spent (PKR)") +
  theme_minimal()



monthly_sales <- orders %>%
  mutate(month = floor_date(as.Date(order_date), "month")) %>%
  group_by(month) %>%
  summarise(monthly_total = sum(total_amount))

print(monthly_sales)

ggplot(monthly_sales, aes(x = month, y = monthly_total)) +
  geom_line(size = 1.2, color = "blue") +
  geom_point(size = 3, color = "darkblue") +
  scale_x_date(date_labels = "%b %Y") +
  labs(title = "Monthly Sales Trend", x = "Month", y = "Total Sales (PKR)") +
  theme_minimal()




payment_methods <- payments %>%
  group_by(payment_method) %>%
  summarise(total_paid = sum(amount_paid))

print(payment_methods)

ggplot(payment_methods, aes(x = "", y = total_paid, fill = payment_method)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  labs(title = "Payment Methods Used") +
  theme_void()





visits_summary <- website_visits %>%
  group_by(customer_id) %>%
  summarise(visits = n())

print(visits_summary)

ggplot(visits_summary, aes(x = factor(customer_id), y = visits)) +
  geom_col(fill = "orange") +
  labs(title = "Website Visit Frequency per Customer", x = "Customer ID", y = "Number of Visits") +
  theme_minimal()
