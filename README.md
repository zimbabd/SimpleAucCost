# SimpleAucCost

A lightweight World of Warcraft auction-house addon that summarizes your active auctions and estimates proceeds after the 5% auction-house cut.

## Features

- Counts your active auction lots.
- Adds together the Buyout prices for lots that have a Buyout price.
- Shows the estimated proceeds after the 5% auction-house cut.
- Updates when your owned-auction list refreshes or when you open the Auctions tab.
- Does not poll continuously or require external libraries.

The estimate assumes every listed auction sells for its Buyout price. It does not include listing deposits and is not a prediction of actual sales.

## Screenshots
<img width="1920" height="1200" alt="WoWScrnShot_101226_134058" src="https://github.com/user-attachments/assets/fb26f77b-db72-4b15-aa31-8c3f3e189651" />
<img width="1490" height="506" alt="изображение" src="https://github.com/user-attachments/assets/ef96be8e-9bea-462b-b79b-76317a19f8e7" />


## Installation

1. Copy the `SimpleAucCost` folder into your WoW `Interface/AddOns` folder.
2. Enable **SimpleAucCost** on the character selection screen.
3. Open the Auction House and select the **Auctions** tab. Refresh the owned-auction list if needed.

This addon targets the WoW client interface version `30300`.
