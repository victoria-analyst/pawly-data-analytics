# A/B Test Plans — Pawly

## Test 1: "Add to Favourites" Button on Business Card

| | |
| **Start date** | TBD |
| **End date** | TBD |
| **Owner** | Viktoriia Serkova |

### Problem
Behavioral data analysis revealed critically low retention — users don't 
return to the site after their first visit. Currently there is no mechanism 
that lets users save interest in a business and creates a reason to come back.

### Goal
Increase the share of users who return to the site within 7 days of their 
first visit by **15%**.

### Hypothesis
If we add an "Add to Favourites" button to the business card, the share of 
users returning within 7 days will increase by 15%, because users will have 
a concrete reason to return — to view saved businesses and check their 
contacts/current offers.

> **Note:** Return visits may also be influenced by external factors 
> (seasonality, marketing emails) unrelated to the feature itself.

### Variants
- **A (Control):** business card without the "Add to Favourites" button
- **B (Treatment):** business card with "Add to Favourites" button and access to a favourites list

### Sample
- **Target audience:** all users viewing a business card
- **Traffic split:** 50% A / 50% B

### Metrics
- **Primary:** 7-day return visitor rate (return visitors / total visitors)
- **Secondary:** average session duration

### Test Plan
Two groups will participate: 50% of users will see the business card without 
the "Add to Favourites" button, 50% — with it. Test duration will be 
determined by the sample size required to detect a 20% lift in return visits 
at the target statistical power. Data will be collected via Google BigQuery 
and PostHog.

---

## Test 2: "Animal Type" Filter in Business Catalog

| | |
|---|---|
| **Start date** | TBD |
| **End date** | TBD |
| **Owner** | Viktoriia Serkova |

### Problem
The catalog does not allow filtering businesses by the type of animals they 
serve. Owners of non-standard pets (rodents, birds, reptiles, etc.) have to 
manually check each business profile to find out whether their pet is 
accepted — this lengthens the path to a relevant business and increases the 
risk of users leaving the catalog without finding one.

### Goal
Increase the share of catalog sessions that end in a business profile view 
by **10%**, particularly within the exotic pet owner segment.

### Hypothesis
If we add an "Animal Type" filter (including an "accepts exotic pets" 
option) to the catalog page, the catalog-to-profile click-through rate will 
increase by 10%, because users will be able to immediately filter out 
irrelevant businesses and find one that serves their pet type faster.

> **Note:** Conversion may also be affected by the overall number of 
> businesses in the catalog — in categories with few listings, the filter's 
> effect will be less noticeable simply due to limited choice.

### Variants
- **A (Control):** catalog without the "Animal Type" filter
- **B (Treatment):** catalog with the "Animal Type" / "accepts exotic pets" filter

### Sample
- **Target audience:** all users visiting the business catalog page
- **Traffic split:** 50% A / 50% B

### Metrics
- **Primary:** catalog-to-profile click-through rate (business profile views / catalog sessions)
- **Secondary:** catalog bounce rate (share of sessions with no interaction — no filter applied, no profile visited)

### Test Plan
Two groups will participate: 50% of users will see the catalog without the 
"Animal Type" filter, 50% — with it. Test duration will be determined by 
the sample size required to detect a 15% lift in catalog-to-profile CTR at 
the target statistical power, with a separate analysis of the segment that 
applied the exotic-pet filter. Data will be collected via PostHog and 
Google BigQuery.
