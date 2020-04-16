# README

App Idea:
*Food ordering app
​
Models:
​
*   USER: has_many ORDERS, has_many RATINGS, has_many MENU_ITEMS through ORDERS

*   ORDER: belongs_to USER, belongs_to MENU_ITEMS

*   RESTAURANT: has_many MENU_ITEMS
*   MENU_ITEMS: belongs_to RESTAURANT, has_many INGREDIENTS, has_many ORDERS, has_many USER through ORDERS
*   INGREDIENTS: belongs_to MENU_ITEMS

*   RATING: belongs_to USER, MENU_ITEM and RESTAURANT 

Deliverables: 
USER:

    DONE<!-- *User can able to view restaurants list -->
    DONE<!-- *User can choose restaurant and view their menu -->
    DONE*User can choose item(s) from menu
    *User can adjust ingredients in item
    DONE*User can add adjusted item to their order
    *User can have a 'favorites' page that stores restaurants/item that they 'like'
    *User can search for menu items. Search will generate list of restaurants with that menu item
​
RESTAURANT:
    <!-- **Shows their average rating -->
    DONE*Can have menu sections (burgers, salads, drinks)
    DONE*Can add/edit/delete items to menu
    <!-- *Showcase most popular item (based on most ordered history) -->
    *User can leave a rating on restraurant and restaurant item(s)
​
MENU:
    *Shows categories (burgers, salads, drinks)
    *Category shows top 3 items
    *Items are linked to item show page
​
ITEM: 
    DONE*displays item name, description, ingredients
    *ingredients can be removed or added onto item
​
ORDER:
    DONE*User can adjust quantity of menu items in order 
    <!-- *User can delete item from order -->
    <!-- *Displays all menu items with their quantities plus total price -->
    <!-- *Displays total menu price -->
    <!-- *Gives user a checkout -->
​
Stretch goal: 
​
*add instructions to cart
*delivery or pick up options
*user has order history and can reorder a specific order or order menu item
​
​
Seed Ideas:

